# Minimal static file server (TcpListener-based, no admin / no URL ACL needed)
$ErrorActionPreference = "Stop"
$root = Split-Path -Parent $MyInvocation.MyCommand.Path
$port = 5500

$mime = @{
  ".html"="text/html; charset=utf-8"; ".css"="text/css; charset=utf-8";
  ".js"="application/javascript; charset=utf-8"; ".json"="application/json";
  ".svg"="image/svg+xml"; ".png"="image/png"; ".jpg"="image/jpeg";
  ".jpeg"="image/jpeg"; ".gif"="image/gif"; ".ico"="image/x-icon";
  ".webp"="image/webp"; ".woff2"="font/woff2"; ".txt"="text/plain; charset=utf-8"
}

$listener = [System.Net.Sockets.TcpListener]::new([System.Net.IPAddress]::Loopback, $port)
$listener.Start()
Write-Host "Serving $root on http://localhost:$port/"

while ($true) {
  $client = $listener.AcceptTcpClient()
  try {
    $stream = $client.GetStream()
    $stream.ReadTimeout = 4000   # don't let speculative/idle sockets block the accept loop
    $reader = [System.IO.StreamReader]::new($stream)
    $requestLine = $reader.ReadLine()
    if (-not $requestLine) { $client.Close(); continue }

    $parts = $requestLine.Split(" ")
    $url = if ($parts.Length -ge 2) { $parts[1] } else { "/" }
    $path = $url.Split("?")[0]
    if ($path -eq "/") { $path = "/index.html" }
    $path = [System.Uri]::UnescapeDataString($path)

    $file = Join-Path $root ($path.TrimStart("/"))
    $full = [System.IO.Path]::GetFullPath($file)

    if ($full.StartsWith([System.IO.Path]::GetFullPath($root)) -and (Test-Path $full -PathType Leaf)) {
      $bytes = [System.IO.File]::ReadAllBytes($full)
      $ext = [System.IO.Path]::GetExtension($full).ToLower()
      $ct = if ($mime.ContainsKey($ext)) { $mime[$ext] } else { "application/octet-stream" }
      $header = "HTTP/1.1 200 OK`r`nContent-Type: $ct`r`nContent-Length: $($bytes.Length)`r`nCache-Control: no-cache`r`nConnection: close`r`n`r`n"
      $hb = [System.Text.Encoding]::ASCII.GetBytes($header)
      $stream.Write($hb, 0, $hb.Length)
      $stream.Write($bytes, 0, $bytes.Length)
    } else {
      $body = [System.Text.Encoding]::UTF8.GetBytes("404 Not Found: $path")
      $header = "HTTP/1.1 404 Not Found`r`nContent-Type: text/plain`r`nContent-Length: $($body.Length)`r`nConnection: close`r`n`r`n"
      $hb = [System.Text.Encoding]::ASCII.GetBytes($header)
      $stream.Write($hb, 0, $hb.Length)
      $stream.Write($body, 0, $body.Length)
    }
    $stream.Flush()
  } catch {} finally { $client.Close() }
}

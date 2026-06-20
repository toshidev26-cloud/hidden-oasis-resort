# Hidden Oasis Resort — Website

A stunning, fully responsive **single-file** website for **Hidden Oasis Resort** — a boutique 3-star resort & café bar in Gingoog City, Misamis Oriental, Philippines.

> *"Your Secret Paradise in the Heart of Mindanao"*

Everything (HTML + CSS + JS) lives in **`index.html`**. No build tools, no frameworks, no npm — just open it. It's ready to drop straight onto GitHub Pages.

## Features

- Full-screen **parallax hero** with floating leaf particles
- **Sticky navbar** that turns solid + blurred on scroll (mobile hamburger menu)
- **Room carousel** with arrow navigation and scroll-snap
- **Amenities** icon grid (Font Awesome)
- **Experiences** cards — Tiklas Falls, Café Bar, Nature & Relaxation
- **Masonry gallery** with hover-zoom captions
- **Testimonials** with 5-star ratings
- Embedded **Google Map** + full address & check-in/out
- **Booking request form** — dates, room, guests & contact, emailed straight to the resort (with a Messenger fallback) + floating Book Now button
- **Scroll-reveal** animations throughout · mobile-first (looks great at 375px)
- Respects `prefers-reduced-motion`

## View it locally

Just double-click `index.html`. (Optional: a tiny `serve.ps1` PowerShell static server is included for local previewing on Windows — run `powershell -ExecutionPolicy Bypass -File serve.ps1` then open <http://localhost:5500>.)

## ✅ Before you go live — replace these placeholders

1. **Photos** — ✅ real resort photos are now in the `images/` folder and used across the hero, about, rooms, experiences, and gallery. The **only** remaining placeholder is the *Tiklas Falls* experience card (it's an off-site attraction) — add a real falls photo as `images/tiklas-falls.jpg` and point that one `placehold.co` image at it when you have one.
2. **Phone & email** — ✅ set to the real ones from the business card: `0954 337 2811` (`tel:+639543372811`) and `hiddenoasisresort@gmail.com`.
4. **Room rates** — indicative ₱ prices are shown; update to your real rates (search `room__price`).
5. **Confirm socials** — Facebook `facebook.com/p/Hidden-Oasis-61570854084881` and Instagram `@hiddenoasisph` are wired in; update if they change.
6. **Logo (optional)** — the navbar/footer currently use a built-in **inline SVG recreation** of your logo (so the site stays a single file with no broken images). To use your exact logo file instead: save it as `images/logo.png`, then replace the `<svg class="brandmark">…</svg>` block in the navbar and footer with `<img class="brandmark" src="images/logo.png" alt="Hidden Oasis Resort">`. The whole colour scheme is already matched to your logo.

## 📬 Booking form — one-time setup (free)

The **Request a Booking** section emails each request straight to an inbox using [Web3Forms](https://web3forms.com) (free, no backend, 250 submissions/month). To switch it on:

1. Go to <https://web3forms.com>, enter the email that should **receive** the bookings (e.g. `hiddenoasisresort@gmail.com`, or your own while testing).
2. Copy the **Access Key** they give you.
3. In `index.html`, find `YOUR_WEB3FORMS_ACCESS_KEY` and replace it with that key.
4. Commit & push — done. Send yourself a test request to confirm.

Until the key is added, the booking button still works — it gracefully falls back to opening Facebook Messenger. (Note: real-time availability + online payment would need a paid booking engine like Lodgify/Sirvoy; this free form captures requests for you to confirm manually.)

## 🌐 Publishing (free)

- **Netlify Drop** — drag the folder onto <https://app.netlify.com/drop>.
- **GitHub Pages** — push `index.html` to a repo → Settings → Pages → deploy from branch.
- **Cloudflare Pages** / **Vercel** — connect the repo.

Then point a custom domain (e.g. `hiddenoasisresort.ph`) at it.

## Details baked into the site

- **Address:** Purok 2, Naranjita St., Paz Village, Brgy. 24-A, Gingoog City, Misamis Oriental, Northern Mindanao
- **Type:** 3-star resort hotel & café bar · 9 rooms
- **Coordinates:** 8.8226635, 125.0979409
- **Nearest airport:** Butuan Airport (~1 hr 23 min)
- **Near:** Tiklas Falls (~5 min), Bible Baptist Church
- **Check-in / out:** 2:00 PM / 11:00 AM
- **Fonts:** Playfair Display + Lato
- **Brand palette (from your logo):** deep teal-navy `#1e3a47` · warm orange `#e8884a` · palm green `#3a6b4f` · ivory `#f5f0e8`

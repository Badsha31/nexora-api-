# Nexora Web — Full-Stack Premium Website

A premium multi-page business website for Nexora Web with a lightweight Node.js backend, responsive server-rendered pages, project/contact/newsletter APIs, JSON persistence, validation and security headers.

## Run

Requires Node.js 20+.

```bash
npm start
```

Open `http://localhost:4173/`.

## Routes

- `/` — Home
- `/services` and `/services/:slug`
- `/solutions` and `/solutions/:slug`
- `/work` and `/work/:slug`
- `/process`
- `/about`
- `/insights` and `/insights/:slug`
- `/contact`
- `/start-project`
- `/privacy`
- `/terms`

## API

- `GET /api/health`
- `POST /api/projects`
- `POST /api/contact`
- `POST /api/newsletter`

Submitted form data is stored in `data/*.json` for this demo. For production, replace the JSON storage adapter with a managed database/CRM and transactional email provider.

## Design

White foundation, electric-purple accent, editorial typography, restrained motion, CSS-only visuals and mobile-first responsive behavior.

Made by Nexora Web.
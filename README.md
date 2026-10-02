# Nexora Web — Cloudflare Full-Stack

Premium white + electric-purple multi-page business website for Nexora Web, configured for Cloudflare Workers with D1 as an optional later persistence layer.

## Stack

- Cloudflare Workers runtime
- Wrangler for local development, migrations and deployment
- Server-rendered HTML for the marketing pages
- No Node.js filesystem dependency in the deployed Worker

The deployed Worker does not require a D1 binding. Wrangler JSON config is the recommended configuration format for new Worker projects. D1 can be added later when persistent form storage is needed.

## 1. Install

Requires Node.js 20+.

```bash
npm install
```

## 2. Authenticate Wrangler

```bash
npx wrangler login
```

## 3. Local development

```bash
npm run dev
```

## 4. Deploy

```bash
npm run deploy
```

A `workers.dev` endpoint will be created automatically unless you attach a custom domain.

## Optional D1 later

When persistent project/contact/newsletter storage is needed, add a D1 binding named `DB` and apply the included migration before deploying.

## Routes

- `/`
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

The form APIs validate input and return structured JSON errors. Persistent storage is intentionally disabled until a D1 binding is added. The Worker also sends security headers on HTML and API responses. The lightweight in-isolate request guard is only a backstop; Cloudflare WAF / Rate Limiting should be enabled for public production traffic.

## Custom domain

For production, attach a Cloudflare Custom Domain to the Worker rather than relying on the `workers.dev` hostname.

## Notes

The older `server.js` remains in the repository as a Node-compatible reference, but Cloudflare deployment uses `worker.js` via `wrangler.jsonc`. The included D1 migration is retained for a future persistence setup.

Made by Nexora Web.
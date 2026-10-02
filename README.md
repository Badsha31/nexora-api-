# Nexora Web — Cloudflare Full-Stack

Premium white + electric-purple multi-page business website for Nexora Web, now configured for Cloudflare Workers + D1.

## Stack

- Cloudflare Workers runtime
- Cloudflare D1 for project/contact/newsletter storage
- Wrangler for local development, migrations and deployment
- Server-rendered HTML for the marketing pages
- No Node.js filesystem dependency in the deployed Worker

Cloudflare Workers can deploy Worker code and static assets together, while D1 is exposed to the Worker through a binding. Wrangler JSON config is the recommended configuration format for new Worker projects. See the Cloudflare docs linked below.

## 1. Install

Requires Node.js 20+.

```bash
npm install
```

## 2. Authenticate Wrangler

```bash
npx wrangler login
```

## 3. Create the production D1 database

```bash
npx wrangler d1 create nexora-web-db
```

Copy the returned `database_id` into `wrangler.jsonc` where `REPLACE_WITH_YOUR_D1_DATABASE_ID` appears.

## 4. Apply the production migration

```bash
npm run d1:apply
```

## 5. Local development

```bash
npm run dev
```

## 6. Deploy

```bash
npm run deploy
```

A `workers.dev` endpoint will be created automatically unless you attach a custom domain.

## Cloudflare dashboard option

You can also create the Worker and D1 database in the Cloudflare dashboard. Bind the D1 database using the binding name `DB`, then deploy the Worker with Wrangler.

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

The form APIs validate input, return structured JSON errors, and persist approved submissions into D1. The Worker also sends security headers on HTML and API responses. The lightweight in-isolate request guard is only a backstop; Cloudflare WAF / Rate Limiting should be enabled for public production traffic.

## Custom domain

For production, attach a Cloudflare Custom Domain to the Worker rather than relying on the `workers.dev` hostname.

## Notes

The older `server.js` remains in the repository as a Node-compatible reference, but Cloudflare deployment uses `worker.js` via `wrangler.jsonc`.

Made by Nexora Web.
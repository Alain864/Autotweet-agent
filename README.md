# Autotweet Agent

Simple self-hosted n8n setup to generate and publish daily tweet-style content.

## Project structure

```text
autotweet-agent/
├── docker/
│   ├── Dockerfile
│   └── docker-compose.yml
├── n8n/
│   └── workflows/
│       ├── daily-popular-tweet-test.json
│       └── daily-popular-tweet-test-v2.json
├── prompts/
│   └── support_system_prompt.txt
├── scripts/
│   ├── export_workflows.sh
│   └── import_workflows.sh
└── README.md
```

## What you run

1. Start stack (n8n + worker + Postgres + Redis):

```bash
docker compose -f docker/docker-compose.yml up -d --build
```

2. Open n8n at `http://localhost:5678`.

3. Import workflows from repo files:

```bash
./scripts/import_workflows.sh
```

4. Configure credentials in n8n (`Post to X` node) and activate workflow.

## Workflow options

- `daily-popular-tweet-test.json`: minimal baseline.
- `daily-popular-tweet-test-v2.json`: recommended simple safeguards.

## Helper scripts

- `./scripts/import_workflows.sh`: imports all JSON files from `n8n/workflows/` into n8n.
- `./scripts/export_workflows.sh`: exports current n8n workflows back into `n8n/workflows/`.

## Environment notes

`docker/docker-compose.yml` sets default basic auth:

- `N8N_BASIC_AUTH_USER=admin`
- `N8N_BASIC_AUTH_PASSWORD=change-me`

It also defaults Postgres credentials for local testing:

- `POSTGRES_DB=n8n`
- `POSTGRES_USER=n8n`
- `POSTGRES_PASSWORD=n8n`

Set stronger values in your shell or an env file before running in real environments.

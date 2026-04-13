# homebrew-moxy

Homebrew tap for [moxy](https://github.com/amarbel-llc/moxy) — an MCP proxy
that aggregates multiple child MCP servers into a single unified server.

## Install

```sh
brew tap oven-sh/bun       # required for bun dependency
brew tap amarbel-llc/moxy
brew install moxy
```

## Included moxins

The formula ships with these moxins (declarative MCP tool plugins):

| Moxin | Description | Deps |
|-------|-------------|------|
| env | Environment inspection | (none) |
| folio | File I/O (CWD-scoped) | jq, coreutils |
| folio-external | File I/O (any path) | jq, coreutils |
| freud | Past session transcripts | python3 |
| grit | Git operations | git, jq |
| jq | jq filter execution | jq |
| rg | Ripgrep code search | ripgrep |
| get-hubbed | GitHub (current repo) | gh, jq, bun |
| get-hubbed-external | GitHub (other repos) | gh, jq, bun |
| hamster | Go package docs | go, bun |

Moxins requiring nix (chix, just-us-agents, man) or other non-Homebrew
deps (jira, sisyphus) are not included.

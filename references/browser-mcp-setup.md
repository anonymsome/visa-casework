# Browser MCP setup

Optional. Without it the user gets the drafts and the form URL and fills the
form by hand — a fine path, not a degraded one. Do not oversell this step or
stall the casework on it.

With it, the plugin can fill the member's casework form in the user's own
browser, in their own logged-in session, and stop before submit.

## Why this server

Browser MCP drives the user's existing Chrome session rather than a fresh
headless one. A form behind a login or a CAPTCHA just works. It runs
locally, so page content goes to the user's machine and not to a remote
browser service.

## Agent check — run this before assuming anything

Browser MCP has two halves and users routinely complete one and believe they
are done:

1. the **Chrome extension**, connected on a tab
2. the **MCP server**, registered with Claude Code

Clicking Connect in the extension does nothing for Claude Code if the server
was never registered. Check the server side by whether `browser_*` tools are
actually available to you in this session. Do not take "I started it" as
confirmation — check, and if the tools are absent, say so plainly and walk
the user through whichever half is missing.

MCP servers are enumerated when a session starts. After registering the
server, Claude Code must be restarted before the tools appear. There is no
way to hot-load it into a running session.

## Install — extension half

1. Go to https://browsermcp.io/
2. Click **Add to Chrome**. This opens the Chrome Web Store listing.
3. Click **Add to Chrome** on the store page, and confirm the permission
   prompt.

## Install — server half

Register the server with Claude Code. Either write the config:

```json
{
  "mcpServers": {
    "browsermcp": {
      "command": "npx",
      "args": ["@browsermcp/mcp@latest"]
    }
  }
}
```

placed in `.mcp.json` in the project (shared with anyone who clones it), or
in `~/.claude.json` under the user's own config (private to them).

Or let the CLI write it:

```
claude mcp add browsermcp -- npx @browsermcp/mcp@latest
```

Add `--scope project` to write `.mcp.json` instead of user config.

`npx` fetches the package on first run, so the first start is slow and needs
network. Node and npm must be installed.

## Connect

1. **Restart Claude Code.** The server is only picked up at session start.
2. Back in Chrome, open the tab you want to hand over — for this plugin,
   that is the member's casework form.
3. Click the Browser MCP extension icon in the toolbar.
4. Click **Connect**.

The extension connects per tab. Switching to a different tab means
connecting again on that tab.

## Verify

`claude mcp list` should show `browsermcp` as connected, and `browser_*`
tools should be available in the session. If the server is listed but
failing, `claude mcp get browsermcp` shows the configured command, and
running `npx @browsermcp/mcp@latest` by hand surfaces the startup error.

## When done

Disconnect the extension from the tab. The connection is a live handle on a
browser session that is logged into things.

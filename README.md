# visa-casework

A Claude Code plugin that helps one person file one congressional casework request about U.S. nonimmigrant visa appointment unavailability.

If you hold a nonimmigrant status (H-1B, L-1, F-1, O-1, TN, J-1, and others) and you can't leave the country because there's no realistic consular appointment to get stamped and come back, your U.S. Representative's office handles exactly this kind of problem. It's free, it's routine casework, and almost nobody in this situation uses it.

This plugin walks you through it: find your district, pick the right office, assemble the facts, draft the request in the framing caseworkers actually respond to, fill the form, call the district office, and track the follow-up.

**Status: early. Nothing below is built yet — this README is the spec.**

## What it can't do

Read this part before anything else.

- **It is not legal advice.** It's a drafting and process tool. For anything touching your status, your travel plans, or your employer's filings, talk to an immigration attorney.
- **A congressional office cannot issue you a visa, order a consulate to do anything, or create an appointment.** What it can do is open an inquiry with the State Department, ask for an expedite to be considered, and get you an actual answer instead of a portal that never loads. That's worth real money and it's the honest ceiling.
- **It won't submit anything for you.** The browser step stops at a filled form. You read it, you fix it, you click submit. Congressional casework forms require a signed Privacy Act authorization — that's your signature, not an agent's.
- **It won't invent hardship.** Every fact in the draft comes from you. If you haven't been separated from family for two years, the draft won't say you have. Caseworkers read a lot of these and a fabricated one burns your credibility and everyone else's.

## Design rule: one person, one case

This is a tool for an individual constituent with a real problem, and it's deliberately built to resist being anything else.

- One case per run. No batching, no list of addresses, no generated personas.
- No template-identical mass mail. Every draft is built from your specific facts, in your words where possible.
- One office at a time. Congressional offices explicitly say duplicate inquiries across multiple offices don't speed a case up, and they can tangle it. Start with your House member; escalate to a senator later if you get nothing.

Astroturfing a congressional office is both ineffective and a bad thing to do. If you want this repo for that, it won't help you.

## How it works

```
/visa-casework
```

Then, roughly:

1. **Locate.** You give a ZIP code. The plugin resolves it to a congressional district via the official House lookup, and pulls the member's casework page, federal-agency form URL, and district office phone. ZIP-to-district isn't always one-to-one; when it's ambiguous you get asked for enough address to disambiguate, and nothing more.
2. **Intake.** A short interview: your status category, where you'd need to interview, how long you've been unable to travel, what's waiting on the other side (family, a funeral, a sick parent, a wedding you've now missed twice), what you've already tried. It asks for the concrete thing, because the concrete thing is what moves.
3. **Draft.** Builds the casework request. The framing is fixed and it matters: you're not asking anyone to approve a visa. You're a constituent lawfully working, studying, or living in the U.S. who is functionally unable to leave and return because appointments don't exist. That's a hardship an office can inquire about. "Please approve my visa" is a request they have to decline.
4. **File.** With [Browser MCP](https://browsermcp.io/) connected, it opens the member's federal-agency assistance form and fills the fields from your intake. You review every field and submit yourself.
5. **Call.** Generates a 30-second phone script for the district office, to use a day or two after you submit. Referencing a submitted case by name gets you further than a cold call.
6. **Follow up.** Writes a local tracking file with dates, who you talked to, and what they said. Prompts you at the two-week mark about whether to escalate to a senator.

## Layout

```
visa-casework/
  .claude-plugin/plugin.json
  skills/
    visa-casework/SKILL.md      # the interview and the flow
  templates/
    casework-request.md         # the main written request
    phone-script.md             # district office call, ~30 seconds
    followup-email.md           # nudge when nothing comes back
    senator-escalation.md       # after the House office goes quiet
    expedite-note.md            # if your facts support an expedite ask
  references/
    framing.md                  # why hardship framing beats a visa request
    what-offices-can-do.md      # the real scope of casework
    privacy-act.md              # the release you'll sign, in plain words
  commands/
    visa-casework.md
```

## Install

Not published yet. Once it is:

```
/plugin marketplace add <this-repo>
/plugin install visa-casework
```

### Browser MCP

Optional. Without it you get the drafts and the URLs and you fill the form by hand, which is fine.

With it, the plugin can fill the form for you. Set it up from [browsermcp.io](https://browsermcp.io/): install the Chrome extension, add the MCP server, then hit Connect on the tab you want to hand over.

Browser MCP is the right fit here for two reasons. It drives your own browser with your own session, so a form that wants you logged in or past a CAPTCHA just works. And it's local — the page content goes to your machine, not to a remote browser service. Disconnect the extension when you're done.

## Your data

Everything stays on your machine. The intake, the draft, and the tracking file are local files. Nothing is uploaded anywhere by this plugin; the only thing that leaves is what you personally submit to a congressional office through their own form.

Don't put passport numbers, receipt numbers, or your A-number into the drafts. The casework form asks for those separately, at submission time, over their connection. The plugin will tell you to leave them out.

## Contributing

Useful things to send:

- Corrections to the framing or the process. If you've actually filed one of these, what happened is worth more than anything in `references/`.
- Templates for situations not covered — dependents stuck abroad, a spouse's status tied to yours, a pending 221(g).
- Anything that's out of date. Consular policy, expedite criteria, and third-country rules change often, and a confidently wrong README is worse than no README.

Don't send anything that turns this into a bulk-submission tool.

## License

CC-BY-NC 4.0

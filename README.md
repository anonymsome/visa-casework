# visa-casework

A Claude Code plugin that helps one person file one congressional casework request about U.S. nonimmigrant visa appointment unavailability.

If you hold a nonimmigrant status (H-1B, L-1, F-1, O-1, TN, J-1, and others) and you can't leave the country because there's no realistic consular appointment to get stamped and come back, your U.S. Representative's office handles exactly this kind of problem. It's free, it's routine casework, and almost nobody in this situation uses it.

This plugin walks you through it: find your district, pick the right office, assemble the facts, draft the request in the framing caseworkers actually respond to, fill the form, call the district office, and track the follow-up.

**Status: early but working.** The flow has been run end to end against live
House casework pages and a real filing. Appointment-availability claims were
verified in September 2026; the broader process claims in `references/`
(expedite criteria, casework scope) have not been checked against primary
State Department sources — see Contributing.

## What it can't do

Read this part before anything else.

- **It is not legal advice.** It's a drafting and process tool. For anything touching your status, your travel plans, or your employer's filings, talk to an immigration attorney.
- **A congressional office cannot issue you a visa, order a consulate to do anything, or create an appointment.** What it can do is open an inquiry with the State Department, ask for an expedite to be considered, and get you an actual answer instead of a portal that never loads. That's worth real money and it's the honest ceiling.
- **It won't submit anything for you.** The browser step stops at a filled form. You read it, you fix it, you click submit. Congressional casework forms require a signed Privacy Act authorization — that's your signature, not an agent's.
- **It won't invent hardship.** Every fact in the draft comes from you. If you haven't been separated from family for two years, the draft won't say you have. Caseworkers read a lot of these and a fabricated one burns your credibility and everyone else's.

## Will this put my status at risk?

The most common reason people in this situation don't contact anyone isn't
that they haven't heard of casework. It's the fear that asking makes them a
target — or, quieter and more common, a sense that they have no standing to
ask at all.

**You are a constituent.** Congressional offices serve the people who live in
the district. Voting has nothing to do with it, and immigration casework is
one of the largest categories of work these offices do. Your request would
not be unusual.

**An inquiry is a question, not a referral.** The office asks the State
Department's congressional liaison what's happening with your case. It has no
enforcement role and no authority to adjudicate anything. It can't make a
decision go against you any more than it can make one go for you.

**The default answer is that filing is fine.** For most people in this
situation there's nothing unusual in the record at all, and the plugin says
so specifically rather than leaving you to wonder.

It runs an actual check before you file, against a concrete list — time out
of status, unauthorized work, a prior refusal or unresolved 221(g), removal
proceedings, a criminal charge, status expiring soon, a dispute over your
employer's filings, an unsatisfied J-1 home-residency requirement — and tells
you the result. If none of it applies, it says the file is clean and it's
okay to submit. If something does apply, it names that specific thing and
suggests an immigration attorney look first — not because asking is
dangerous, but because you should know what's in your own file before
inviting a look at it. It still writes your request either way; it doesn't
gatekeep.

What it won't do is hand you a vague "consult an attorney if it's
complicated." You can't assess that, it reads as a hint that something is
wrong with you, and it's the single most common reason people draft one of
these and never send it.

Nothing here is legal advice or a guarantee. The full version, including what
belongs in a draft and what doesn't, is in `references/is-it-safe.md`.

## Design rule: one person, one case

This is a tool for an individual constituent with a real problem, and it's deliberately built to resist being anything else.

- One case per run. No batching, no list of addresses, no generated personas.
- No template-identical mass mail. Every draft is built from your specific facts, in your words where possible — and deliberately varied in structure, not just in filled-in blanks. A companion `casework-voice` skill enforces this: two people with identical situations get letters that differ in shape. A caseworker who recognizes a template stops reading the facts inside it, which is bad for you and worse for the next person.
- One office at a time. Congressional offices explicitly say duplicate inquiries across multiple offices don't speed a case up, and they can tangle it. Start with your House member; escalate to a senator later if you get nothing.

Astroturfing a congressional office is both ineffective and a bad thing to do. If you want this repo for that, it won't help you.

## How it works

```
/visa-casework
```

Then:

0. **Onboarding.** What the tool is, and the honest ceiling: a congressional
   office can open an inquiry, not issue a visa. It also raises the question
   most people carry silently — whether reaching out puts their status at
   risk — rather than waiting for you to ask.
1. **Locate.** You give a ZIP code. The plugin resolves it to a congressional
   district via the official House lookup. ZIP-to-district isn't always
   one-to-one; when it's ambiguous you get asked for enough address to
   disambiguate, and nothing more.
2. **Read the form, build a checklist.** Before asking you anything, it goes
   and reads your member's actual casework form and writes down what that
   office requires. Offices differ more than you'd expect — some use the
   House-wide system, some run their own, the fields vary, and some gate on
   address verification before showing you anything. You get a checklist up
   front so you know what to have in front of you.
3. **Intake.** An interview driven by that checklist plus what the letter
   needs — not a fixed questionnaire. A few questions at a time, and "I don't
   know" is a complete answer. It asks for the concrete thing, because the
   concrete thing is what moves.
4. **Draft.** Builds the request in your own words and in a structure chosen
   for your situation. The framing is fixed and it matters: you're not asking
   anyone to approve a visa. You're a constituent lawfully working, studying,
   or living in the U.S. who can't leave and return because appointments
   don't exist. That's something an office can inquire about. "Please approve
   my visa" is a request they have to decline.
5. **Concern check.** Before anything is filed, it checks your situation
   against a concrete list of things that would genuinely warrant a lawyer
   first, and tells you the result either way. Most people get told their
   file is clean and it's okay to submit.
6. **File.** With [Browser MCP](https://browsermcp.io/) connected, it opens
   the form and fills the factual fields. You enter your own identifiers,
   solve the captcha, and submit. It stops before the submit button, every
   time.
7. **Call.** A 30-second script for the district office, to use a day or two
   after you submit. Referencing a submitted case by name gets you further
   than a cold call.
8. **Follow up.** A local tracking file with dates, who you talked to, and
   what they said. Note that for many offices submitting the form isn't the
   end — staff contact you, and the inquiry only starts once you sign the
   release they send. The plugin tells you which pattern your office uses.

## Layout

```
visa-casework/
  .claude-plugin/plugin.json
  commands/
    visa-casework.md
  skills/
    visa-casework/SKILL.md      # onboarding, the interview, the flow
    casework-voice/SKILL.md     # voice + anti-template rules for drafting
  templates/
    casework-request.md         # the main written request
    phone-script.md             # district office call, ~30 seconds
    followup-email.md           # nudge when nothing comes back
    senator-escalation.md       # after the House office goes quiet
    expedite-note.md            # if your facts support an expedite ask
  references/
    intake.md                   # what to ask, and how to ask it
    is-it-safe.md               # the risk question, answered honestly
    the-form.md                 # how House casework forms actually behave
    framing.md                  # why hardship framing beats a visa request
    what-offices-can-do.md      # the real scope of casework
    the-form.md                 # how the House casework form behaves
    privacy-act.md              # the release you'll sign, in plain words
    browser-mcp-setup.md        # optional browser automation
  output/                       # your drafts — gitignored, never committed
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

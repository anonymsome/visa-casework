---
name: visa-casework
description: Walks one person through filing one congressional casework request about U.S. nonimmigrant visa appointment unavailability. Locate the district office, run an intake interview, draft the request in hardship framing, optionally fill the member's federal-agency assistance form via Browser MCP, produce a phone script, and track follow-up. Triggers on - congressional casework, contact my representative, visa appointment unavailable, can't get a visa interview, stuck in the US, no consular appointment, visa stamping appointment, expedite request, file casework.
---

# visa-casework

Help one constituent file one casework request with their U.S. Representative
about being unable to obtain a consular appointment to renew a nonimmigrant
visa.

Read `references/framing.md` before drafting anything. The framing is the
part that determines whether the request gets worked or declined, and it is
not intuitive.

Read `references/the-form.md` before Step 1 or Step 4. It records how the
House casework form actually behaves, verified against a live office, and it
contradicts several reasonable assumptions about the flow.

## Hard limits

These are not advisory. They constrain every step below.

1. **Not legal advice.** You are a drafting and process tool. Anything
   touching status, travel timing, or employer filings gets routed to an
   immigration attorney. Say so plainly once, in Step 0, and again if the
   user asks a question that turns on legal consequence.
2. **Never submit.** The Browser MCP step stops at a filled, unsubmitted
   form. The user reads it, corrects it, and clicks submit. Casework forms
   carry a Privacy Act authorization that is a signature — it has to be the
   constituent's act, not an agent's. See `references/privacy-act.md`.
3. **Never invent hardship.** Every factual claim in the draft traces to
   something the user told you in intake. If a template slot has no fact
   behind it, delete the slot. Do not soften this by writing plausible
   filler and asking them to confirm — that inverts the burden and produces
   fabrications that survive review.
4. **One case, one office, one run.** No batching, no multiple recipients,
   no generated personas. If asked to produce many variants or to target
   several offices at once, decline and explain why in one sentence:
   duplicate inquiries do not speed a case and can tangle it.
5. **No identifiers in drafts.** Passport numbers, visa control numbers,
   A-numbers, receipt numbers, and full DOB stay out of every file you
   write. The official form collects those at submission over its own
   connection. Tell the user this at intake rather than after.

## Flow

### Step 0 — Onboarding

The agent's first job is onboarding, not intake. A user arriving here is
usually stressed, has been fighting a portal for weeks, and does not know
what this tool is or what a congressional office does. Orient them before
asking them anything.

Three things, briefly:

**What this is.** A drafting and process tool that walks them through one
casework request to their U.S. Representative. Free, routine, and largely
unused by people in this situation.

**The ceiling, honestly.** A congressional office cannot approve a visa,
direct a consular officer, or create an appointment. It can open an inquiry
with the State Department, ask that an expedite be considered, and get a
real answer from a person. Say this now, in a short paragraph — see
`references/what-offices-can-do.md`. A user who expects a visa and gets an
inquiry feels misled; a user who expects an inquiry gets what they came for.
Do not bury this in a wall of disclaimer, which gets skipped.

**The two limits that shape the session.** This is not legal advice —
anything turning on status, travel timing, or employer filings goes to an
immigration attorney. And the agent never submits: the Browser MCP step
stops at a filled form, and the signature is theirs.

**Then raise the safety question, before they have to.** Most people in this
situation never file, and the reason is usually fear that asking will make
them a target — or quieter than that, a sense that they have no standing to
ask at all. Someone carrying that will not bring it up; they will just go
away. Say it plainly: they are a constituent because they live in the
district, voting has nothing to do with it, immigration casework is a large
share of what these offices do, and the office asks a question rather than
referring anyone to enforcement. Name the one real exception — if something
in their own record is irregular, an attorney comes first.

Read `references/is-it-safe.md` for the honest version, including the
caveats. Do not oversell it, do not promise zero risk, and do not push. If
they remain uneasy, that is a legitimate place to stop; the draft can sit
unsent, and nothing is filed until they submit it themselves.

Then check Browser MCP, because it determines what Step 4 looks like and is
better resolved before the user has invested an interview. Check whether
`browser_*` tools are actually available in the session — do not accept "I
started it" as confirmation, since the extension half and the server half
are separate and users routinely complete one. If the tools are missing,
offer `references/browser-mcp-setup.md` and note that registering the server
requires restarting Claude Code before the tools appear.

If the user would rather not set it up, proceed. The manual path — drafts
plus the form URL, filled by hand — is a fine path and should not be framed
as degraded. Do not stall the casework on the browser integration.

Get an acknowledgment of the ceiling before starting the interview.

### Step 1 — Locate

Ask for a ZIP code. Resolve it to a congressional district using the
official House lookup at `https://www.house.gov/representatives/find-your-representative`.

Note what the lookup gives you: district, member name, member website, and a
generic contact form. It does **not** give a casework page, a casework form
URL, or a district phone. Those live on the member's own site at a path that
varies by office. See `references/the-form.md`.

ZIP-to-district is not one-to-one — a single ZIP can span districts. When
the lookup is ambiguous, ask for enough address to disambiguate.

Then find, and show the user:

- the member's name and the district
- their casework / "help with a federal agency" page
- the casework form URL — often the House-wide
  `digitalprf.house.gov/ReleaseForm?id=<STATE><DISTRICT>`, but verify it
  resolves to the right member before trusting it
- any dedicated casework email the office publishes
- the **district** office phone, not the D.C. one — and note that offices
  often have several district locations, some open only on certain days

Confirm the member is in fact the user's representative before continuing.
If the user already knows their member, skip the lookup and verify.

### Step 1.5 — Read the form, build the checklist

**Do this before the interview, not after.** Every office's form is
different. An interview designed in advance against a generic list will ask
for things this office does not want and miss things it requires — and the
user only finds out at the form, after they have already answered thirty
questions.

So: go look at the form first, and let it define the questions.

This is a **read-only pass.** Navigate, enumerate, leave. Do not type
anything into any field, and do not pass an address-authentication gate
during recon — at this point you do not have the user's address yet, and you
should not be entering data before the user has seen the checklist.

1. **Find the form.** Start from the member's casework page. Try the
   House-wide `digitalprf.house.gov/ReleaseForm?id=<STATE><DISTRICT>` as a
   hypothesis and confirm it names the right member — it fails for offices
   running their own form. If the page promises a form the snapshot does not
   show, fetch the raw HTML and look for an `<iframe>`; forms are frequently
   embedded cross-origin. See `references/the-form.md`.
2. **Enumerate every field**: label, required or optional, and input type
   (text, dropdown, date, file upload, captcha).
3. **Note the gates**: address authentication, reCAPTCHA, a login, a file
   upload, a signature step.
4. **Read the surrounding page** for what happens after submission — staff
   contact, a printable PDF to sign and return, a separate release form.
   This determines what you tell the user at Step 4 and Step 6.

Then write `output/form-checklist.md`:

- **What the form requires** — every required field, with who supplies it
  (you from intake, or the user directly).
- **What the form asks optionally** — and which of those are worth filling.
- **What the letter needs** that the form does not ask for — the narrative
  facts that go in the description field.
- **What the user must do personally** — identifiers they will type,
  captcha, signature, submit.
- **What happens after submit** — so nobody submits and then waits forever
  for an inquiry that has not started.

Show the user the checklist before starting the interview. It tells them how
long this will take and what to have in front of them, which is worth more
than any progress bar. Someone who knows their approval notice is needed will
go get it, instead of reconstructing dates from memory and getting them
wrong.

**If Browser MCP is unavailable**, ask the user to open the form and describe
the fields, or read the page's HTML directly. Build the same checklist. Do
not skip this step and fall back to a generic interview — the checklist is
what keeps intake honest, not the browser.

### Step 2 — Intake

**Drive the interview from `output/form-checklist.md`**, using
`references/intake.md` for what each item feeds and for the interaction
protocol.

The questions to ask are the union of: what the checklist says this office's
form requires, plus what the letter needs (intake Groups B through E), minus
the never-ask identifiers, which the user types into the form themselves.

Anything outside that union, do not ask. If the office's form has no fields
about dependents and the user has none, Group F does not happen. An
interview that exists to be complete rather than to produce this filing is
the failure this step is ordered to prevent.

The shape, in short:

- Eight groups: identity and residency, status, the blockage, duration, what
  is on the other side, dependents, prior congressional contact,
  confirmations.
- **One group per message, at most three questions at a time.** Wait for a
  real answer before moving on. Never present the full list.
- Structured choice for closed answer sets (visa category, contact
  preference). Free text for narrative. **Never structured choice for the
  hardship** — a menu of hardships coaches the story.
- Reflect back twice: after the blockage group, and after the hardship
  group. Both are correction points before anything reaches a federal form.
- Branch on what you hear. A pending 221(g) moves the ask off appointment
  supply. Interview-waiver eligibility may mean the user does not need this
  at all. Expired or expiring status stops the session and routes to an
  attorney.
- "I don't know" is a complete answer. Record the gap, delete the matching
  template slot, do not ask twice.

Two things to say **before** the first question, not after: that a street
address is required because the form verifies residency, and that passport
numbers, A-numbers, SSNs, receipt numbers, and full DOB must stay out of the
chat and the drafts — they belong on the official form, typed by the user.

Do not push on hardship. If the situation is ordinary inconvenience rather
than hardship, the honest draft says so and is still worth filing — tell
them that rather than steering them toward a sadder story.

### Step 3 — Draft

Build the request from `templates/casework-request.md`.

**Write drafts to `output/` in the user's current working directory** — one
file per artifact: `output/casework-request.md`, `output/phone-script.md`,
`output/followup.md`, `output/tracking.md`. The user reviews and edits the
file; you work from the same file rather than from a copy in the
conversation, so their edits are never silently discarded.

**Never write drafts inside the plugin's own directory.** Drafts hold a real
person's home address, contact details, immigration dates, and family
circumstances. A local-path plugin install copies the plugin directory
wholesale — `.gitignore` does not apply — so anything left there travels into
the plugin cache and into any copy of the plugin that gets shared.

If the user's working directory is the plugin repo itself, say so and write
somewhere else. Never commit these files and never include their contents in
anything shared off the user's machine.

Non-negotiable framing, per `references/framing.md`: the ask is that the
office open an inquiry with the Department of State about appointment
availability and, where the facts support it, that an expedite be
*considered*. The ask is never that anyone approve, issue, or direct the
issuance of a visa. A request phrased that way has to be declined.

**Apply the `casework-voice` skill to every draft.** It governs how these
read: the user's own phrasing rather than upgraded register, a structure
chosen for this person rather than a fixed paragraph order, emotional facts
stated once and plainly, and the AI tells stripped.

That skill is also what keeps this from being a spam engine. Two users with
identical situations must get letters that differ in shape, not just in slot
values — a caseworker who recognizes the template stops reading the facts
inside it. `templates/casework-request.md` is a coverage checklist, not a
shape to reproduce.

Show them the draft and revise it with them before moving on. Ask for their
own words for any sentence carrying emotional weight rather than writing one
for them.

If the facts support an expedite request under published criteria, also
produce `templates/expedite-note.md`. If they do not, say that directly —
a weak expedite ask attached to a sound inquiry weakens the inquiry.

### Step 3.5 — Concern checkpoint

Before opening any form, run the flag check in `references/is-it-safe.md`
against everything intake produced, and **state the result out loud**.

The default is that filing is fine. Do not hand the user a general "consult
an attorney if it's complicated" caveat — they cannot assess that, it reads
as a hint that something is wrong with them, and it is the single most
common reason someone drafts a request and never sends it.

- **No flag:** say so specifically. Name what you checked — status valid, no
  gap, employed by the petitioner, no prior refusal — and say plainly that
  it is okay to submit. Specific beats soothing; a vague reassurance does
  not let anyone put the fear down.
- **A flag:** name that flag, say why it deserves a look, make clear it is
  not a verdict, and keep going. Draft everything, hand it over, let them
  file after counsel. Do not gatekeep.
- **They already have a lawyer:** recommend one email — "any reason not to
  file this?" — rather than a general caution.

Ask once whether anything about filing still worries them. If they are still
uneasy after an honest answer, that is a legitimate place to stop. The draft
keeps.

### Step 4 — File

Read `references/the-form.md` first.

Requires Browser MCP. See `references/browser-mcp-setup.md`; if the tools
are not available, say so, hand over the form URL and the draft, and let the
user fill it by hand. That path is fine and should not be framed as
degraded. Note that Browser MCP has two halves — extension connected on a
tab, and server registered with Claude Code — and that the server half needs
a restart before its tools appear.

With Browser MCP connected:

1. Open the member's casework form. Expect an address-authentication gate
   before the form itself; the user's address from intake goes here.
2. Fill fields from intake. Leave every sensitive identifier blank for the
   user to enter themselves.
3. Stop. Show the user what is in each field and tell them explicitly that
   nothing has been submitted.
4. The user reviews, fixes, signs, submits.

Never click submit. Never check a consent or signature box on the user's
behalf, including when they say you may — see `references/privacy-act.md`.

**Submitting the web form may not be the end.** At least one office states
the form generates a printable PDF to be signed and mailed, faxed, or
delivered in person. If that holds, a user who stops at submit has filed
nothing. Check what the specific office says, tell the user before they
start, and carry the signature step into follow-up so it does not get
dropped. This is flagged as unverified in `references/the-form.md`.

### Step 5 — Call

Generate `templates/phone-script.md` for the district office, to be used a
day or two after submitting, once there is a case to reference by name.
Around thirty seconds. Include what to write down: the caseworker's name
and the case number.

### Step 6 — Follow up

Write a local tracking file: submission date, case number, contacts, what
was said. Keep it in the working directory.

Generate `templates/followup-email.md` for the two-week mark. If the House
office has gone quiet past that point, offer
`templates/senator-escalation.md` — and note that this is sequential
escalation after a non-response, not parallel filing.

## Anti-patterns

- Drafting before Step 1 is confirmed. The member's name and office shape
  the letter, and a letter to the wrong office is worse than no letter.
- Writing "I am writing to request that my visa be expedited." Wrong ask,
  wrong recipient, declined.
- Padding the draft to look official. Caseworkers read fast; two tight
  paragraphs of specific fact beat a page of formality.
- Producing the phone script before the form is submitted. The script's
  whole advantage is referencing an existing case.
- Treating a template slot as a prompt to invent content.

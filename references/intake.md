# Intake: everything to collect, and why

Every item here is consumed by something downstream — a form field or a
bracket slot in a template. If you cannot name what an answer feeds, do not
ask it.

**This is a catalogue, not a script.** The actual interview is driven by
`output/form-checklist.md`, built in Step 1.5 by reading the specific
office's form before any question is asked. Ask the union of what that
checklist requires and what the letter needs; skip the rest. Offices differ,
and a fixed interview guarantees both gaps and wasted questions. Casework intake is not a place to be
thorough for its own sake; the user is stressed and every extra question
costs attention that Section E actually needs.

**How to run it:** conversationally, in the eight groups below, following
the user's answers. Not as a 30-item questionnaire. Groups A–C are quick
factual capture and can move fast. Group E is the one that decides whether
the request works — slow down there.

**Missing answers are fine.** "I don't know" is a legitimate answer to most
of this, and several items are genuinely hard to look up. Record the gap,
delete the corresponding template slot, and move on. Never fill a gap with
something plausible.

---

## Interaction protocol

Intake is a conversation, not a form. The agent asks, waits, listens, and
adapts. A user who is handed all thirty items at once will either abandon
the session or paste a wall of text that answers half of them badly.

**One group per message.** Ask Group A, wait for the answer, then ask Group
B. Never send two groups in one message, and never preview the full list —
"I'll need about thirty things from you" reads as a form even if you then
ask them one at a time.

**At most three questions in a single message**, and fewer in Group E. If a
group has more items than that, split it across turns.

**Wait for a real answer before continuing.** Do not ask a question and
answer it yourself with an assumption. Do not batch-ask and then proceed on
whatever came back.

**Use structured choice where the answer set is closed** — visa category,
preferred contact method, home-country versus third-country post. Offer the
common options and let the user pick or type their own. Use free text where
the answer is a narrative, a date, or a name.

**Never use structured choice in Group E.** Offering a menu of hardships is
exactly the coaching problem: it tells the user what a good answer looks
like before they have given a true one. Ask open, then stop talking.

**Adapt to what you hear.** The script branches:

- Dependent category (H-4, L-2, F-2, J-2) → the principal's status matters;
  ask about it.
- 221(g) or administrative processing → the ask shifts from appointment
  supply to a pending case. Skip most of the appointment-availability
  questions; they are no longer the blockage.
- Interview waiver eligibility → the user may not need this process at all.
  Say so rather than continuing out of momentum.
- Status expired or expiring → stop and route to an attorney.
- No hardship beyond inconvenience → keep going, and say plainly that the
  request will be modest and is still worth filing.

**Reflect back twice.** After Group C, summarize the factual picture in
three or four lines and ask what is wrong. After Group E, read back the
hardship in your own words and ask whether it is accurate and whether they
are comfortable with it in writing. Both are correction points, not
formalities — this is where a misheard date gets caught, before it reaches a
federal form.

**Let people skip.** "I don't know" and "I'd rather not say" end that line
of questioning. Record the gap and move on. Do not ask twice.

**Mark progress between groups.** One short line — "That's the status
picture; now the appointment situation" — so the user knows the shape of
what is left. It is the one place a hint of the full scope helps.

**Ask for the minimum that does the job.** Every question is a cost paid by
someone who is already tired of being asked for things. If an answer would
not change a sentence in the draft, do not ask it. Prefer inferring from a
document the user has already shared over asking them to restate it.

**When a user over-shares, say so and move on.** People paste whole
documents — an I-797, a full immigration history, a long account of
everything that went wrong. The reflex is understandable and it is not a
mistake to correct them for. Handle it in two sentences, in this shape:

> That's more than I need — I don't need your A-number, date of birth, or
> receipt number, and they won't appear in anything I write. I'll draft from
> your status category, the petition dates, your employer, and your
> citizenship.

Name what is being discarded, name what is being kept, do not echo the
sensitive values back, do not lecture, and continue. One sentence of warning
is enough; a paragraph about data hygiene makes the user feel scolded for
trying to help.

Then actually use the document. A user's own paperwork beats their memory —
read the real dates off it and confirm them rather than asking again.

**Stop when you have enough.** If the user has given you a clear picture by
Group E, the remaining groups can be compressed into a single confirmation
message. Intake serves the draft; it is not a checklist to complete.

---

## A. Identity and residency
*Feeds: the address-authentication gate, the letter's signature block, the
office's constituent verification.*

1. **Full legal name**, spelled as it appears on their passport and visa.
2. **Street address** — line 1, optional line 2, city, state, ZIP.
   Required unconditionally; the form will not open without it. Say why:
   the office serves one district and verifies residency first.
3. **Daytime phone.**
4. **Email.**
5. **Preferred contact method**, and any constraint on when they can be
   reached — some users cannot take calls at work.

## B. Status
*Feeds: the opening paragraph that establishes standing; determines whether
the case is even in scope.*

**Ask in this order.** Current category, then prior status, then the
details. The first two answers determine which of the later questions are
even relevant, and asking details first means re-asking them.

6. **Current nonimmigrant category** — H-1B, L-1A/B, F-1, O-1, TN, J-1, or a
   dependent category (H-4, L-2, F-2, J-2).

7. **What status they held before it**, and **how they got to the current
   one**: changed status inside the U.S., or entered from abroad on it.

   This is the branch point for everything downstream, and it is not
   obvious to the user why you are asking. A one-line reason helps: whether
   they have ever been stamped in the current category changes what they are
   asking the consulate for.

   - **Changed status inside the U.S.** (F-1/OPT → H-1B is the common one,
     also H-4 → H-1B, F-1 → O-1) → they may have **never held a visa foil in
     the current category**. They are not renewing anything; they need a
     first-time stamping appointment. Say this back to them, because many
     users describe it as "my visa expired" when no visa was ever issued.
   - **Entered from abroad on the current category** → they have been
     stamped before. A renewal may be eligible for an interview waiver, which
     could make this entire process unnecessary. Check that before going on.
   - **Prior J-1** → ask whether they were subject to the 212(e) two-year
     home-residency requirement and whether it was satisfied or waived. If
     it applies and is unresolved, this is an attorney question and the
     casework request is premature.
   - **Prior or concurrent TN, L-1** → different post procedures; do not
     assume the H-1B pattern applies.

8. **Whether they have ever been stamped in the current category**, and if
   so, the **foil's expiry**. Confirm rather than infer from item 7 — people
   change status and later get stamped abroad on a trip.

9. **How long in the U.S. overall**, across all statuses.
10. **Employer or school**, and the city.
11. **Role or program** — job title, degree program, field.
12. **I-94 expiry** — when their *status* runs out.

    Items 8 and 12 are different things and users conflate them constantly.
    Status is permission to be here; the visa foil is permission to
    re-enter. The whole case rests on the distinction — valid status, no
    usable visa, therefore unable to leave and return — so confirm you have
    both and that the user knows which is which. If status itself has
    expired or is close to it, that is an attorney question, not a casework
    question. Say so.

13. **Country of citizenship**, which determines the home-country post.
14. **Anything pending** — an extension, an amendment, OPT or STEM OPT, a
    pending I-129. A pending petition can change travel advice
    substantially, which is another reason this is attorney territory.

**On documents.** Users will often have an I-797 approval notice open and
will paste the whole thing. It contains an A-number, date of birth, receipt
number, and I-94 number — all on the never-collect list. Say the
never-collect rule *before* this group, not after. If a document lands
anyway: tell them plainly, do not echo the values back, and keep them out of
every file. Do read it for the legitimate facts — petition validity dates,
employer, classification, citizenship — and read those back for
confirmation, since a document beats memory. Users misremember their own
dates routinely.

## C. The blockage
*Feeds: the paragraph that makes the problem concrete and checkable. This
is the part a caseworker can actually verify and act on.*

13. **Which post** they would realistically use — city and country. Home
    country, or a third country.
14. **Earliest available appointment** at that post, and **when they last
    checked**. A date plus a check date is checkable; "months" is not.
15. **Third-country posts tried** — which ones, what they showed.

    Be aware that third-country stamping was substantially restricted around
    September 2025; applicants may be required to apply in their country of
    nationality or residence. If so, this is not a route the user failed to
    take — it is closed to them, which is a stronger fact. **Verify current
    policy before asserting it**; this changes often.
16. **221(g) or administrative processing** — whether they are subject to
    one, when it issued, what was requested. This changes the ask: the
    inquiry becomes about a pending case rather than about appointment
    supply.
17. **Interview waiver / dropbox eligibility** — whether they have checked.
    Criteria change often, and a user who qualifies may not need any of
    this.
18. **Prior expedite requests** — whether they have filed one, when, and
    what came back.

    Ask the follow-up that matters: **do they currently hold any appointment
    at all?** Expedite requests generally attach to an existing booked
    appointment, so an applicant with none cannot use the published remedy.
    If that is their situation, say it back to them — it is the strongest
    line in the letter and users rarely volunteer it, because they
    experience it as their own failure to find a slot rather than as a
    structural dead end.

18a. **Reschedule constraints.** If they do hold a distant appointment, ask
    whether they have reschedule attempts left. Accounts are rationed, and
    an applicant who cannot risk their remaining attempts is stuck holding a
    date they cannot improve. That is a concrete, checkable constraint and
    belongs in the letter.

18b. **What the portal literally shows.** Ask for the exact wording. For
    petition-based categories the system often displays `NA` rather than a
    date — no calendar, nothing to book. "The portal shows NA" is stronger
    and more verifiable than "the wait is long," because it means the queue
    is closed rather than merely long. A screenshot date makes it checkable.
19. **Attorney involvement** — whether they have one. If yes, the drafts
    should be shared with that attorney before filing.

## D. Duration
*Feeds: the severity of the hardship paragraph.*

20. **How long they have been unable to travel.**
21. **What has already been missed or postponed** because of it.

## E. What is on the other side
*Feeds: the paragraph that decides whether this gets worked. Everything
above is context; this is the case.*

22. **The specific thing.** Who, what, when. A parent's diagnosis and when
    it came. A funeral and its date. A dependent abroad and how long the
    separation has run. A wedding, a birth, a program that requires travel.
    Ask for names, dates, and what happens if it does not resolve.
23. **What documentation exists** — a physician's letter, a death
    certificate, a program start letter, an employer letter. List only what
    the user actually has or can get, and when.
24. **Any hard deadline** — a date after which something is irreversibly
    lost. A date that passes is stronger than a condition that persists.

**Do not push here.** If the user's situation is serious inconvenience
rather than hardship, that is a filable request and you say so plainly. Do
not offer examples of what would make a stronger case before they have
answered — that is coaching a story, and it produces exactly the
fabrications `references/framing.md` warns about. Ask open, then stop
talking.

If the user volunteers something they are not comfortable putting in
writing, respect it and note the omission.

## E2. Context and anything else
*Feeds: the facts that do not fit a question, which are often the ones that
matter.*

Before moving on, ask once, openly, and then stop:

> Is there anything else about your situation I should know? Anything that
> doesn't fit the questions I've asked.

Structured intake collects what the agent thought to ask for. It reliably
misses:

- **Advice they were given.** "My attorney told me not to travel after
  March" converts an apparent choice into a constraint, and often moves the
  start of the hardship months earlier than the visa dates suggest. Always
  ask when the *practical* inability to travel began, which is frequently
  not when the visa problem began.
- **Cumulative weight.** Sequences — a death, then a birth missed, then a
  parent's decline — read differently than any single item.
- **Health.** The user's own stress, sleep, or treatment. Users volunteer
  this only if given room.
- **What they have given up.** Declined promotions, deferred conferences,
  a degree not started.
- **Things they will not put in writing.** Ask, respect the answer, note
  the omission, and do not probe.

Recompute the duration after this answer. The date the user first could not
travel is often earlier than any date on their paperwork, and it is the
number that conveys the weight.

## F. Dependents
*Feeds: scope, and whether a second Privacy Act release is needed.*

25. **Anyone else affected** whose case is tied to theirs — a spouse in
    H-4, a child in F-2, a dependent already abroad.
26. Whether they want those people **named in the request**. Each adult
    signs their own release; the user cannot authorize disclosure about
    another adult.

## G. Prior congressional contact
*Feeds: honest disclosure on the form, and the escalation decision.*

27. **Whether they have contacted any congressional office** about this
    before — which, when, what happened.
28. **Any existing case number.**

Asked on the form, and offices find out anyway. Concealing a prior inquiry
is the single move that most damages a case. If a House inquiry is already
open and active, the right advice is to wait, not to file again — see
`templates/senator-escalation.md`.

## H. Confirmations
*Feeds: whether to proceed at all.*

29. They understand the office will **inquire, not adjudicate** — restate
    the ceiling once more now that they know their own facts.
30. They are willing to **sign the Privacy Act release** themselves, and
    understand the agent will not sign or submit for them.
31. They understand there may be a **wet-signature step** after the online
    form — a printable PDF to sign and mail, fax, or deliver. See
    `references/the-form.md`; unverified, so phrase it as "the office may
    require."

---

## Never collect

These belong on the official form, entered by the user, over the office's
own connection — not in chat, not in the drafts, not in the tracking file:

- Passport number
- Visa foil / control number
- A-number
- Social Security number
- Receipt or case numbers from USCIS filings
- Full date of birth

Say this **at the start of intake**, not after a user has pasted a passport
number into the chat. If one lands anyway: one sentence naming what is not
needed, one naming what you will use, then continue. Do not repeat the
values back, do not write them to any file, and do not make it a lesson.

The form will legitimately ask for several of these. That is correct and
expected — the difference is who types them and where.

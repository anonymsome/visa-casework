# The casework form, as it actually works

Verified 2026-09-14 against CA-16 (Rep. Liccardo). One office — treat the
per-office details as a sample, not a guarantee.

## The House-wide form system

Many offices do not host their own casework form. They link to a shared
House system:

```
https://digitalprf.house.gov/ReleaseForm?id=<STATE><DISTRICT>
```

"PRF" is **Privacy Release Form**. `id=CA16` resolved to "Office of
Representative Sam T. Liccardo — Digital Privacy Release Form". The id is
the state postal code plus district number, no separator or padding
observed.

**Do not assume this URL without checking.** Offices are free to use their
own form, a plain contact page, or email. Construct the URL as a hypothesis,
then confirm it resolves to the right member's name before showing it to the
user. If it does not, go find the link on the member's own site.

## It is gated by address, before anything else

`ReleaseForm?id=CA16` immediately redirects to:

```
https://digitalprf.house.gov/AddressAuthentication?id=CA16
```

with "Please enter your address to verify residency and go to the next
step." Fields: Address Line 1 (required), Address Line 2, City (required),
State (prefilled from the district).

**This breaks the ZIP-only intake design.** The skill originally asked for a
ZIP and collected a street address only when ZIP-to-district was ambiguous.
The form requires a full street address unconditionally, so intake must
collect one. Say why — residency verification — rather than asking for it
cold.

Anyone whose residency check fails is out of scope for that office. If the
user's address does not verify, the honest answer is that they are likely
not in that district; re-run the lookup rather than trying to work around
the gate.

## Where the lookup actually leaves you

`house.gov/representatives/find-your-representative` returns only:

- district and member name
- the member's website
- a generic contact form

It does **not** return a casework page, a casework form URL, or a district
phone number. Those come from the member's own site, and the path varies.
For CA-16 it was `/services/help-federal-agency`. Expect to search the site
rather than guess the path.

Two gotchas on the lookup page: there are two ZIP textboxes, a header search
and the real one inside the main article — target the one in `main`. And a
split ZIP may return more than one member; that path is untested.

## Signature: unresolved, and it matters

The CA-16 page says the form "will generate a printable PDF document that
you should sign and mail, fax, or deliver in person to our office."

If that is accurate for the digital PRF generally, then **submitting the web
form is not the end of the process** — there is a wet-signature step, and a
user who stops at submit has filed nothing. The plugin's flow currently ends
at submit and would leave them stranded.

It is also possible the page text predates an e-signature capability in the
digital PRF. **This is unverified** — confirmation requires passing the
address gate with a real address, which was out of scope for the test.
Resolve it before shipping; it changes Step 4 and Step 5.

## Other channels

CA-16 publishes a dedicated casework email: `ca16casework@mail.house.gov`.
Worth checking for, since it gives the user a way to ask a question without
starting a formal case.

## District offices, plural

CA-16 lists three district offices plus D.C., two of them open only on
certain weekdays, one with no published phone. "The district office phone"
is not always a single number. Pick the office nearest the user and note its
open days before telling them to call.

---

# Form fields intake does not cover

Verified 2026-09-14 against Rep. Khanna's casework form (CA-17), which is a
custom office form, not the shared digital PRF. Field sets vary by office;
treat this as the shape to expect, not a fixed list.

Intake was designed around what the *letter* needs. Forms ask for more. Fill
what you legitimately can, leave the rest to the user, and never invent a
value to satisfy a required field.

| Field | Who fills it | Notes |
|---|---|---|
| Prefix, Suffix | Leave blank | Optional and cosmetic. Do not guess Mr./Ms. from a name — you do not know, and guessing wrong on a government form is a bad first impression. Offer it, don't assume it. |
| First / Last Name | Agent | Split the legal name from intake. Ask which is which for names where you cannot reliably tell; getting someone's family name wrong is its own insult. |
| Email, Street, City, State, ZIP, Phone | Agent | Straight from intake Group A. **Check the State dropdown** — Khanna's defaulted to `DC`, not the district's state. A default that silently stays wrong fails the residency check. |
| **Social Security Number** | **Only if the user volunteers it for this purpose** | Optional on this form. Never ask for it, never put it in a draft or a file. |
| **Date of Birth** | Agent, if the user gives it | Required on this form. Never ask for it during intake and never write it to a draft or a file — but if the user supplies it so the form can be completed, typing it into the official field is what they asked for. Leaving a required field blank without saying so reads as an oversight. |
| Agency Involved | Agent | Derive, do not ask. Consular appointments and visa issuance are **Department of State, Bureau of Consular Affairs** — *not* USCIS. Petitions and extensions are USCIS. Getting this wrong routes the inquiry to the wrong liaison. |
| Agency Case Number(s) | User, usually blank | For an appointment-availability case there is generally no agency case number. If the user has a 221(g) or a DS-160 confirmation, that is theirs to enter. Never copy a USCIS receipt number here — wrong agency, and it is on the never-collect list. |
| Description of Problem | Agent | The letter goes here. Note this form asks to "include the Date of Application/Claim" — so name the relevant dates in the text: petition approval, status start, and when the user began checking for appointments. |
| Branch of Service, Military Rank | Leave blank | Veterans' casework fields. Not applicable. |
| reCAPTCHA | **User** | Cannot and must not be solved by an agent. A hard stop before submit, which is the correct place for one. |
| Submit | **User** | Always. |

## Ask intake for these

Two items the interview should collect because forms want them and the
letter does not:

- **How the user's name splits** into given and family name, if it is not
  obvious to you.
- **A daytime phone the office can actually reach**, confirmed as a U.S.
  number. A caseworker who cannot reach someone by phone is a case that
  stalls, and an overseas number on a district form is easy to enter without
  noticing.

Date of birth is deliberately *not* on that list. Do not ask for it. If the
user offers it to complete the form, use it there and nowhere else.

## Two different rules, often confused

The never-collect list and the never-act list are not the same thing, and
conflating them produces an agent that is both annoying and unsafe.

**Identifiers — a data-handling rule.** A-numbers, dates of birth, passport
and receipt numbers must never be solicited during intake, never written to
a draft, a tracking file, or the repository, and never echoed back in
conversation. They may be typed into the official form's own field when the
user has supplied them for exactly that purpose. The harm being prevented is
the identifier leaking into artifacts that outlive the session — not the act
of filling a government form the user asked to have filled.

**Signature, consent, and submit — an authority rule.** These are never the
agent's, under any circumstances, including when the user says to go ahead.
A Privacy Act authorization is an attestation that only the person making it
can make; a submission is an act only they can take. There is no user
instruction that transfers this. See `references/privacy-act.md`.

Refusing to type a date of birth into a form field is not caution, it is a
category error — and it leaves a required field blank on a federal form.
Refusing to click submit is the actual rule.

## Khanna's office: the signature comes later

This form has **no Privacy Act signature field**. The office's page says the
request is "a multi-step process" and that "you will be contacted by staff in
my office before we can inquire into your case," with the signature collected
at that point.

So for this office, submitting the form **opens a conversation, not an
inquiry**. Tell the user that plainly: expect a staff contact, and the case
does not actually move until they sign what staff sends. Someone who submits
and then waits silently for State to respond will wait forever.

This differs from CA-16, whose page describes a printable PDF to sign and
return. Neither pattern is safe to assume — read the specific office's page.

## Browser MCP: forms are often in cross-origin iframes

Khanna's casework page renders the form inside:

```html
<iframe src="https://khannaforms.house.gov/forms/casework/" height="1865">
```

`browser_snapshot` does **not** traverse into a cross-origin iframe. The page
appeared to have no form at all — just an empty paragraph where it should be.

When a page promises a form that the snapshot does not show, fetch the raw
HTML and grep for `<iframe`, then navigate directly to the iframe `src`. Do
not conclude the office's form is broken; that conclusion would have sent a
user away from a working form.

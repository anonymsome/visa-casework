# Voice and anti-template rules

Governs how the drafts sound. Read before writing or revising any letter,
email, phone script, or form text.

A casework request is not a legal brief and not a form letter. It is one
person explaining a problem to another person whose job is to help. It
should read like that.

## Why this exists

Two failure modes, and they are the same failure.

A letter that reads like a template gets treated like a template. Caseworkers
see volume; pattern-matching is how they triage. The moment a letter sounds
like something generated, the specific facts inside it stop being read as
facts about a person.

And a tool that emits near-identical letters is a spam engine whatever its
intent. If fifty people in the same situation send fifty letters with the
same five paragraphs in the same order, those letters stop working — for
them and for everyone after them. **Structural variety is not a style
preference here; it is what keeps the channel usable.**

## Use the person's own words

The strongest sentences in any of these letters come from the user, not from
the drafter.

- **Lift their phrasing.** If the user said "I've run out of things to try,"
  use that. Do not upgrade it to "I have exhausted all available avenues."
  The upgrade is what makes it sound generated.
- **Keep their register.** Someone who writes plainly gets a plain letter.
  Someone formal gets a formal one. Do not impose one voice on everyone.
- **Ask before inventing a sentence** that carries emotional weight. If you
  need a line about what something felt like and the user has not given you
  one, ask for it rather than writing it for them.
- **Their order of importance, not yours.** If the user led with their
  grandfather and mentioned the portal second, that tells you what the
  letter is actually about.

## Vary the structure, every time

There is no canonical paragraph order. `templates/casework-request.md` is a
checklist of what must be covered, not a shape to reproduce.

Legitimate openings, depending on the person:

- The blockage, flatly. *"There are no visa appointments in India, and I
  can't leave the country until there are."*
- The human fact. *"My grandfather died last month and I couldn't go."*
- The exhaustion. *"I'm writing because I've run out of things to try."*
- The standing. *"I've lived in your district for four years and I work at
  a company here."*

Vary length too. Some cases need four paragraphs; some need two. A short
letter from someone with a simple problem is more credible than a padded one.

**Never carry a distinctive sentence from one user's letter into another's.**
If a phrase worked well, that is because it was true for that person.

## Plain English

- Contractions are fine. People use them.
- Short sentences where the fact is hard. The grandfather sentence should be
  the shortest one in the letter.
- No throat-clearing. "I hope this message finds you well" wastes the first
  line, which is the one most likely to be read.
- No inflated register: *avenues, endeavor, aforementioned, kindly, herein,
  at your earliest convenience, I would be remiss.*
- No stacked abstractions: *significant hardship, considerable difficulty,
  profound impact.* Say the thing instead.
- Do not moralize at the reader or gesture at how unfair the system is. The
  caseworker knows. It costs credibility and it takes space from facts.

## Emotional restraint

The hard facts carry themselves. Say them once, plainly, and move on.

- **State, do not perform.** "My grandfather died in August and I couldn't
  go home" is stronger than any sentence about grief.
- **Do not reach for it twice.** A loss mentioned once is a fact; mentioned
  three times it reads as leverage, and the reader starts discounting.
- **No adjectives on the loss.** Not *devastating*, not *heartbreaking*.
- **Let the uncertainty stand.** "I don't know when I'll see them next" is
  the kind of true sentence that does not need help.

## AI tells to strip

- Em-dashes used as a rhythm device, several per page.
- Tricolons: "not X, not Y, but Z." Rule-of-three everywhere.
- "It's not just about A — it's about B."
- Symmetrical paragraph openings, or every paragraph the same length.
- Hedges: *quite, rather, somewhat, fairly, arguably.*
- Summary sentences that restate the paragraph just read.
- Section headers in a one-page letter.
- Bullet lists where prose belongs. A letter is prose. Lists are for the
  phone script and the tracking file.

## Before handing a draft over

- Would this person recognize it as theirs?
- Does any sentence exist only to sound official? Cut it.
- Read the first line alone. Does it earn the second?
- If two users in identical situations ran this tool, would the letters
  differ in structure and not merely in slot values? If not, redraft.
- Is every emotionally weighted sentence traceable to something the user
  actually said?

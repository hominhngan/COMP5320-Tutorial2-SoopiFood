# COMP5320 Tutorial #2: Requirements Engineering with AI agents (SoopiFood)

**Student:** Ho Thi Minh Ngan · **Format:** individual

Dear Professor,

This repository contains my work for Tutorial #2. I followed the prompts in the handout, Parts A to I, and saved all my outputs in [`tutorial/workspace/`](tutorial/workspace/). Below I explain how I worked, what I produced in each part, and what I learned from reviewing the agent's output.

## How I worked

- I ran each prompt with an AI coding agent that can read and write files, in the order A → I. For Parts A-E, I used the output of each part as the input of the next one.
- For every part I followed the loop from the handout: **Round 1 (agent) → my review → Round 2 with more context → my review**. In each review I asked: *what did the agent not know?*
- In Part F, round 1 had only the backlog; in round 2 I gave the agent the stakeholder notes. In Part H, round 1 had only the user story; in round 2 (same session) I gave it the business rules R1-R3.
- **About the interviews (Parts B and C):** I did not have access to real restaurant managers. As the handout allows, I used the AI agent to role-play eight restaurant managers answering my interview guide (I1-I8), two dinner-service observations (O1-O2) and four prototype walkthroughs (W1-W4). In Part D, I did the same for the stakeholders who answered my `[TBC]` questions. These notes are simulated, and I have marked them as such in the files.

## How to run it again from the start

The repository contains everything needed to repeat my work: the handout (`tutorial/TUTORIAL.md`), the run order (`tutorial/README.md`), the prompts (`tutorial/starter/prompts/01`-`12`) and the input files (`tutorial/starter/`). I left out the course's sample solutions.

1. Clone this repository and open it with an AI coding agent that can read and write files. Work from the repository root.
2. My outputs are already in `tutorial/workspace/`, and the prompts write to the same file names. To keep them, copy that folder first (for example to `my_outputs/`), or work in a new branch.
3. Run the prompts in order, 01 → 12, as listed in `tutorial/README.md`. Open a new agent session for each part; steps 10 and 11 (Part H) run in the same session.
4. Where a prompt says `[Paste … here]`, paste these files:

| Step | Prompt | Paste |
|---|---|---|
| 2 | `02_interview_guide_iterate.md` | the guide from step 1 (same session) |
| 3 | `03_personas.md` | `tutorial/workspace/03a_interview_notes.md` |
| 4 | `04_functional_requirements.md` | `tutorial/workspace/04a_user_stories_walkthroughs.md` |
| 5 | `05_non_functional_requirements.md` | the FRs from step 4 |
| 6 | `06_epics_stories.md` | the persona, FRs and NFRs from steps 3-5 |

Steps 7-12 read their inputs from `tutorial/starter/` by themselves. Because agent output differs from run to run, a new run will not match my files word for word.

## What I submitted

| Part | What I did | My output in `tutorial/workspace/` |
|---|---|---|
| A | Drafted an interview guide, reviewed it for leading questions, rewrote it neutrally | `01_interview_guide.md`, `02_interview_guide_iterate.md` |
| B | Produced interview/observation notes, then synthesised 3 personas | `03a_interview_notes.md`, `03_personas.md` |
| C | Wrote user stories for my chosen persona and walkthrough notes, then 24 functional requirements | `04a_user_stories_walkthroughs.md`, `04_functional_requirements.md` |
| D | Wrote 13 non-functional requirements, then filled the open thresholds with (simulated) stakeholder answers | `05_non_functional_requirements.md` |
| E | Decomposed the requirements into 6 epics and 16 stories covering every FR and NFR | `06_epics_stories.md` |
| F | Prioritised the backlog with MoSCoW, round 1 and round 2 | `moscow_round1.md`, `moscow.md` |
| G | Handled two change requests within the same capacity | `scope_changes.md` |
| H | Wrote Gherkin criteria, had the agent review and rewrite them with the business rules | `discount.feature`, `review.md`, `discount_v2.feature` |
| I | Audited PR #42 against the Definition of Done | `dod_audit.md` |

## What I found in my reviews

| Part | What the agent did not know, and what I changed |
|---|---|
| A | The first draft used leading words ("juggle", "most frustrating") and assumed something needed to change. I asked the agent to rewrite these questions neutrally. |
| B | I checked every persona bullet against its source tags. Persona 3 is based on only two interviews (I4, I6), so I consider it weaker evidence. I chose **Sam, the Short-Staffed Night Manager** for Parts C-E. |
| C | The sources did not give timeouts, pause durations or a definition of "late", so I kept 7 values as `[TBC]` and listed a question for each. I left UI requests (colours, font size) to the NFRs. |
| D | Most thresholds were not in the constraints, including the TLS version, so in round 1 I marked them `[TBC]` with a question instead of inventing numbers. In round 2 I put back the answers from (simulated) stakeholders, so no `[TBC]` remains. |
| E | In round 1, five NFRs (availability, encryption, scalability, maintainability, portability) had no story. In round 2 I added Epic 6 (ST-13 to ST-16) so every FR and NFR is now covered. |
| F | Without the stakeholder notes, the agent made promo codes a Should and reviews a Could. After I gave it the notes, the founder's and marketing's statements moved them up. Cash on delivery was the agent's assumption in round 1; the operations note confirmed it. |
| G | The legal request (allergens) cannot be negotiated, so it became a Must, paid for by demoting SF-09 Reorder. The marketing request (split the bill) became a Won't. Must is now 68%, above the 60% target, and I explain why in the file. |
| H | Without the business rules, the agent invented a minimum of 50,000 VND, discounted the delivery fee, ignored the cap and rejected codes on their last valid day. With the rules, the rewritten scenarios test each rule on its boundary. |
| I | The PR says the story is done, but the CI log shows a failed scenario, a skipped type checker, no reviewer, floating-point money and no staging deploy. My verdict is that SF-06 is **not Done**. |

## What I learned

The agent's output always looked complete and confident. Its mistakes came from missing context (stakeholder notes, business rules, CI evidence), not from bad wording, so the fix was usually to give it more context rather than a longer instruction. Reviewing each output against its sources was the most important step.

Thank you for reading.

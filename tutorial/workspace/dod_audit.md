# Definition of Done audit: SF-06 Apply a promo code at checkout (PR #42)

Sources: `DEFINITION_OF_DONE.md`, `pr_sf06.md`. The author's claims in the description are not evidence.

| DoD item | Status | Evidence |
|---|---|---|
| D1 All acceptance criteria pass | ❌ not met | CI log: "13 scenarios (12 passed, 1 failed)" / "FAILED: Code still valid on its valid-until date … got: rejected with reason EXPIRED". The claim "All acceptance tests pass ✅" is contradicted. |
| D2 Reviewed by at least one other team member | ❌ not met | "**Reviewers:** none requested". "Self-reviewed, and reviewed by Copilot" is a claim; neither is another team member. |
| D3 Linter and type checker pass | ❌ not met | Linter: "ruff check src tests … passed". Type checker: "mypy src … SKIPPED (job disabled in ci.yml)"; skipped is not passed. |
| D4 Integration tests pass | ✅ met | "[integration] pytest tests/integration … 4 passed" |
| D5 Money is integer VND, no floating point | ❌ not met | Diff: "raw = cart.food_subtotal * promo.value / 100" uses true division, so `raw` is a float before `int(raw // 1000)`. |
| D6 Deployed to staging and manually tested | ❌ not met | "[deploy] staging … not run (manual trigger)"; no staging link or test note. "Will deploy to staging after merge" is a plan, not evidence. |

**Verdict: SF-06 is not Done** (1 of 6 items met); remove the `ready-to-merge` label, and after the steps below also re-enable mypy (D3 Linter and type checker pass) and deploy to staging with a test note (D6 Deployed to staging and manually tested).

| # | Next step for the author | Closes |
|---|---|---|
| 1 | Fix the valid-until check so a code is accepted on its last day, then re-run behave. | D1 All acceptance criteria pass |
| 2 | Compute the discount with integer arithmetic (`food_subtotal * value // 100`), no `/`. | D5 Money is integer VND, no floating point |
| 3 | Request an approving review from a team member other than the author. | D2 Reviewed by at least one other team member |

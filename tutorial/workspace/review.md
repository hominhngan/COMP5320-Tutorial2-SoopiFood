# Review of discount.feature against business_rules.md

| Finding | Rule | Evidence |
|---|---|---|
| The edge scenario rejects a code on its last valid day; the rule says it is still valid. | R3 validity: valid up to and including the valid-until date | Feature: "Code is expired on its expiry date … rejected with the message "Promo code expired"". Rule: on 2026-12-31 the code is **accepted**; `EXPIRED` only from 2027-01-01. |
| The happy scenario discounts the delivery fee and ignores the cap. | R2 cap: never above the cap, food only, never the delivery fee | Feature: "Then the discount is 43,000 VND" (20% of 215,000). Rule: 20% of the 200,000 food subtotal, capped at 30,000 → discount **30,000**, total **185,000**. |
| The minimum order and its error message are invented; the real boundary is not tested. | R1 minimum order: food subtotal ≥ 100,000, else `MIN_ORDER_NOT_MET` | Feature: "Minimum order is 50,000 VND" with a 40,000 subtotal. Rule: minimum **100,000**, error code `MIN_ORDER_NOT_MET`; boundary 99,999 / 100,000 untested. |

Also: the 15,000 VND delivery fee and the 30,000 cap value are test data, not in the rules.

# Scope changes: SoopiFood Release 1

Sources: `moscow.md` (agreed plan), `change_requests.yaml`. Capacity unchanged: **50 points**.

## 1. Decisions

| CR | Points | Decision | Trade-off | Why |
|---|---|---|---|---|
| CR-01 Show allergen information on every dish | 2 | Must, accepted | SF-09 Reorder a previous order in one tap (2) moves Could → Won't. | Legal: launching without allergens is not allowed. |
| CR-02 Split the bill between friends in a group order | 8 | Won't | Nothing is demoted; no planned points are added. | Marketing says the campaign can still run without it. |

## 2. Changes to the plan

| ID | Title | Points | Before → After |
|---|---|---|---|
| CR-01 | Show allergen information on every dish | 2 | new → Must |
| CR-02 | Split the bill between friends in a group order | 8 | new → Won't |
| SF-09 | Reorder a previous order in one tap | 2 | Could → Won't |

## 3. Final allocation

| ID | Title | Points | Priority | Changed |
|---|---|---|---|---|
| SF-01 | Sign up and log in with phone number + OTP | 3 | Must | |
| SF-02 | Browse restaurants and menus near my address | 5 | Must | |
| SF-03 | Add dishes to a cart and place an order | 5 | Must | |
| SF-04 | Pay by card or e-wallet | 5 | Must | |
| SF-05 | Restaurant accepts or rejects an incoming order | 3 | Must | |
| SF-06 | Apply a promo code at checkout | 3 | Must | |
| SF-07 | Order status updates (placed, cooking, on the way, delivered) | 3 | Must | |
| SF-13 | Pay cash on delivery | 5 | Must | |
| CR-01 | Show allergen information on every dish | 2 | Must | ✔ |
| SF-08 | See the driver's live location on a map | 5 | Should | |
| SF-10 | Rate and review a restaurant after delivery | 3 | Should | |
| SF-14 | Add special instructions for the restaurant (e.g. less spicy) | 2 | Should | |
| SF-11 | Schedule an order for a later time | 3 | Could | |
| SF-15 | Dark mode | 3 | Could | |
| SF-09 | Reorder a previous order in one tap | 2 | Won't | ✔ |
| SF-12 | SoopiCoins loyalty points on every order | 8 | Won't | |
| CR-02 | Split the bill between friends in a group order | 8 | Won't | ✔ |

Assumption: SF-09 Reorder a previous order in one tap is demoted because it is the only Could item whose points (2) exactly pay for CR-01, and customers can still reorder manually.

## 4. New allocation

| Category | Before | After |
|---|---|---|
| Must | 32 (64%) | 34 (68%) |
| Should | 10 (20%) | 10 (20%) |
| Could | 8 (16%) | 6 (12%) |
| Won't | 8 | 18 |
| **Total planned vs capacity** | **50 / 50** | **50 / 50** |

## 5. Self-check

✅ 50 planned ≤ 50 capacity; the 2 added points are paid by the 2 demoted; ⚠️ Must is now 68%, above the 60% target, because a legal requirement cannot be negotiated.

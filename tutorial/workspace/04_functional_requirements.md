# Functional requirements: Restaurant tablet (SoopiFood)

Scope: the restaurant tablet only. Sources: Sam's user stories (US-01 to US-11) and walkthrough notes (W1-W4) in `04a_user_stories_walkthroughs.md`.

## Order intake

| ID | Requirement | Actor | Source |
|---|---|---|---|
| FR-01 | The system shall alert the restaurant when a new order arrives. | Restaurant manager | US-01 |
| FR-02 | The system shall repeat the new-order alert until the order is accepted or rejected. | Restaurant manager | US-01, W1 |
| FR-03 | The system shall show the time remaining before an unanswered order is cancelled, after a timeout of [TBC] minutes. | Restaurant manager | W1 |
| FR-04 | The system shall let the manager accept an incoming order. | Restaurant manager | US-02, W1 |
| FR-05 | The system shall let the manager reject an incoming order. | Restaurant manager | US-02 |
| FR-06 | The system shall require a reason from a list of [TBC] reasons when an order is rejected. | Restaurant manager | W1 |
| FR-07 | The system shall require a preparation time when an order is accepted. | Restaurant manager | US-03, W1 |
| FR-08 | The system shall send the preparation time to the customer and the rider when an order is accepted. | System | US-03 |

## Menu availability

| ID | Requirement | Actor | Source |
|---|---|---|---|
| FR-09 | The system shall let the manager mark a menu item as unavailable. | Restaurant manager | US-04, W2 |
| FR-10 | The system shall hide an unavailable item from customers within [TBC] seconds of it being marked unavailable. | System | US-04 |
| FR-11 | The system shall restore an unavailable item at the start of the next business day [TBC: time] unless the manager chooses otherwise. | System | W2 |
| FR-12 | The system shall list the open orders that contain an item just marked unavailable. | Restaurant manager | W2 |
| FR-13 | The system shall let the manager pause new orders for a chosen duration of [TBC: e.g. 15 or 30 minutes] or until resumed. | Restaurant manager | US-05, W2 |
| FR-14 | The system shall resume new orders automatically when the pause duration ends. | System | US-05, W2 |

## Kitchen progress

| ID | Requirement | Actor | Source |
|---|---|---|---|
| FR-15 | The system shall record each order's stage as accepted, preparing, ready or picked up. | Restaurant manager | US-06 |
| FR-16 | The system shall let restaurant staff move an order to its next stage. | Restaurant staff | US-06 |
| FR-17 | The system shall flag an order as late when it passes its preparation time by [TBC] minutes. | System | US-07, W3 |

## Rider handover

| ID | Requirement | Actor | Source |
|---|---|---|---|
| FR-18 | The system shall generate a pickup code for each accepted order. | System | US-08, W3 |
| FR-19 | The system shall mark an order as picked up only after its pickup code is matched. | Restaurant staff | US-08, W3 |
| FR-20 | The system shall let the manager report that no rider has arrived after the order has been ready for [TBC] minutes. | Restaurant manager | US-09, W4 |

## Issue handling

| ID | Requirement | Actor | Source |
|---|---|---|---|
| FR-21 | The system shall let the manager refund a single item of a completed order. | Restaurant manager | US-10, W4 |
| FR-22 | The system shall record a reason for every refund. | Restaurant manager | US-10 |
| FR-23 | The system shall indicate when the tablet has lost its connection to the order service. | System | US-11, W4 |
| FR-24 | The system shall deliver every order received by the order service during a connection loss once the connection returns. | System | US-11, W4 |

## My review

- I checked that each requirement has exactly one behaviour: accepting (FR-04) and setting a prep time (FR-07) are separate, as are marking an item unavailable (FR-09) and hiding it (FR-10).
- W3's requests for "large order numbers" and "colour by stage" describe the UI, not behaviour, so I did not keep them as FRs; readability is covered in Part D (usability, NFR-09).
- I checked that no value missing from the sources was invented; each one is `[TBC]`.

### [TBC] questions I would ask the stakeholders

| FR | Question |
|---|---|
| FR-03 | How many minutes can an order wait before it is cancelled? |
| FR-06 | Which rejection reasons should the list contain? |
| FR-10 | How fast must an unavailable item disappear for customers? |
| FR-11 | When does the business day start for restoring items? |
| FR-13 | Which pause durations are allowed? |
| FR-17 | How many minutes past the prep time is an order "late"? |
| FR-20 | How long must food wait before "no rider" can be reported? |

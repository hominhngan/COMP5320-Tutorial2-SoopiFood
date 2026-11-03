# Non-functional requirements: Restaurant tablet and order service (SoopiFood)

Scope: the restaurant tablet and the order service behind it. Sources: the stakeholder constraints in prompt 05 and FR-01 to FR-24 (`04_functional_requirements.md`).

## Round 1: NFRs with open thresholds

| ID | Category | Requirement | Conditions | How to test it | Related FRs |
|---|---|---|---|---|---|
| NFR-01 | Performance | The order service shall deliver a new order to the tablet within [TBC] seconds of checkout for 95% of orders. *Ask: what is the longest acceptable delay between payment and the tablet alert?* | Peak load, 6-9pm | Load test at simulated peak; measure checkout-to-alert latency at the 95th percentile | FR-01, FR-02 |
| NFR-02 | Performance | The tablet shall register an accept or reject action within [TBC] seconds for 95% of actions. *Ask: how long can the manager wait for confirmation at the counter?* | Peak load, 6-9pm | Automated UI test under load; measure tap-to-confirmed time | FR-04, FR-05 |
| NFR-03 | Reliability | The tablet shall lose 0 orders received by the order service during a Wi-Fi drop of up to [TBC] minutes. *Ask: how long do drops at the restaurants usually last?* | Shared Wi-Fi drops out | Cut the network during a test with queued orders; count orders received after reconnecting | FR-23, FR-24 |
| NFR-04 | Reliability | The tablet shall show the offline state within [TBC] seconds of losing the connection. *Ask: how quickly must staff know they are offline?* | Shared Wi-Fi drops out | Network-drop test; measure time to the offline indicator | FR-23 |
| NFR-05 | Reliability | The order service shall be available [TBC]% of the time during 6-9pm each month. *Ask: what monthly downtime at dinner is acceptable?* | Dinner service | Uptime monitoring report for 6-9pm | FR-01, FR-15 |
| NFR-06 | Security | 100% of traffic between the tablet and the order service shall be encrypted with TLS version [TBC] or higher. *Ask: which minimum TLS version does the security policy require?* | All conditions | Network scan and TLS configuration test | FR-01 to FR-24 |
| NFR-07 | Security | The tablet shall store 0 payment card numbers; card data stays with the third-party provider. | Refunds and orders | Code review and data scan of tablet storage and logs | FR-21 |
| NFR-08 | Scalability | The order service shall handle [TBC] orders per minute per city without breaching NFR-01. *Ask: what peak order volume is expected in the first year?* | Peak load, 6-9pm | Load test at the target volume | FR-01, FR-08 |
| NFR-09 | Usability | A manager shall read an order's number and stage from [TBC] metres in [TBC] seconds or less. *Ask: how far from the tablet do managers usually stand?* | Busy counter, glancing | Usability test with 5 managers at the agreed distance | FR-15, FR-17 |
| NFR-10 | Usability | A manager shall accept an order with a preparation time in at most [TBC] taps. *Ask: how many taps are acceptable while away from the floor?* | Busy counter | Task test with 5 managers; count taps | FR-04, FR-07 |
| NFR-11 | Maintainability | The order service shall keep automated test coverage at [TBC]% or higher. *Ask: what coverage does the team commit to?* | Every release build | CI coverage report | FR-01 to FR-24 |
| NFR-12 | Portability | The tablet app shall run on 100% of the [TBC] tablet models and OS versions restaurants already own. *Ask: which tablets do partner restaurants use today?* | Release builds | Device test matrix on each listed model | FR-01 to FR-24 |
| NFR-13 | Compliance | The tablet shall hide a customer's phone number within [TBC] hours after the order is completed (GDPR data minimisation). *Ask: how long does the restaurant need the number after delivery?* | EU customers' personal data | Automated test that the field is empty after the period | FR-21 |

## Stakeholder answers to the [TBC] questions

> **Note to the instructor: simulated answers.** I had no real stakeholders, so I used an AI agent
> to role-play the product owner, the operations lead and the security lead answering my questions.
> The values below are simulated and would need confirming on a real project.

| NFR | Question | Answer | Answered by (simulated) |
|---|---|---|---|
| NFR-01 | Longest acceptable delay from payment to tablet alert? | 10 seconds | Product owner |
| NFR-02 | How long can the manager wait for confirmation? | 2 seconds | Product owner |
| NFR-03 | How long do Wi-Fi drops usually last? | Up to 5 minutes | Operations lead |
| NFR-04 | How quickly must staff know they are offline? | 10 seconds | Operations lead |
| NFR-05 | Acceptable monthly downtime at dinner? | 99.5% availability (about 28 minutes a month in 6-9pm) | Operations lead |
| NFR-06 | Minimum TLS version? | TLS 1.2 | Security lead |
| NFR-08 | Expected peak order volume in year 1? | 300 orders per minute per city | Product owner |
| NFR-09 | How far from the tablet do managers stand? | 2 metres, readable in 3 seconds | Operations lead |
| NFR-10 | Acceptable number of taps? | 3 taps | Product owner |
| NFR-11 | Coverage the team commits to? | 80% | Development team |
| NFR-12 | Which tablets do restaurants use? | Android 10 or later, on the 3 models in the partner device list | Operations lead |
| NFR-13 | How long is the phone number needed? | 24 hours after completion | Product owner |

## Round 2: final NFRs

| ID | Category | Requirement | Conditions | How to test it | Related FRs |
|---|---|---|---|---|---|
| NFR-01 | Performance | The order service shall deliver a new order to the tablet within 10 seconds of checkout for 95% of orders. | Peak load, 6-9pm | Load test at simulated peak; measure checkout-to-alert latency at the 95th percentile | FR-01, FR-02 |
| NFR-02 | Performance | The tablet shall register an accept or reject action within 2 seconds for 95% of actions. | Peak load, 6-9pm | Automated UI test under load; measure tap-to-confirmed time | FR-04, FR-05 |
| NFR-03 | Reliability | The tablet shall lose 0 orders received by the order service during a Wi-Fi drop of up to 5 minutes. | Shared Wi-Fi drops out | Cut the network for 5 minutes with queued orders; count orders received after reconnecting | FR-23, FR-24 |
| NFR-04 | Reliability | The tablet shall show the offline state within 10 seconds of losing the connection. | Shared Wi-Fi drops out | Network-drop test; measure time to the offline indicator | FR-23 |
| NFR-05 | Reliability | The order service shall be available 99.5% of the time during 6-9pm each month. | Dinner service | Uptime monitoring report for 6-9pm | FR-01, FR-15 |
| NFR-06 | Security | 100% of traffic between the tablet and the order service shall be encrypted with TLS 1.2 or higher. | All conditions | Network scan and TLS configuration test | FR-01 to FR-24 |
| NFR-07 | Security | The tablet shall store 0 payment card numbers; card data stays with the third-party provider. | Refunds and orders | Code review and data scan of tablet storage and logs | FR-21 |
| NFR-08 | Scalability | The order service shall handle 300 orders per minute per city without breaching NFR-01. | Peak load, 6-9pm | Load test at 300 orders per minute | FR-01, FR-08 |
| NFR-09 | Usability | A manager shall read an order's number and stage from 2 metres in 3 seconds or less. | Busy counter, glancing | Usability test with 5 managers at 2 metres | FR-15, FR-17 |
| NFR-10 | Usability | A manager shall accept an order with a preparation time in at most 3 taps. | Busy counter | Task test with 5 managers; count taps | FR-04, FR-07 |
| NFR-11 | Maintainability | The order service shall keep automated test coverage at 80% or higher. | Every release build | CI coverage report | FR-01 to FR-24 |
| NFR-12 | Portability | The tablet app shall run on 100% of the 3 tablet models in the partner device list, on Android 10 or later. | Release builds | Device test matrix on each listed model | FR-01 to FR-24 |
| NFR-13 | Compliance | The tablet shall hide a customer's phone number within 24 hours after the order is completed (GDPR data minimisation). | EU customers' personal data | Automated test that the field is empty after 24 hours | FR-21 |

## My review

- In round 1, I checked that every threshold not given by the constraints was `[TBC]` with a question, instead of an invented number. The fixed values follow from the constraints: 0 stored card numbers (third-party payments), 0 lost orders (Wi-Fi drops must not lose orders), 100% encrypted traffic (personal data under GDPR).
- In my first draft, NFR-06 stated "TLS 1.2" and NFR-11 joined two categories. I changed TLS 1.2 to `[TBC]` because it was not in the constraints, and split NFR-11 so each category has its own metric. The stakeholder later confirmed TLS 1.2.
- For round 2, I took the 12 questions to the (simulated) stakeholders and put every answer back. No `[TBC]` remains.
- I checked that all 8 categories are covered and that all related FRs exist in FR-01 to FR-24.

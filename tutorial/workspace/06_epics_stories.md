# Backlog: Restaurant tablet (SoopiFood)

Sources: persona Sam, the Short-Staffed Night Manager (`03_personas.md`); FR-01 to FR-24; NFR-01 to NFR-13. Team: 5 developers, 2-week sprints. No story points (estimated at sprint planning).

## Epic 1: Order intake

### Feature 1.1: New-order alerts

**ST-01.** As Sam, I want a new order to alert me until I answer it, so that no order times out while I am on the floor.
- Given the tablet is online, when a customer completes checkout, then the tablet alerts within 10 seconds.
- Given an order is unanswered, when the alert sounds, then it repeats until the order is accepted or rejected.
- Given an order is unanswered, when I look at it, then I see the time left before it is cancelled.
- *Covers:* FR-01, FR-02, FR-03, NFR-01

### Feature 1.2: Accept or reject

**ST-02.** As Sam, I want to accept an order with a preparation time, so that the customer and the rider know when it will be ready.
- Given a new order, when I accept it, then I must choose a preparation time.
- Given I accepted with a preparation time, when the order is saved, then the customer and the rider receive that time.
- Given peak load, when I accept, then the action is confirmed within 2 seconds in at most 3 taps.
- *Covers:* FR-04, FR-07, FR-08, NFR-02, NFR-10

**ST-03.** As Sam, I want to reject an order with a reason, so that the owner can see why it was not served.
- Given a new order, when I reject it, then I must pick a reason from the list.
- Given I rejected an order, when the owner opens the order history, then the reason is shown.
- *Covers:* FR-05, FR-06

## Epic 2: Menu availability

### Feature 2.1: Sold-out items

**ST-04.** As Sam, I want to mark a dish as unavailable, so that customers cannot order it.
- Given a dish is available, when I mark it unavailable, then customers no longer see it within [TBC] seconds.
- Given a dish is unavailable, when the next business day starts, then it is available again.
- *Covers:* FR-09, FR-10, FR-11

**ST-05.** As Sam, I want to see open orders that contain a dish I just marked unavailable, so that I can contact those customers.
- Given two open orders contain grilled squid, when I mark grilled squid unavailable, then both orders are listed.
- Given no open order contains grilled squid, when I mark it unavailable, then no orders are listed.
- *Covers:* FR-12

### Feature 2.2: Pause orders

**ST-06.** As Sam, I want to pause new orders for a set time, so that the kitchen can catch up without leaving the app.
- Given orders are open, when I pause for one of the allowed durations, then no new orders arrive.
- Given a pause is running, when its duration ends, then new orders arrive again.
- Given a pause "until resumed", when I resume, then new orders arrive again.
- *Covers:* FR-13, FR-14

## Epic 3: Kitchen progress

### Feature 3.1: Order stages

**ST-07.** As Sam, I want each order to show its stage, so that the kitchen and I share one view.
- Given an accepted order, when staff move it to the next stage, then the new stage is shown on the tablet.
- Given the order list, when I look from 2 metres, then I can read each order's number and stage.
- *Covers:* FR-15, FR-16, NFR-09

**ST-08.** As Sam, I want late orders to be flagged, so that I can act before the customer complains.
- Given an order's preparation time has passed by [TBC] minutes, when I look at the list, then that order is flagged late.
- Given an order is ready before its time, when I look at the list, then it is not flagged.
- *Covers:* FR-17

## Epic 4: Rider handover

### Feature 4.1: Pickup check

**ST-09.** As Sam, I want the rider's pickup code to be matched before handover, so that bags are not swapped.
- Given an accepted order, when it is created, then it has a pickup code.
- Given a rider reads a code, when it matches the order, then the order becomes picked up.
- Given a rider reads a wrong code, when I enter it, then the order stays ready.
- *Covers:* FR-18, FR-19

### Feature 4.2: Missing rider

**ST-10.** As Sam, I want to report that no rider has come, so that the platform sends another rider.
- Given an order has been ready for [TBC] minutes, when no rider has arrived, then I can report it.
- Given an order has been ready for less than that, when I try to report, then the option is not available.
- *Covers:* FR-20

## Epic 5: Issue handling

### Feature 5.1: Refunds

**ST-11.** As Sam, I want to refund a single missing item with a reason, so that I do not spend minutes on the phone.
- Given a completed order, when I refund one item with a reason, then only that item is refunded.
- Given a refund, when it is processed, then no card number is stored on the tablet.
- Given the order was completed 24 hours ago, when I open it, then the customer's phone number is hidden.
- *Covers:* FR-21, FR-22, NFR-07, NFR-13

### Feature 5.2: Offline handling

**ST-12.** As Sam, I want to see when the tablet is offline and get all orders after reconnecting, so that no order is lost.
- Given the Wi-Fi drops, when 10 seconds pass, then the tablet shows it is offline.
- Given two orders arrived during the drop, when the connection returns, then both orders appear and alert.
- *Covers:* FR-23, FR-24, NFR-03, NFR-04

## Epic 6: Dependable service

### Feature 6.1: Busy evenings

**ST-13.** As Sam, I want the tablet to keep receiving orders during the dinner rush, so that busy evenings do not cost us orders.
- Given the city has 300 orders per minute, when a customer checks out at my restaurant, then my tablet alerts within 10 seconds.
- Given a month of dinner services, when the uptime report for 6-9pm is checked, then the order service was available at least 99.5% of the time.
- *Covers:* NFR-05, NFR-08

### Feature 6.2: Secure connection

**ST-14.** As Sam, I want order and customer data to travel securely between my tablet and SoopiFood, so that the restaurant does not leak personal data.
- Given my tablet is receiving orders, when the traffic is captured, then 100% of it is encrypted with TLS 1.2 or higher.
- Given a client offers only a TLS version below 1.2, when it connects to the order service, then the connection is refused.
- *Covers:* NFR-06

### Feature 6.3: Devices and updates

**ST-15.** As Sam, I want the app to run on the tablet we already own, so that we do not have to buy new hardware.
- Given one of the 3 models in the partner device list on Android 10 or later, when I install the app, then I can sign in and receive a test order.
- Given the app runs on any listed model, when I accept a test order, then the action is confirmed within 2 seconds.
- *Covers:* NFR-12, NFR-02

**ST-16.** As Sam, I want updates to the app to arrive without breaking what already works, so that a new version never disrupts service.
- Given a release build of the order service, when CI runs, then automated test coverage is at least 80%.
- Given coverage is below 80%, when the release is proposed, then it is blocked until coverage is restored.
- *Covers:* NFR-11

## My coverage check

I checked that each story is a vertical slice a manager could see working, has 2-4 acceptance criteria, and has no story points. In round 1, five NFRs (NFR-05, 06, 08, 11, 12) had no story; in round 2 I added Epic 6 (ST-13 to ST-16) to cover them, and used the stakeholder answers from Part D in the criteria.

| Item | Covered by |
|---|---|
| FR-01 to FR-24 | All covered (ST-01 to ST-12) |
| NFR-01 to NFR-13 | All covered: NFR-01 (ST-01), 02 (ST-02, ST-15), 03-04 (ST-12), 05 (ST-13), 06 (ST-14), 07 (ST-11), 08 (ST-13), 09 (ST-07), 10 (ST-02), 11 (ST-16), 12 (ST-15), 13 (ST-11) |
| Not covered | None |

The three `[TBC]` values left in ST-04, ST-08 and ST-10 come from functional requirements FR-10, FR-17 and FR-20; they are open questions from Part C.

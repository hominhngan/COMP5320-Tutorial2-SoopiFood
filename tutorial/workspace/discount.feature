# assumption: code SAVE20 gives 20% off the order total including delivery, minimum order 50,000 VND, a code is valid before its expiry date and expired on that date
Feature: Apply a promo code at checkout
  As a customer, I want to apply a promo code at checkout so that I pay less.

  Background:
    Given the promo code "SAVE20" gives 20% off
    And the promo code "SAVE20" expires on 2026-12-31
    And the delivery fee is 15,000 VND

  @happy
  Scenario: Valid code reduces the total
    Given my food subtotal is 200,000 VND
    When I apply the promo code "SAVE20" on 2026-12-01
    Then the discount is 43,000 VND
    And the total to pay is 172,000 VND

  @error
  Scenario: Order below the minimum is rejected
    Given my food subtotal is 40,000 VND
    When I apply the promo code "SAVE20" on 2026-12-01
    Then the code is rejected with the message "Minimum order is 50,000 VND"

  @edge
  Scenario: Code is expired on its expiry date
    Given my food subtotal is 200,000 VND
    When I apply the promo code "SAVE20" on 2026-12-31
    Then the code is rejected with the message "Promo code expired"

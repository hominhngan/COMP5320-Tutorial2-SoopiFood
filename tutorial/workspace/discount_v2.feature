# assumption: the code name "SAVE20", its 30,000 VND cap, its 2026-12-31 valid-until date and the 15,000 VND delivery fee are test data, not in the rules
Feature: Apply a promo code at checkout
  As a customer, I want to apply a promo code at checkout so that I pay less.

  Background:
    Given the promo code "SAVE20" gives 20% off with a cap of 30,000 VND
    And the promo code "SAVE20" is valid until 2026-12-31
    And the delivery fee is 15,000 VND

  # R2 cap
  @happy
  Scenario: Discount exactly at the cap excludes the delivery fee
    Given my food subtotal is 150,000 VND
    When I apply the promo code "SAVE20" on 2026-12-01
    Then the discount is 30,000 VND
    And the total to pay is 135,000 VND

  # R1 minimum order
  @error
  Scenario: Subtotal one dong below the minimum is rejected
    Given my food subtotal is 99,999 VND
    When I apply the promo code "SAVE20" on 2026-12-01
    Then the code is rejected with reason "MIN_ORDER_NOT_MET"

  # R3 validity
  @edge
  Scenario: Code is still valid on its valid-until date
    Given my food subtotal is 100,000 VND
    When I apply the promo code "SAVE20" on 2026-12-31
    Then the discount is 20,000 VND
    And the total to pay is 95,000 VND

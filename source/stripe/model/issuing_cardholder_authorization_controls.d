// File automatically generated from OpenAPI spec.
module stripe.model.issuing_cardholder_authorization_controls;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;

import stripe.model.issuing_cardholder_spending_limit : IssuingCardholderSpendingLimit;

/**
 */
class IssuingCardholderAuthorizationControls {
  /**
   * Limit spending with amount-based rules that apply across this cardholder's cards.
   */
  @optional
  IssuingCardholderSpendingLimit[] spending_limits;

  /**
   * Array of strings containing
   * [categories](https://stripe.com/docs/api#issuing_authorization_object-merchant_data-category)
   * of authorizations to allow. All other categories will be blocked. Cannot be set with
   * `blocked_categories`.
   */
  @optional
  string[] allowed_categories;

  /**
   * Array of strings containing
   * [categories](https://stripe.com/docs/api#issuing_authorization_object-merchant_data-category)
   * of authorizations to decline. All other categories will be allowed. Cannot be set with
   * `allowed_categories`.
   */
  @optional
  string[] blocked_categories;

  /**
   * Currency of the amounts within `spending_limits`.
   */
  @optional
  string spending_limits_currency;

}

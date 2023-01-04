// File automatically generated from OpenAPI spec.
module stripe.model.issuing_card_spending_limit;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;


/**
 */
class IssuingCardSpendingLimit {
  /**
   * Maximum amount allowed to spend per interval. This amount is in the card's currency and in
   * the [smallest currency unit](https://stripe.com/docs/currencies#zero-decimal).
   */
  @optional
  Nullable!(int) amount;

  /**
   * Array of strings containing
   * [categories](https://stripe.com/docs/api#issuing_authorization_object-merchant_data-category)
   * this limit applies to. Omitting this field will apply the limit to all categories.
   */
  @optional
  string[] categories;

  /**
   * Interval (or event) to which the amount applies.
   */
  @optional
  string interval;

}

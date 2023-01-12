// File automatically generated from OpenAPI spec.
module stripe.model.issuing_card_authorization_controls;

import vibe.data.serialization : optional;
import vibe.data.json : Json;
import builder : AddBuilder;

import std.typecons : Nullable;

import stripe.model.issuing_card_spending_limit : IssuingCardSpendingLimit;

/**
 */
class IssuingCardAuthorizationControls {
  /**
   * Limit spending with amount-based rules that apply across any cards this card replaced (i.e.,
   * its `replacement_for` card and _that_ card's `replacement_for` card, up the chain).
   */
  @optional
  IssuingCardSpendingLimit[] spending_limits;

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
   * Currency of the amounts within `spending_limits`. Always the same as the currency of the
   * card.
   */
  @optional
  string spending_limits_currency;

  mixin AddBuilder!(typeof(this));

}

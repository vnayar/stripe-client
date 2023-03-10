// File automatically generated from OpenAPI spec.
module stripe.model.issuing_card_apple_pay;

import vibe.data.serialization : optional;
import vibe.data.json : Json;
import builder : AddBuilder;

import std.typecons : Nullable;


/**
 */
class IssuingCardApplePay {
  /**
   * Apple Pay Eligibility
   */
  @optional
  Nullable!(bool) eligible;

  /**
   * Reason the card is ineligible for Apple Pay
   */
  @optional
  string ineligible_reason;

  mixin AddBuilder!(typeof(this));

}

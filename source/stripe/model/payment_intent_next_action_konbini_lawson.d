// File automatically generated from OpenAPI spec.
module stripe.model.payment_intent_next_action_konbini_lawson;

import vibe.data.serialization : optional;
import vibe.data.json : Json;
import builder : AddBuilder;

import std.typecons : Nullable;


/**
 */
class PaymentIntentNextActionKonbiniLawson {
  /**
   * The payment code.
   */
  @optional
  string payment_code;

  /**
   * The confirmation number.
   */
  @optional
  string confirmation_number;

  mixin AddBuilder!(typeof(this));

}

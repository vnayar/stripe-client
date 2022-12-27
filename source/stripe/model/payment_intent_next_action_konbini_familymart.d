// File automatically generated from OpenAPI spec.
module stripe.model.payment_intent_next_action_konbini_familymart;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;


/**
 */
class PaymentIntentNextActionKonbiniFamilymart {
  /**
   * The payment code.
   */
  @optional
  Nullable!(string) payment_code;

  /**
   * The confirmation number.
   */
  @optional
  Nullable!(string) confirmation_number;

}

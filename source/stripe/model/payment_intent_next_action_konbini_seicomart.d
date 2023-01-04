// File automatically generated from OpenAPI spec.
module stripe.model.payment_intent_next_action_konbini_seicomart;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;


/**
 */
class PaymentIntentNextActionKonbiniSeicomart {
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

}

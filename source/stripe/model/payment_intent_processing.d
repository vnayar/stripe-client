// File automatically generated from OpenAPI spec.
module stripe.model.payment_intent_processing;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;

import stripe.model.payment_intent_card_processing : PaymentIntentCardProcessing;

/**
 */
class PaymentIntentProcessing {
  @optional
  PaymentIntentCardProcessing card;

  /**
   * Type of the payment method for which payment is in `processing` state, one of `card`.
   */
  @optional
  Nullable!(string) type;

}

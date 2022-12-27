// File automatically generated from OpenAPI spec.
module stripe.model.card_generated_from_payment_method_details;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;

import stripe.model.payment_method_details_card_present : PaymentMethodDetailsCardPresent;

/**
 */
class CardGeneratedFromPaymentMethodDetails {
  /**
   * The type of payment method transaction-specific details from the transaction that generated
   * this `card` payment method. Always `card_present`.
   */
  @optional
  Nullable!(string) type;

  @optional
  PaymentMethodDetailsCardPresent card_present;

}

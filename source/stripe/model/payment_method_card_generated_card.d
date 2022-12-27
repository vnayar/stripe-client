// File automatically generated from OpenAPI spec.
module stripe.model.payment_method_card_generated_card;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;

import stripe.model.card_generated_from_payment_method_details : CardGeneratedFromPaymentMethodDetails;
import stripe.model.setup_attempt : SetupAttempt;

/**
 */
class PaymentMethodCardGeneratedCard {
  /**
   * The ID of the SetupAttempt that generated this PaymentMethod, if any.
   */
  @optional
  Json setup_attempt;

  /**
   * Transaction-specific details of the payment method used in the payment.
   */
  @optional
  CardGeneratedFromPaymentMethodDetails payment_method_details;

  /**
   * The charge that created this object.
   */
  @optional
  Nullable!(string) charge;

}

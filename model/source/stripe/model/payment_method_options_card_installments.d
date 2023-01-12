// File automatically generated from OpenAPI spec.
module stripe.model.payment_method_options_card_installments;

import vibe.data.serialization : optional;
import vibe.data.json : Json;
import builder : AddBuilder;

import std.typecons : Nullable;

import stripe.model.payment_method_details_card_installments_plan : PaymentMethodDetailsCardInstallmentsPlan;

/**
 */
class PaymentMethodOptionsCardInstallments {
  /**
   * Whether Installments are enabled for this PaymentIntent.
   */
  @optional
  Nullable!(bool) enabled;

  /**
   * Installment plans that may be selected for this PaymentIntent.
   */
  @optional
  PaymentMethodDetailsCardInstallmentsPlan[] available_plans;

  /**
   * Installment plan selected for this PaymentIntent.
   */
  @optional
  PaymentMethodDetailsCardInstallmentsPlan plan;

  mixin AddBuilder!(typeof(this));

}

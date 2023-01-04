// File automatically generated from OpenAPI spec.
module stripe.model.payment_intent_payment_method_options_sepa_debit;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;

import stripe.model.payment_intent_payment_method_options_mandate_options_sepa_debit : PaymentIntentPaymentMethodOptionsMandateOptionsSepaDebit;

/**
 */
class PaymentIntentPaymentMethodOptionsSepaDebit {
  @optional
  PaymentIntentPaymentMethodOptionsMandateOptionsSepaDebit mandate_options;

  /**
   * Indicates that you intend to make future payments with this PaymentIntent's payment method.
   * Providing this parameter will [attach the payment
   * method](https://stripe.com/docs/payments/save-during-payment) to the PaymentIntent's
   * Customer, if present, after the PaymentIntent is confirmed and any required actions from the
   * user are complete. If no Customer was provided, the payment method can still be
   * [attached](https://stripe.com/docs/api/payment_methods/attach) to a Customer after the
   * transaction completes.
   * When processing card payments, Stripe also uses `setup_future_usage` to dynamically optimize
   * your payment flow and comply with regional legislation and network rules, such as
   * [SCA](https://stripe.com/docs/strong-customer-authentication).
   */
  @optional
  string setup_future_usage;

}

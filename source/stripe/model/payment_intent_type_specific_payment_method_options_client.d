// File automatically generated from OpenAPI spec.
module stripe.model.payment_intent_type_specific_payment_method_options_client;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;

import stripe.model.payment_flows_installment_options : PaymentFlowsInstallmentOptions;

/**
 */
class PaymentIntentTypeSpecificPaymentMethodOptionsClient {
  @optional
  PaymentFlowsInstallmentOptions installments;

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
  Nullable!(string) setup_future_usage;

  /**
   * Controls when the funds will be captured from the customer's account.
   */
  @optional
  Nullable!(string) capture_method;

  /**
   * Bank account verification method.
   */
  @optional
  Nullable!(string) verification_method;

}

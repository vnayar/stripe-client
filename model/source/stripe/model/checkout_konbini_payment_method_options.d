// File automatically generated from OpenAPI spec.
module stripe.model.checkout_konbini_payment_method_options;

import vibe.data.serialization : optional;
import vibe.data.json : Json;
import builder : AddBuilder;

import std.typecons : Nullable;


/**
 */
class CheckoutKonbiniPaymentMethodOptions {
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

  /**
   * The number of calendar days (between 1 and 60) after which Konbini payment instructions will
   * expire. For example, if a PaymentIntent is confirmed with Konbini and `expires_after_days`
   * set to 2 on Monday JST, the instructions will expire on Wednesday 23:59:59 JST.
   */
  @optional
  Nullable!(int) expires_after_days;

  mixin AddBuilder!(typeof(this));

}

// File automatically generated from OpenAPI spec.
module stripe.model.payment_method_options_pix;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;


/**
 */
class PaymentMethodOptionsPix {
  /**
   * The number of seconds (between 10 and 1209600) after which Pix payment will expire.
   */
  @optional
  Nullable!(int) expires_after_seconds;

  /**
   * The timestamp at which the Pix expires.
   */
  @optional
  Nullable!(int) expires_at;

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

}

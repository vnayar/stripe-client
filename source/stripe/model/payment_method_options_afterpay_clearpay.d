// File automatically generated from OpenAPI spec.
module stripe.model.payment_method_options_afterpay_clearpay;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;


/**
 */
class PaymentMethodOptionsAfterpayClearpay {
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
   * Order identifier shown to the customer in Afterpay’s online portal. We recommend using a
   * value that helps you answer any questions a customer might have about
   * the payment. The identifier is limited to 128 characters and may contain only letters,
   * digits, underscores, backslashes and dashes.
   */
  @optional
  Nullable!(string) reference;

}

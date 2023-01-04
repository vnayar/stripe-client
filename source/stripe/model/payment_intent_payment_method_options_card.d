// File automatically generated from OpenAPI spec.
module stripe.model.payment_intent_payment_method_options_card;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;

import stripe.model.payment_method_options_card_installments : PaymentMethodOptionsCardInstallments;
import stripe.model.payment_method_options_card_mandate_options : PaymentMethodOptionsCardMandateOptions;

/**
 */
class PaymentIntentPaymentMethodOptionsCard {
  /**
   * Controls when the funds will be captured from the customer's account.
   */
  @optional
  string capture_method;

  /**
   * Provides information about a card payment that customers see on their statements.
   * Concatenated with the Kanji prefix (shortened Kanji descriptor) or Kanji statement descriptor
   * that’s set on the account to form the complete statement descriptor. Maximum 17 characters.
   * On card statements, the *concatenation* of both prefix and suffix (including separators) will
   * appear truncated to 17 characters.
   */
  @optional
  string statement_descriptor_suffix_kanji;

  /**
   * We strongly recommend that you rely on our SCA Engine to automatically prompt your customers
   * for authentication based on risk level and [other
   * requirements](https://stripe.com/docs/strong-customer-authentication). However, if you wish
   * to request 3D Secure based on logic from your own fraud engine, provide this option.
   * Permitted values include: `automatic` or `any`. If not provided, defaults to `automatic`.
   * Read our guide on [manually requesting 3D
   * Secure](https://stripe.com/docs/payments/3d-secure#manual-three-ds) for more information on
   * how this configuration interacts with Radar and our SCA Engine.
   */
  @optional
  string request_three_d_secure;

  /**
   * Installment details for this payment (Mexico only).
   * For more information, see the [installments integration
   * guide](https://stripe.com/docs/payments/installments).
   */
  @optional
  PaymentMethodOptionsCardInstallments installments;

  /**
   * Selected network to process this payment intent on. Depends on the available networks of the
   * card attached to the payment intent. Can be only set confirm-time.
   */
  @optional
  string network;

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
   * Provides information about a card payment that customers see on their statements.
   * Concatenated with the Kana prefix (shortened Kana descriptor) or Kana statement descriptor
   * that’s set on the account to form the complete statement descriptor. Maximum 22 characters.
   * On card statements, the *concatenation* of both prefix and suffix (including separators) will
   * appear truncated to 22 characters.
   */
  @optional
  string statement_descriptor_suffix_kana;

  /**
   * Configuration options for setting up an eMandate for cards issued in India.
   */
  @optional
  PaymentMethodOptionsCardMandateOptions mandate_options;

}

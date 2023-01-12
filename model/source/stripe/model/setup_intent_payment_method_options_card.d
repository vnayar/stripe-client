// File automatically generated from OpenAPI spec.
module stripe.model.setup_intent_payment_method_options_card;

import vibe.data.serialization : optional;
import vibe.data.json : Json;
import builder : AddBuilder;

import std.typecons : Nullable;

import stripe.model.setup_intent_payment_method_options_card_mandate_options : SetupIntentPaymentMethodOptionsCardMandateOptions;

/**
 */
class SetupIntentPaymentMethodOptionsCard {
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
   * Configuration options for setting up an eMandate for cards issued in India.
   */
  @optional
  SetupIntentPaymentMethodOptionsCardMandateOptions mandate_options;

  /**
   * Selected network to process this SetupIntent on. Depends on the available networks of the
   * card attached to the setup intent. Can be only set confirm-time.
   */
  @optional
  string network;

  mixin AddBuilder!(typeof(this));

}

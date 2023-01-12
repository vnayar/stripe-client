// File automatically generated from OpenAPI spec.
module stripe.model.subscription_payment_method_options_card;

import vibe.data.serialization : optional;
import vibe.data.json : Json;
import builder : AddBuilder;

import std.typecons : Nullable;

import stripe.model.invoice_mandate_options_card : InvoiceMandateOptionsCard;

/**
 */
class SubscriptionPaymentMethodOptionsCard {
  /**
   * We strongly recommend that you rely on our SCA Engine to automatically prompt your customers
   * for authentication based on risk level and [other
   * requirements](https://stripe.com/docs/strong-customer-authentication). However, if you wish
   * to request 3D Secure based on logic from your own fraud engine, provide this option. Read our
   * guide on [manually requesting 3D
   * Secure](https://stripe.com/docs/payments/3d-secure#manual-three-ds) for more information on
   * how this configuration interacts with Radar and our SCA Engine.
   */
  @optional
  string request_three_d_secure;

  @optional
  InvoiceMandateOptionsCard mandate_options;

  /**
   * Selected network to process this Subscription on. Depends on the available networks of the
   * card attached to the Subscription. Can be only set confirm-time.
   */
  @optional
  string network;

  mixin AddBuilder!(typeof(this));

}

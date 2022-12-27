// File automatically generated from OpenAPI spec.
module stripe.model.payment_links_resource_custom_text;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;

import stripe.model.payment_links_resource_custom_text_position : PaymentLinksResourceCustomTextPosition;

/**
 */
class PaymentLinksResourceCustomText {
  /**
   * Custom text that should be displayed alongside shipping address collection.
   */
  @optional
  PaymentLinksResourceCustomTextPosition shipping_address;

  /**
   * Custom text that should be displayed alongside the payment confirmation button.
   */
  @optional
  PaymentLinksResourceCustomTextPosition submit;

}

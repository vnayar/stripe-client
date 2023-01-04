// File automatically generated from OpenAPI spec.
module stripe.model.payment_links_resource_custom_text_position;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;


/**
 */
class PaymentLinksResourceCustomTextPosition {
  /**
   * Text may be up to 500 characters in length.
   */
  @optional
  string message;

}

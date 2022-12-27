// File automatically generated from OpenAPI spec.
module stripe.model.payment_pages_checkout_session_tax_id_collection;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;


/**
 */
class PaymentPagesCheckoutSessionTaxIdCollection {
  /**
   * Indicates whether tax ID collection is enabled for the session
   */
  @optional
  Nullable!(bool) enabled;

}

// File automatically generated from OpenAPI spec.
module stripe.model.payment_links_resource_tax_id_collection;

import vibe.data.serialization : optional;
import vibe.data.json : Json;
import builder : AddBuilder;

import std.typecons : Nullable;


/**
 */
class PaymentLinksResourceTaxIdCollection {
  /**
   * Indicates whether tax ID collection is enabled for the session.
   */
  @optional
  Nullable!(bool) enabled;

  mixin AddBuilder!(typeof(this));

}

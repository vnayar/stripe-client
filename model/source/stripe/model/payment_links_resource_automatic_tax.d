// File automatically generated from OpenAPI spec.
module stripe.model.payment_links_resource_automatic_tax;

import vibe.data.serialization : optional;
import vibe.data.json : Json;
import builder : AddBuilder;

import std.typecons : Nullable;


/**
 */
class PaymentLinksResourceAutomaticTax {
  /**
   * If `true`, tax will be calculated automatically using the customer's location.
   */
  @optional
  Nullable!(bool) enabled;

  mixin AddBuilder!(typeof(this));

}

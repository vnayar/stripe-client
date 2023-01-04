// File automatically generated from OpenAPI spec.
module stripe.model.payment_links_resource_shipping_address_collection;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;


/**
 */
class PaymentLinksResourceShippingAddressCollection {
  /**
   * An array of two-letter ISO country codes representing which countries Checkout should provide
   * as options for shipping locations. Unsupported country codes: `AS, CX, CC, CU, HM, IR, KP,
   * MH, FM, NF, MP, PW, SD, SY, UM, VI`.
   */
  @optional
  string[] allowed_countries;

}

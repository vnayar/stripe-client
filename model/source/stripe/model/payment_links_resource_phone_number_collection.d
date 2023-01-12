// File automatically generated from OpenAPI spec.
module stripe.model.payment_links_resource_phone_number_collection;

import vibe.data.serialization : optional;
import vibe.data.json : Json;
import builder : AddBuilder;

import std.typecons : Nullable;


/**
 */
class PaymentLinksResourcePhoneNumberCollection {
  /**
   * If `true`, a phone number will be collected during checkout.
   */
  @optional
  Nullable!(bool) enabled;

  mixin AddBuilder!(typeof(this));

}

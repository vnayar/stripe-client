// File automatically generated from OpenAPI spec.
module stripe.model.payment_method_details_multibanco;

import vibe.data.serialization : optional;
import vibe.data.json : Json;
import builder : AddBuilder;

import std.typecons : Nullable;


/**
 */
class PaymentMethodDetailsMultibanco {
  /**
   * Entity number associated with this Multibanco payment.
   */
  @optional
  string entity;

  /**
   * Reference number associated with this Multibanco payment.
   */
  @optional
  string reference;

  mixin AddBuilder!(typeof(this));

}

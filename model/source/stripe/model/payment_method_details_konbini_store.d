// File automatically generated from OpenAPI spec.
module stripe.model.payment_method_details_konbini_store;

import vibe.data.serialization : optional;
import vibe.data.json : Json;
import builder : AddBuilder;

import std.typecons : Nullable;


/**
 */
class PaymentMethodDetailsKonbiniStore {
  /**
   * The name of the convenience store chain where the payment was completed.
   */
  @optional
  string chain;

  mixin AddBuilder!(typeof(this));

}

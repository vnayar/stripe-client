// File automatically generated from OpenAPI spec.
module stripe.model.payment_method_details_konbini;

import vibe.data.serialization : optional;
import vibe.data.json : Json;
import builder : AddBuilder;

import std.typecons : Nullable;

import stripe.model.payment_method_details_konbini_store : PaymentMethodDetailsKonbiniStore;

/**
 */
class PaymentMethodDetailsKonbini {
  /**
   * If the payment succeeded, this contains the details of the convenience store where the
   * payment was completed.
   */
  @optional
  PaymentMethodDetailsKonbiniStore store;

  mixin AddBuilder!(typeof(this));

}

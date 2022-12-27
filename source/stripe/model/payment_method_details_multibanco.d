// File automatically generated from OpenAPI spec.
module stripe.model.payment_method_details_multibanco;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;


/**
 */
class PaymentMethodDetailsMultibanco {
  /**
   * Entity number associated with this Multibanco payment.
   */
  @optional
  Nullable!(string) entity;

  /**
   * Reference number associated with this Multibanco payment.
   */
  @optional
  Nullable!(string) reference;

}

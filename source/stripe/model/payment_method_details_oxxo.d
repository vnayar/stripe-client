// File automatically generated from OpenAPI spec.
module stripe.model.payment_method_details_oxxo;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;


/**
 */
class PaymentMethodDetailsOxxo {
  /**
   * OXXO reference number
   */
  @optional
  Nullable!(string) number;

}

// File automatically generated from OpenAPI spec.
module stripe.model.payment_method_p24;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;


/**
 */
class PaymentMethodP24 {
  /**
   * The customer's bank, if provided.
   */
  @optional
  string bank;

}

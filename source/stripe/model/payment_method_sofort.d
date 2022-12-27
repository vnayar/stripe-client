// File automatically generated from OpenAPI spec.
module stripe.model.payment_method_sofort;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;


/**
 */
class PaymentMethodSofort {
  /**
   * Two-letter ISO code representing the country the bank account is located in.
   */
  @optional
  Nullable!(string) country;

}

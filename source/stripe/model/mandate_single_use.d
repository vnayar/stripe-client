// File automatically generated from OpenAPI spec.
module stripe.model.mandate_single_use;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;


/**
 */
class MandateSingleUse {
  /**
   * On a single use mandate, the amount of the payment.
   */
  @optional
  Nullable!(int) amount;

  /**
   * On a single use mandate, the currency of the payment.
   */
  @optional
  string currency;

}

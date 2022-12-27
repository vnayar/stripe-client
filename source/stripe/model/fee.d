// File automatically generated from OpenAPI spec.
module stripe.model.fee;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;


/**
 */
class Fee {
  /**
   * An arbitrary string attached to the object. Often useful for displaying to users.
   */
  @optional
  Nullable!(string) description;

  /**
   * Type of the fee, one of: `application_fee`, `stripe_fee` or `tax`.
   */
  @optional
  Nullable!(string) type;

  /**
   * Amount of the fee, in cents.
   */
  @optional
  Nullable!(int) amount;

  /**
   * Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in
   * lowercase. Must be a [supported currency](https://stripe.com/docs/currencies).
   */
  @optional
  Nullable!(string) currency;

  /**
   * ID of the Connect application that earned the fee.
   */
  @optional
  Nullable!(string) application;

}

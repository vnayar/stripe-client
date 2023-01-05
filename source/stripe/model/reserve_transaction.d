// File automatically generated from OpenAPI spec.
module stripe.model.reserve_transaction;

import vibe.data.serialization : optional;
import vibe.data.json : Json;
import builder : AddBuilder;

import std.typecons : Nullable;


/**
 */
class ReserveTransaction {
  /**
   * An arbitrary string attached to the object. Often useful for displaying to users.
   */
  @optional
  string description;

  @optional
  Nullable!(int) amount;

  /**
   * Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in
   * lowercase. Must be a [supported currency](https://stripe.com/docs/currencies).
   */
  @optional
  string currency;

  /**
   * Unique identifier for the object.
   */
  @optional
  string id;

  /**
   * String representing the object's type. Objects of the same type share the same value.
   */
  @optional
  string object;

  mixin AddBuilder!(typeof(this));

}

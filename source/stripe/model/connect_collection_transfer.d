// File automatically generated from OpenAPI spec.
module stripe.model.connect_collection_transfer;

import vibe.data.serialization : optional;
import vibe.data.json : Json;
import builder : AddBuilder;

import std.typecons : Nullable;

import stripe.model.account : Account;

/**
 */
class ConnectCollectionTransfer {
  /**
   * Has the value `true` if the object exists in live mode or the value `false` if the object
   * exists in test mode.
   */
  @optional
  Nullable!(bool) livemode;

  /**
   * Amount transferred, in %s.
   */
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

  /**
   * ID of the account that funds are being collected for.
   */
  @optional
  Json destination;

  mixin AddBuilder!(typeof(this));

}

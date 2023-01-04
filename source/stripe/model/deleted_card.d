// File automatically generated from OpenAPI spec.
module stripe.model.deleted_card;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;


/**
 */
class DeletedCard {
  /**
   * Unique identifier for the object.
   */
  @optional
  string id;

  /**
   * Three-letter [ISO code for the currency](https://stripe.com/docs/payouts) paid out to the
   * bank account.
   */
  @optional
  string currency;

  /**
   * String representing the object's type. Objects of the same type share the same value.
   */
  @optional
  string object;

  /**
   * Always true for a deleted object
   */
  @optional
  Nullable!(bool) deleted;

}

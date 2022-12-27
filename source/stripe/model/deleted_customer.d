// File automatically generated from OpenAPI spec.
module stripe.model.deleted_customer;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;


/**
 */
class DeletedCustomer {
  /**
   * Unique identifier for the object.
   */
  @optional
  Nullable!(string) id;

  /**
   * String representing the object's type. Objects of the same type share the same value.
   */
  @optional
  Nullable!(string) object;

  /**
   * Always true for a deleted object
   */
  @optional
  Nullable!(bool) deleted;

}

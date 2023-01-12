// File automatically generated from OpenAPI spec.
module stripe.model.deleted_invoice;

import vibe.data.serialization : optional;
import vibe.data.json : Json;
import builder : AddBuilder;

import std.typecons : Nullable;


/**
 */
class DeletedInvoice {
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
   * Always true for a deleted object
   */
  @optional
  Nullable!(bool) deleted;

  mixin AddBuilder!(typeof(this));

}

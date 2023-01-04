// File automatically generated from OpenAPI spec.
module stripe.model.deleted_application;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;


/**
 */
class DeletedApplication {
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

  /**
   * The name of the application.
   */
  @optional
  string name;

}

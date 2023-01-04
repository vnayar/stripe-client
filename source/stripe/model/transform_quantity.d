// File automatically generated from OpenAPI spec.
module stripe.model.transform_quantity;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;


/**
 */
class TransformQuantity {
  /**
   * Divide usage by this number.
   */
  @optional
  Nullable!(int) divide_by;

  /**
   * After division, either round the result `up` or `down`.
   */
  @optional
  string round;

}

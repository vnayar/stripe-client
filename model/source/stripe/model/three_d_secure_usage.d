// File automatically generated from OpenAPI spec.
module stripe.model.three_d_secure_usage;

import vibe.data.serialization : optional;
import vibe.data.json : Json;
import builder : AddBuilder;

import std.typecons : Nullable;


/**
 */
class ThreeDSecureUsage {
  /**
   * Whether 3D Secure is supported on this card.
   */
  @optional
  Nullable!(bool) supported;

  mixin AddBuilder!(typeof(this));

}

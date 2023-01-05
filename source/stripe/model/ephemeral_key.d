// File automatically generated from OpenAPI spec.
module stripe.model.ephemeral_key;

import vibe.data.serialization : optional;
import vibe.data.json : Json;
import builder : AddBuilder;

import std.typecons : Nullable;


/**
 */
class EphemeralKey {
  /**
   * Has the value `true` if the object exists in live mode or the value `false` if the object
   * exists in test mode.
   */
  @optional
  Nullable!(bool) livemode;

  /**
   * The key's secret. You can use this value to make authorized requests to the Stripe API.
   */
  @optional
  string secret;

  /**
   * Time at which the object was created. Measured in seconds since the Unix epoch.
   */
  @optional
  Nullable!(long) created;

  /**
   * Time at which the key will expire. Measured in seconds since the Unix epoch.
   */
  @optional
  Nullable!(long) expires;

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

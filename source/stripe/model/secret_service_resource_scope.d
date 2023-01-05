// File automatically generated from OpenAPI spec.
module stripe.model.secret_service_resource_scope;

import vibe.data.serialization : optional;
import vibe.data.json : Json;
import builder : AddBuilder;

import std.typecons : Nullable;


/**
 */
class SecretServiceResourceScope {
  /**
   * The secret scope type.
   */
  @optional
  string type;

  /**
   * The user ID, if type is set to "user"
   */
  @optional
  string user;

  mixin AddBuilder!(typeof(this));

}

// File automatically generated from OpenAPI spec.
module stripe.model.secret_service_resource_scope;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;


/**
 */
class SecretServiceResourceScope {
  /**
   * The secret scope type.
   */
  @optional
  Nullable!(string) type;

  /**
   * The user ID, if type is set to "user"
   */
  @optional
  Nullable!(string) user;

}

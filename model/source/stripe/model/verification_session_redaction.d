// File automatically generated from OpenAPI spec.
module stripe.model.verification_session_redaction;

import vibe.data.serialization : optional;
import vibe.data.json : Json;
import builder : AddBuilder;

import std.typecons : Nullable;


/**
 */
class VerificationSessionRedaction {
  /**
   * Indicates whether this object and its related objects have been redacted or not.
   */
  @optional
  string status;

  mixin AddBuilder!(typeof(this));

}

// File automatically generated from OpenAPI spec.
module stripe.model.verification_session_redaction;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;


/**
 */
class VerificationSessionRedaction {
  /**
   * Indicates whether this object and its related objects have been redacted or not.
   */
  @optional
  Nullable!(string) status;

}

// File automatically generated from OpenAPI spec.
module stripe.model.gelato_session_last_error;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;


/**
 * Shows last VerificationSession error
 */
class GelatoSessionLastError {
  /**
   * A message that explains the reason for verification or user-session failure.
   */
  @optional
  string reason;

  /**
   * A short machine-readable string giving the reason for the verification or user-session
   * failure.
   */
  @optional
  string code;

}

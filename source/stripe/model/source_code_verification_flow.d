// File automatically generated from OpenAPI spec.
module stripe.model.source_code_verification_flow;

import vibe.data.serialization : optional;
import vibe.data.json : Json;
import builder : AddBuilder;

import std.typecons : Nullable;


/**
 */
class SourceCodeVerificationFlow {
  /**
   * The number of attempts remaining to authenticate the source object with a verification code.
   */
  @optional
  Nullable!(int) attempts_remaining;

  /**
   * The status of the code verification, either `pending` (awaiting verification,
   * `attempts_remaining` should be greater than 0), `succeeded` (successful verification) or
   * `failed` (failed verification, cannot be verified anymore as `attempts_remaining` should be
   * 0).
   */
  @optional
  string status;

  mixin AddBuilder!(typeof(this));

}

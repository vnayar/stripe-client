// File automatically generated from OpenAPI spec.
module stripe.model.account_requirements_error;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;


/**
 */
class AccountRequirementsError {
  /**
   * An informative message that indicates the error type and provides additional details about
   * the error.
   */
  @optional
  string reason;

  /**
   * The specific user onboarding requirement field (in the requirements hash) that needs to be
   * resolved.
   */
  @optional
  string requirement;

  /**
   * The code for the type of error.
   */
  @optional
  string code;

}

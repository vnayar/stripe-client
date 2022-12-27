// File automatically generated from OpenAPI spec.
module stripe.model.setup_intent_next_action_verify_with_microdeposits;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;


/**
 */
class SetupIntentNextActionVerifyWithMicrodeposits {
  /**
   * The URL for the hosted verification page, which allows customers to verify their bank
   * account.
   */
  @optional
  Nullable!(string) hosted_verification_url;

  /**
   * The timestamp when the microdeposits are expected to land.
   */
  @optional
  Nullable!(long) arrival_date;

  /**
   * The type of the microdeposit sent to the customer. Used to distinguish between different
   * verification methods.
   */
  @optional
  Nullable!(string) microdeposit_type;

}

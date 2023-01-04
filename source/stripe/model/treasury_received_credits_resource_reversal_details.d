// File automatically generated from OpenAPI spec.
module stripe.model.treasury_received_credits_resource_reversal_details;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;


/**
 */
class TreasuryReceivedCreditsResourceReversalDetails {
  /**
   * Time before which a ReceivedCredit can be reversed.
   */
  @optional
  Nullable!(long) deadline;

  /**
   * Set if a ReceivedCredit cannot be reversed.
   */
  @optional
  string restricted_reason;

}

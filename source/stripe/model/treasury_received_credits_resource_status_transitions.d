// File automatically generated from OpenAPI spec.
module stripe.model.treasury_received_credits_resource_status_transitions;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;


/**
 */
class TreasuryReceivedCreditsResourceStatusTransitions {
  /**
   * Timestamp describing when the CreditReversal changed status to `posted`
   */
  @optional
  Nullable!(long) posted_at;

}

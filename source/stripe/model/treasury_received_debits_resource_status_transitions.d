// File automatically generated from OpenAPI spec.
module stripe.model.treasury_received_debits_resource_status_transitions;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;


/**
 */
class TreasuryReceivedDebitsResourceStatusTransitions {
  /**
   * Timestamp describing when the DebitReversal changed status to `completed`.
   */
  @optional
  Nullable!(long) completed_at;

}

// File automatically generated from OpenAPI spec.
module stripe.model.treasury_received_debits_resource_reversal_details;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;


/**
 */
class TreasuryReceivedDebitsResourceReversalDetails {
  /**
   * Time before which a ReceivedDebit can be reversed.
   */
  @optional
  Nullable!(long) deadline;

  /**
   * Set if a ReceivedDebit can't be reversed.
   */
  @optional
  string restricted_reason;

}

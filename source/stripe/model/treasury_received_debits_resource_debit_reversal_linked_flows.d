// File automatically generated from OpenAPI spec.
module stripe.model.treasury_received_debits_resource_debit_reversal_linked_flows;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;


/**
 */
class TreasuryReceivedDebitsResourceDebitReversalLinkedFlows {
  /**
   * Set if there is an Issuing dispute associated with the DebitReversal.
   */
  @optional
  Nullable!(string) issuing_dispute;

}

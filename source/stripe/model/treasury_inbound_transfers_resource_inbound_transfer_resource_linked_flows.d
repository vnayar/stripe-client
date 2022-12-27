// File automatically generated from OpenAPI spec.
module stripe.model.treasury_inbound_transfers_resource_inbound_transfer_resource_linked_flows;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;


/**
 */
class TreasuryInboundTransfersResourceInboundTransferResourceLinkedFlows {
  /**
   * If funds for this flow were returned after the flow went to the `succeeded` state, this field
   * contains a reference to the ReceivedDebit return.
   */
  @optional
  Nullable!(string) received_debit;

}

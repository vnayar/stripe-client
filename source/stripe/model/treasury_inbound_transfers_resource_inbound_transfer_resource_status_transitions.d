// File automatically generated from OpenAPI spec.
module stripe.model.treasury_inbound_transfers_resource_inbound_transfer_resource_status_transitions;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;


/**
 */
class TreasuryInboundTransfersResourceInboundTransferResourceStatusTransitions {
  /**
   * Timestamp describing when an InboundTransfer changed status to `canceled`.
   */
  @optional
  Nullable!(long) canceled_at;

  /**
   * Timestamp describing when an InboundTransfer changed status to `failed`.
   */
  @optional
  Nullable!(long) failed_at;

  /**
   * Timestamp describing when an InboundTransfer changed status to `succeeded`.
   */
  @optional
  Nullable!(long) succeeded_at;

}

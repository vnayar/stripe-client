// File automatically generated from OpenAPI spec.
module stripe.model.treasury_outbound_transfers_resource_status_transitions;

import vibe.data.serialization : optional;
import vibe.data.json : Json;
import builder : AddBuilder;

import std.typecons : Nullable;


/**
 */
class TreasuryOutboundTransfersResourceStatusTransitions {
  /**
   * Timestamp describing when an OutboundTransfer changed status to `posted`
   */
  @optional
  Nullable!(long) posted_at;

  /**
   * Timestamp describing when an OutboundTransfer changed status to `canceled`
   */
  @optional
  Nullable!(long) canceled_at;

  /**
   * Timestamp describing when an OutboundTransfer changed status to `failed`
   */
  @optional
  Nullable!(long) failed_at;

  /**
   * Timestamp describing when an OutboundTransfer changed status to `returned`
   */
  @optional
  Nullable!(long) returned_at;

  mixin AddBuilder!(typeof(this));

}

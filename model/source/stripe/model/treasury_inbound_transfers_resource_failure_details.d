// File automatically generated from OpenAPI spec.
module stripe.model.treasury_inbound_transfers_resource_failure_details;

import vibe.data.serialization : optional;
import vibe.data.json : Json;
import builder : AddBuilder;

import std.typecons : Nullable;


/**
 */
class TreasuryInboundTransfersResourceFailureDetails {
  /**
   * Reason for the failure.
   */
  @optional
  string code;

  mixin AddBuilder!(typeof(this));

}

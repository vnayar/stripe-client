// File automatically generated from OpenAPI spec.
module stripe.model.treasury_outbound_transfers_resource_returned_details;

import vibe.data.serialization : optional;
import vibe.data.json : Json;
import builder : AddBuilder;

import std.typecons : Nullable;

import stripe.model.treasury.transaction : TreasuryTransaction;

/**
 */
class TreasuryOutboundTransfersResourceReturnedDetails {
  /**
   * The Transaction associated with this object.
   */
  @optional
  Json transaction;

  /**
   * Reason for the return.
   */
  @optional
  string code;

  mixin AddBuilder!(typeof(this));

}

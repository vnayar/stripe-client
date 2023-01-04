// File automatically generated from OpenAPI spec.
module stripe.model.treasury_outbound_payments_resource_returned_status;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;

import stripe.model.treasury.transaction : TreasuryTransaction;

/**
 */
class TreasuryOutboundPaymentsResourceReturnedStatus {
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

}

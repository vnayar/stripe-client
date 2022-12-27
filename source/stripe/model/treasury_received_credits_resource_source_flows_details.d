// File automatically generated from OpenAPI spec.
module stripe.model.treasury_received_credits_resource_source_flows_details;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;

import stripe.model.payout : Payout;
import stripe.model.treasury.credit_reversal : TreasuryCreditReversal;
import stripe.model.treasury.outbound_payment : TreasuryOutboundPayment;

/**
 */
class TreasuryReceivedCreditsResourceSourceFlowsDetails {
  /**
   * The type of the source flow that originated the ReceivedCredit.
   */
  @optional
  Nullable!(string) type;

  @optional
  TreasuryOutboundPayment outbound_payment;

  @optional
  TreasuryCreditReversal credit_reversal;

  @optional
  Payout payout;

}

// File automatically generated from OpenAPI spec.
module stripe.model.treasury_received_credits_resource_linked_flows;

import vibe.data.serialization : optional;
import vibe.data.json : Json;
import builder : AddBuilder;

import std.typecons : Nullable;

import stripe.model.treasury_received_credits_resource_source_flows_details : TreasuryReceivedCreditsResourceSourceFlowsDetails;

/**
 */
class TreasuryReceivedCreditsResourceLinkedFlows {
  /**
   * Set if the ReceivedCredit is also viewable as an [Issuing
   * transaction](https://stripe.com/docs/api#issuing_transactions) object.
   */
  @optional
  string issuing_transaction;

  /**
   * The type of flow that originated the ReceivedCredit (for example, `outbound_payment`).
   */
  @optional
  string source_flow_type;

  /**
   * The CreditReversal created as a result of this ReceivedCredit being reversed.
   */
  @optional
  string credit_reversal;

  /**
   * ID of the source flow. Set if `network` is `stripe` and the source flow is visible to the
   * user. Examples of source flows include OutboundPayments, payouts, or CreditReversals.
   */
  @optional
  string source_flow;

  /**
   * The expandable object of the source flow.
   */
  @optional
  TreasuryReceivedCreditsResourceSourceFlowsDetails source_flow_details;

  /**
   * Set if the ReceivedCredit was created due to an [Issuing
   * Authorization](https://stripe.com/docs/api#issuing_authorizations) object.
   */
  @optional
  string issuing_authorization;

  mixin AddBuilder!(typeof(this));

}

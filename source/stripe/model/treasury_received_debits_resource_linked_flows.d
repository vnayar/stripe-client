// File automatically generated from OpenAPI spec.
module stripe.model.treasury_received_debits_resource_linked_flows;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;


/**
 */
class TreasuryReceivedDebitsResourceLinkedFlows {
  /**
   * The DebitReversal created as a result of this ReceivedDebit being reversed.
   */
  @optional
  Nullable!(string) debit_reversal;

  /**
   * Set if the ReceivedDebit is associated with an InboundTransfer's return of funds.
   */
  @optional
  Nullable!(string) inbound_transfer;

  /**
   * Set if the ReceivedDebit was created due to an [Issuing
   * Authorization](https://stripe.com/docs/api#issuing_authorizations) object.
   */
  @optional
  Nullable!(string) issuing_authorization;

  /**
   * Set if the ReceivedDebit is also viewable as an [Issuing
   * Dispute](https://stripe.com/docs/api#issuing_disputes) object.
   */
  @optional
  Nullable!(string) issuing_transaction;

}

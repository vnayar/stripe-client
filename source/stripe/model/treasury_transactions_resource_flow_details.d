// File automatically generated from OpenAPI spec.
module stripe.model.treasury_transactions_resource_flow_details;

import vibe.data.serialization : optional;
import vibe.data.json : Json;
import builder : AddBuilder;

import std.typecons : Nullable;

import stripe.model.issuing.authorization : IssuingAuthorization;
import stripe.model.treasury.credit_reversal : TreasuryCreditReversal;
import stripe.model.treasury.debit_reversal : TreasuryDebitReversal;
import stripe.model.treasury.inbound_transfer : TreasuryInboundTransfer;
import stripe.model.treasury.outbound_payment : TreasuryOutboundPayment;
import stripe.model.treasury.outbound_transfer : TreasuryOutboundTransfer;
import stripe.model.treasury.received_credit : TreasuryReceivedCredit;
import stripe.model.treasury.received_debit : TreasuryReceivedDebit;

/**
 */
class TreasuryTransactionsResourceFlowDetails {
  @optional
  TreasuryInboundTransfer inbound_transfer;

  @optional
  TreasuryCreditReversal credit_reversal;

  @optional
  TreasuryDebitReversal debit_reversal;

  @optional
  TreasuryOutboundPayment outbound_payment;

  @optional
  TreasuryReceivedCredit received_credit;

  @optional
  IssuingAuthorization issuing_authorization;

  @optional
  TreasuryOutboundTransfer outbound_transfer;

  /**
   * Type of the flow that created the Transaction. Set to the same value as `flow_type`.
   */
  @optional
  string type;

  @optional
  TreasuryReceivedDebit received_debit;

  mixin AddBuilder!(typeof(this));

}

// File automatically generated from OpenAPI spec.
module stripe.model.treasury.transaction_entry;

import vibe.data.serialization : optional;
import vibe.data.json : Json;
import builder : AddBuilder;

import std.typecons : Nullable;

import stripe.model.treasury.transaction : TreasuryTransaction;
import stripe.model.treasury_transactions_resource_balance_impact : TreasuryTransactionsResourceBalanceImpact;
import stripe.model.treasury_transactions_resource_flow_details : TreasuryTransactionsResourceFlowDetails;

/**
 * TransactionEntries represent individual units of money movements within a single
 * [Transaction](https://stripe.com/docs/api#transactions).
 */
class TreasuryTransactionEntry {
  /**
   * Unique identifier for the object.
   */
  @optional
  string id;

  /**
   * Type of the flow associated with the TransactionEntry.
   */
  @optional
  string flow_type;

  /**
   * Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in
   * lowercase. Must be a [supported currency](https://stripe.com/docs/currencies).
   */
  @optional
  string currency;

  /**
   * Details of the flow associated with the TransactionEntry.
   */
  @optional
  TreasuryTransactionsResourceFlowDetails flow_details;

  /**
   * The Transaction associated with this object.
   */
  @optional
  Json transaction;

  /**
   * When the TransactionEntry will impact the FinancialAccount's balance.
   */
  @optional
  Nullable!(long) effective_at;

  @optional
  TreasuryTransactionsResourceBalanceImpact balance_impact;

  /**
   * Has the value `true` if the object exists in live mode or the value `false` if the object
   * exists in test mode.
   */
  @optional
  Nullable!(bool) livemode;

  /**
   * The FinancialAccount associated with this object.
   */
  @optional
  string financial_account;

  /**
   * String representing the object's type. Objects of the same type share the same value.
   */
  @optional
  string object;

  /**
   * The specific money movement that generated the TransactionEntry.
   */
  @optional
  string type;

  /**
   * Time at which the object was created. Measured in seconds since the Unix epoch.
   */
  @optional
  Nullable!(long) created;

  /**
   * Token of the flow associated with the TransactionEntry.
   */
  @optional
  string flow;

  mixin AddBuilder!(typeof(this));

}

// File automatically generated from OpenAPI spec.
module stripe.model.treasury.transaction;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;

import stripe.model.treasury.transaction_entry : TreasuryTransactionEntry;
import stripe.model.treasury_transactions_resource_abstract_transaction_resource_status_transitions : TreasuryTransactionsResourceAbstractTransactionResourceStatusTransitions;
import stripe.model.treasury_transactions_resource_balance_impact : TreasuryTransactionsResourceBalanceImpact;
import stripe.model.treasury_transactions_resource_flow_details : TreasuryTransactionsResourceFlowDetails;

/**
 * Transactions represent changes to a
 * [FinancialAccount's](https://stripe.com/docs/api#financial_accounts) balance.
 */
class TreasuryTransaction {
  /**
   * Amount (in cents) transferred.
   */
  @optional
  Nullable!(int) amount;

  @optional
  TreasuryTransactionsResourceAbstractTransactionResourceStatusTransitions status_transitions;

  static class TreasuryTransactionsResourceTransactionEntryList {
    /**
     * True if this list has another page of items after this one that can be fetched.
     */
    @optional
    Nullable!(bool) has_more;

    /**
     * String representing the object's type. Objects of the same type share the same value. Always
     * has the value `list`.
     */
    @optional
    string object;

    /**
     * Details about each object.
     */
    @optional
    TreasuryTransactionEntry[] data;

    /**
     * The URL where this list can be accessed.
     */
    @optional
    string url;

  }

  /**
   * A list of TransactionEntries that are part of this Transaction. This cannot be expanded in
   * any list endpoints.
   */
  @optional
  TreasuryTransactionsResourceTransactionEntryList entries;

  /**
   * Unique identifier for the object.
   */
  @optional
  string id;

  /**
   * Type of the flow that created the Transaction.
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
   * Details of the flow that created the Transaction.
   */
  @optional
  TreasuryTransactionsResourceFlowDetails flow_details;

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
   * An arbitrary string attached to the object. Often useful for displaying to users.
   */
  @optional
  string description;

  /**
   * Time at which the object was created. Measured in seconds since the Unix epoch.
   */
  @optional
  Nullable!(long) created;

  /**
   * ID of the flow that created the Transaction.
   */
  @optional
  string flow;

  /**
   * Status of the Transaction.
   */
  @optional
  string status;

}

// File automatically generated from OpenAPI spec.
module stripe.model.balance_transaction;

import vibe.data.serialization : optional;
import vibe.data.json : Json;
import builder : AddBuilder;

import std.typecons : Nullable;

import stripe.model.application_fee : ApplicationFee;
import stripe.model.charge : Charge;
import stripe.model.connect_collection_transfer : ConnectCollectionTransfer;
import stripe.model.dispute : Dispute;
import stripe.model.fee : Fee;
import stripe.model.fee_refund : FeeRefund;
import stripe.model.issuing.authorization : IssuingAuthorization;
import stripe.model.issuing.dispute : IssuingDispute;
import stripe.model.issuing.transaction : IssuingTransaction;
import stripe.model.payout : Payout;
import stripe.model.platform_tax_fee : PlatformTaxFee;
import stripe.model.refund : Refund;
import stripe.model.reserve_transaction : ReserveTransaction;
import stripe.model.tax_deducted_at_source : TaxDeductedAtSource;
import stripe.model.topup : Topup;
import stripe.model.transfer : Transfer;
import stripe.model.transfer_reversal : TransferReversal;

/**
 * Balance transactions represent funds moving through your Stripe account.
 * They're created for every type of transaction that comes into or flows out of your Stripe
 * account balance.
 * Related guide: [Balance Transaction
 * Types](https://stripe.com/docs/reports/balance-transaction-types).
 */
class BalanceTransaction {
  /**
   * The date the transaction's net funds will become available in the Stripe balance.
   */
  @optional
  Nullable!(long) available_on;

  /**
   * Gross amount of the transaction, in %s.
   */
  @optional
  Nullable!(int) amount;

  /**
   * Net amount of the transaction, in %s.
   */
  @optional
  Nullable!(int) net;

  /**
   * Detailed breakdown of fees (in %s) paid for this transaction.
   */
  @optional
  Fee[] fee_details;

  /**
   * Unique identifier for the object.
   */
  @optional
  string id;

  /**
   * [Learn more](https://stripe.com/docs/reports/reporting-categories) about how reporting
   * categories can help you understand balance transactions from an accounting perspective.
   */
  @optional
  string reporting_category;

  /**
   * Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in
   * lowercase. Must be a [supported currency](https://stripe.com/docs/currencies).
   */
  @optional
  string currency;

  /**
   * The Stripe object to which this transaction is related.
   */
  @optional
  Json source;

  /**
   * String representing the object's type. Objects of the same type share the same value.
   */
  @optional
  string object;

  /**
   * Transaction type: `adjustment`, `advance`, `advance_funding`, `anticipation_repayment`,
   * `application_fee`, `application_fee_refund`, `charge`, `connect_collection_transfer`,
   * `contribution`, `issuing_authorization_hold`, `issuing_authorization_release`,
   * `issuing_dispute`, `issuing_transaction`, `payment`, `payment_failure_refund`,
   * `payment_refund`, `payout`, `payout_cancel`, `payout_failure`, `refund`, `refund_failure`,
   * `reserve_transaction`, `reserved_funds`, `stripe_fee`, `stripe_fx_fee`, `tax_fee`, `topup`,
   * `topup_reversal`, `transfer`, `transfer_cancel`, `transfer_failure`, or `transfer_refund`.
   * [Learn more](https://stripe.com/docs/reports/balance-transaction-types) about balance
   * transaction types and what they represent. If you are looking to classify transactions for
   * accounting purposes, you might want to consider `reporting_category` instead.
   */
  @optional
  string type;

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
   * The exchange rate used, if applicable, for this transaction. Specifically, if money was
   * converted from currency A to currency B, then the `amount` in currency A, times
   * `exchange_rate`, would be the `amount` in currency B. For example, suppose you charged a
   * customer 10.00 EUR. Then the PaymentIntent's `amount` would be `1000` and `currency` would be
   * `eur`. Suppose this was converted into 12.34 USD in your Stripe account. Then the
   * BalanceTransaction's `amount` would be `1234`, `currency` would be `usd`, and `exchange_rate`
   * would be `1.234`.
   */
  @optional
  Nullable!(float) exchange_rate;

  /**
   * Fees (in %s) paid for this transaction.
   */
  @optional
  Nullable!(int) fee;

  /**
   * If the transaction's net funds are available in the Stripe balance yet. Either `available` or
   * `pending`.
   */
  @optional
  string status;

  mixin AddBuilder!(typeof(this));

}

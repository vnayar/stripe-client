// File automatically generated from OpenAPI spec.
module stripe.model.payout;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;

import stripe.model.balance_transaction : BalanceTransaction;
import stripe.model.bank_account : BankAccount;
import stripe.model.card : Card;
import stripe.model.deleted_bank_account : DeletedBankAccount;
import stripe.model.deleted_card : DeletedCard;

/**
 * A `Payout` object is created when you receive funds from Stripe, or when you
 * initiate a payout to either a bank account or debit card of a [connected
 * Stripe account](/docs/connect/bank-debit-card-payouts). You can retrieve individual payouts,
 * as well as list all payouts. Payouts are made on [varying
 * schedules](/docs/connect/manage-payout-schedule), depending on your country and
 * industry.
 * Related guide: [Receiving Payouts](https://stripe.com/docs/payouts).
 */
class Payout {
  /**
   * Amount (in %s) to be transferred to your bank account or debit card.
   */
  @optional
  Nullable!(int) amount;

  /**
   * Date the payout is expected to arrive in the bank. This factors in delays like weekends or
   * bank holidays.
   */
  @optional
  Nullable!(long) arrival_date;

  /**
   * Unique identifier for the object.
   */
  @optional
  Nullable!(string) id;

  /**
   * Returns `true` if the payout was created by an [automated payout
   * schedule](https://stripe.com/docs/payouts#payout-schedule), and `false` if it was [requested
   * manually](https://stripe.com/docs/payouts#manual-payouts).
   */
  @optional
  Nullable!(bool) automatic;

  /**
   * Message to user further explaining reason for payout failure if available.
   */
  @optional
  Nullable!(string) failure_message;

  /**
   * ID of the bank account or card the payout was sent to.
   */
  @optional
  Json destination;

  /**
   * Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an
   * object. This can be useful for storing additional information about the object in a
   * structured format.
   */
  @optional
  Nullable!(string)[string] metadata;

  /**
   * Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in
   * lowercase. Must be a [supported currency](https://stripe.com/docs/currencies).
   */
  @optional
  Nullable!(string) currency;

  /**
   * If the payout was reversed, this is the ID of the payout that reverses this payout.
   */
  @optional
  Json reversed_by;

  /**
   * ID of the balance transaction that describes the impact of this payout on your account
   * balance.
   */
  @optional
  Json balance_transaction;

  /**
   * The source balance this payout came from. One of `card`, `fpx`, or `bank_account`.
   */
  @optional
  Nullable!(string) source_type;

  /**
   * The method used to send this payout, which can be `standard` or `instant`. `instant` is only
   * supported for payouts to debit cards. (See [Instant payouts for
   * marketplaces](https://stripe.com/blog/instant-payouts-for-marketplaces) for more
   * information.)
   */
  @optional
  Nullable!(string) method;

  /**
   * Has the value `true` if the object exists in live mode or the value `false` if the object
   * exists in test mode.
   */
  @optional
  Nullable!(bool) livemode;

  /**
   * String representing the object's type. Objects of the same type share the same value.
   */
  @optional
  Nullable!(string) object;

  /**
   * Extra information about a payout to be displayed on the user's bank statement.
   */
  @optional
  Nullable!(string) statement_descriptor;

  /**
   * An arbitrary string attached to the object. Often useful for displaying to users.
   */
  @optional
  Nullable!(string) description;

  /**
   * Can be `bank_account` or `card`.
   */
  @optional
  Nullable!(string) type;

  /**
   * Time at which the object was created. Measured in seconds since the Unix epoch.
   */
  @optional
  Nullable!(long) created;

  /**
   * If the payout failed or was canceled, this will be the ID of the balance transaction that
   * reversed the initial balance transaction, and puts the funds from the failed payout back in
   * your balance.
   */
  @optional
  Json failure_balance_transaction;

  /**
   * Error code explaining reason for payout failure if available. See [Types of payout
   * failures](https://stripe.com/docs/api#payout_failures) for a list of failure codes.
   */
  @optional
  Nullable!(string) failure_code;

  /**
   * If the payout reverses another, this is the ID of the original payout.
   */
  @optional
  Json original_payout;

  /**
   * Current status of the payout: `paid`, `pending`, `in_transit`, `canceled` or `failed`. A
   * payout is `pending` until it is submitted to the bank, when it becomes `in_transit`. The
   * status then changes to `paid` if the transaction goes through, or to `failed` or `canceled`
   * (within 5 business days). Some failed payouts may initially show as `paid` but then change to
   * `failed`.
   */
  @optional
  Nullable!(string) status;

}

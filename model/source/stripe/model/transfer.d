// File automatically generated from OpenAPI spec.
module stripe.model.transfer;

import vibe.data.serialization : optional;
import vibe.data.json : Json;
import builder : AddBuilder;

import std.typecons : Nullable;

import stripe.model.account : Account;
import stripe.model.balance_transaction : BalanceTransaction;
import stripe.model.charge : Charge;
import stripe.model.transfer_reversal : TransferReversal;

/**
 * A `Transfer` object is created when you move funds between Stripe accounts as
 * part of Connect.
 * Before April 6, 2017, transfers also represented movement of funds from a
 * Stripe account to a card or bank account. This behavior has since been split
 * out into a [Payout](https://stripe.com/docs/api#payout_object) object, with corresponding
 * payout endpoints. For more
 * information, read about the
 * [transfer/payout split](https://stripe.com/docs/transfer-payout-split).
 * Related guide: [Creating Separate Charges and
 * Transfers](https://stripe.com/docs/connect/charges-transfers).
 */
class Transfer {
  /**
   * Amount in %s to be transferred.
   */
  @optional
  Nullable!(int) amount;

  /**
   * Unique identifier for the object.
   */
  @optional
  string id;

  /**
   * A string that identifies this transaction as part of a group. See the [Connect
   * documentation](https://stripe.com/docs/connect/charges-transfers#transfer-options) for
   * details.
   */
  @optional
  string transfer_group;

  /**
   * The source balance this transfer came from. One of `card`, `fpx`, or `bank_account`.
   */
  @optional
  string source_type;

  /**
   * ID of the Stripe account the transfer was sent to.
   */
  @optional
  Json destination;

  /**
   * Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an
   * object. This can be useful for storing additional information about the object in a
   * structured format.
   */
  @optional
  string[string] metadata;

  /**
   * Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in
   * lowercase. Must be a [supported currency](https://stripe.com/docs/currencies).
   */
  @optional
  string currency;

  /**
   * Balance transaction that describes the impact of this transfer on your account balance.
   */
  @optional
  Json balance_transaction;

  static class TransferReversalList {
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
    TransferReversal[] data;

    /**
     * The URL where this list can be accessed.
     */
    @optional
    string url;

    mixin AddBuilder!(typeof(this));

  }

  /**
   * A list of reversals that have been applied to the transfer.
   */
  @optional
  TransferReversalList reversals;

  /**
   * Whether the transfer has been fully reversed. If the transfer is only partially reversed,
   * this attribute will still be false.
   */
  @optional
  Nullable!(bool) reversed;

  /**
   * Has the value `true` if the object exists in live mode or the value `false` if the object
   * exists in test mode.
   */
  @optional
  Nullable!(bool) livemode;

  /**
   * ID of the charge or payment that was used to fund the transfer. If null, the transfer was
   * funded from the available balance.
   */
  @optional
  Json source_transaction;

  /**
   * String representing the object's type. Objects of the same type share the same value.
   */
  @optional
  string object;

  /**
   * Amount in %s reversed (can be less than the amount attribute on the transfer if a partial
   * reversal was issued).
   */
  @optional
  Nullable!(int) amount_reversed;

  /**
   * An arbitrary string attached to the object. Often useful for displaying to users.
   */
  @optional
  string description;

  /**
   * Time that this record of the transfer was first created.
   */
  @optional
  Nullable!(long) created;

  /**
   * If the destination is a Stripe account, this will be the ID of the payment that the
   * destination account received for the transfer.
   */
  @optional
  Json destination_payment;

  mixin AddBuilder!(typeof(this));

}

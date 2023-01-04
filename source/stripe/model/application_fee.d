// File automatically generated from OpenAPI spec.
module stripe.model.application_fee;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;

import stripe.model.account : Account;
import stripe.model.application : Application;
import stripe.model.balance_transaction : BalanceTransaction;
import stripe.model.charge : Charge;
import stripe.model.fee_refund : FeeRefund;

/**
 */
class ApplicationFee {
  /**
   * Amount earned, in %s.
   */
  @optional
  Nullable!(int) amount;

  /**
   * Unique identifier for the object.
   */
  @optional
  string id;

  /**
   * ID of the corresponding charge on the platform account, if this fee was the result of a
   * charge using the `destination` parameter.
   */
  @optional
  Json originating_transaction;

  /**
   * Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in
   * lowercase. Must be a [supported currency](https://stripe.com/docs/currencies).
   */
  @optional
  string currency;

  /**
   * Amount in %s refunded (can be less than the amount attribute on the fee if a partial refund
   * was issued)
   */
  @optional
  Nullable!(int) amount_refunded;

  /**
   * Balance transaction that describes the impact of this collected application fee on your
   * account balance (not including refunds).
   */
  @optional
  Json balance_transaction;

  /**
   * ID of the charge that the application fee was taken from.
   */
  @optional
  Json charge;

  /**
   * ID of the Connect application that earned the fee.
   */
  @optional
  Json application;

  /**
   * Has the value `true` if the object exists in live mode or the value `false` if the object
   * exists in test mode.
   */
  @optional
  Nullable!(bool) livemode;

  /**
   * Whether the fee has been fully refunded. If the fee is only partially refunded, this
   * attribute will still be false.
   */
  @optional
  Nullable!(bool) refunded;

  /**
   * String representing the object's type. Objects of the same type share the same value.
   */
  @optional
  string object;

  static class FeeRefundList {
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
    FeeRefund[] data;

    /**
     * The URL where this list can be accessed.
     */
    @optional
    string url;

  }

  /**
   * A list of refunds that have been applied to the fee.
   */
  @optional
  FeeRefundList refunds;

  /**
   * Time at which the object was created. Measured in seconds since the Unix epoch.
   */
  @optional
  Nullable!(long) created;

  /**
   * ID of the Stripe account this fee was taken from.
   */
  @optional
  Json account;

}

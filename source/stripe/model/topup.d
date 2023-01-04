// File automatically generated from OpenAPI spec.
module stripe.model.topup;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;

import stripe.model.balance_transaction : BalanceTransaction;
import stripe.model.source : Source;

/**
 * To top up your Stripe balance, you create a top-up object. You can retrieve
 * individual top-ups, as well as list all top-ups. Top-ups are identified by a
 * unique, random ID.
 * Related guide: [Topping Up your Platform Account](https://stripe.com/docs/connect/top-ups).
 */
class Topup {
  /**
   * Amount transferred.
   */
  @optional
  Nullable!(int) amount;

  /**
   * Extra information about a top-up. This will appear on your source's bank statement. It must
   * contain at least one letter.
   */
  @optional
  string statement_descriptor;

  /**
   * Unique identifier for the object.
   */
  @optional
  string id;

  /**
   * A string that identifies this top-up as part of a group.
   */
  @optional
  string transfer_group;

  /**
   * Message to user further explaining reason for top-up failure if available.
   */
  @optional
  string failure_message;

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
   * For most Stripe users, the source of every top-up is a bank account. This hash is then the
   * [source object](https://stripe.com/docs/api#source_object) describing that bank account.
   */
  @optional
  Source source;

  /**
   * ID of the balance transaction that describes the impact of this top-up on your account
   * balance. May not be specified depending on status of top-up.
   */
  @optional
  Json balance_transaction;

  /**
   * Has the value `true` if the object exists in live mode or the value `false` if the object
   * exists in test mode.
   */
  @optional
  Nullable!(bool) livemode;

  /**
   * Date the funds are expected to arrive in your Stripe account for payouts. This factors in
   * delays like weekends or bank holidays. May not be specified depending on status of top-up.
   */
  @optional
  Nullable!(int) expected_availability_date;

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
   * Error code explaining reason for top-up failure if available (see [the errors
   * section](https://stripe.com/docs/api#errors) for a list of codes).
   */
  @optional
  string failure_code;

  /**
   * The status of the top-up is either `canceled`, `failed`, `pending`, `reversed`, or
   * `succeeded`.
   */
  @optional
  string status;

}

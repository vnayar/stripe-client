// File automatically generated from OpenAPI spec.
module stripe.model.transfer_reversal;

import vibe.data.serialization : optional;
import vibe.data.json : Json;
import builder : AddBuilder;

import std.typecons : Nullable;

import stripe.model.balance_transaction : BalanceTransaction;
import stripe.model.refund : Refund;
import stripe.model.transfer : Transfer;

/**
 * [Stripe Connect](https://stripe.com/docs/connect) platforms can reverse transfers made to a
 * connected account, either entirely or partially, and can also specify whether
 * to refund any related application fees. Transfer reversals add to the
 * platform's balance and subtract from the destination account's balance.
 * Reversing a transfer that was made for a [destination
 * charge](/docs/connect/destination-charges) is allowed only up to the amount of
 * the charge. It is possible to reverse a
 * [transfer_group](https://stripe.com/docs/connect/charges-transfers#transfer-options)
 * transfer only if the destination account has enough balance to cover the
 * reversal.
 * Related guide: [Reversing
 * Transfers](https://stripe.com/docs/connect/charges-transfers#reversing-transfers).
 */
class TransferReversal {
  /**
   * Amount, in %s.
   */
  @optional
  Nullable!(int) amount;

  /**
   * Unique identifier for the object.
   */
  @optional
  string id;

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
   * Balance transaction that describes the impact on your account balance.
   */
  @optional
  Json balance_transaction;

  /**
   * ID of the refund responsible for the transfer reversal.
   */
  @optional
  Json source_refund;

  /**
   * String representing the object's type. Objects of the same type share the same value.
   */
  @optional
  string object;

  /**
   * Time at which the object was created. Measured in seconds since the Unix epoch.
   */
  @optional
  Nullable!(long) created;

  /**
   * Linked payment refund for the transfer reversal.
   */
  @optional
  Json destination_payment_refund;

  /**
   * ID of the transfer that was reversed.
   */
  @optional
  Json transfer;

  mixin AddBuilder!(typeof(this));

}

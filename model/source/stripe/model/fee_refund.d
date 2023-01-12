// File automatically generated from OpenAPI spec.
module stripe.model.fee_refund;

import vibe.data.serialization : optional;
import vibe.data.json : Json;
import builder : AddBuilder;

import std.typecons : Nullable;

import stripe.model.application_fee : ApplicationFee;
import stripe.model.balance_transaction : BalanceTransaction;

/**
 * `Application Fee Refund` objects allow you to refund an application fee that
 * has previously been created but not yet refunded. Funds will be refunded to
 * the Stripe account from which the fee was originally collected.
 * Related guide: [Refunding Application
 * Fees](https://stripe.com/docs/connect/destination-charges#refunding-app-fee).
 */
class FeeRefund {
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
   * String representing the object's type. Objects of the same type share the same value.
   */
  @optional
  string object;

  /**
   * ID of the application fee that was refunded.
   */
  @optional
  Json fee;

  /**
   * Time at which the object was created. Measured in seconds since the Unix epoch.
   */
  @optional
  Nullable!(long) created;

  mixin AddBuilder!(typeof(this));

}

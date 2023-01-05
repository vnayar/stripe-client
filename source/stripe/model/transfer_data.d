// File automatically generated from OpenAPI spec.
module stripe.model.transfer_data;

import vibe.data.serialization : optional;
import vibe.data.json : Json;
import builder : AddBuilder;

import std.typecons : Nullable;

import stripe.model.account : Account;

/**
 */
class TransferData {
  /**
   * Amount intended to be collected by this PaymentIntent. A positive integer representing how
   * much to charge in the [smallest currency
   * unit](https://stripe.com/docs/currencies#zero-decimal) (e.g., 100 cents to charge $1.00 or
   * 100 to charge ¥100, a zero-decimal currency). The minimum amount is $0.50 US or [equivalent
   * in charge currency](https://stripe.com/docs/currencies#minimum-and-maximum-charge-amounts).
   * The amount value supports up to eight digits (e.g., a value of 99999999 for a USD charge of
   * $999,999.99).
   */
  @optional
  Nullable!(int) amount;

  /**
   * The account (if any) the payment will be attributed to for tax
   * reporting, and where funds from the payment will be transferred to upon
   * payment success.
   */
  @optional
  Json destination;

  mixin AddBuilder!(typeof(this));

}

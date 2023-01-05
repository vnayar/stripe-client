// File automatically generated from OpenAPI spec.
module stripe.model.quotes_resource_transfer_data;

import vibe.data.serialization : optional;
import vibe.data.json : Json;
import builder : AddBuilder;

import std.typecons : Nullable;

import stripe.model.account : Account;

/**
 */
class QuotesResourceTransferData {
  /**
   * A non-negative decimal between 0 and 100, with at most two decimal places. This represents
   * the percentage of the subscription invoice subtotal that will be transferred to the
   * destination account. By default, the entire amount will be transferred to the destination.
   */
  @optional
  Nullable!(float) amount_percent;

  /**
   * The amount in %s that will be transferred to the destination account when the invoice is
   * paid. By default, the entire amount is transferred to the destination.
   */
  @optional
  Nullable!(int) amount;

  /**
   * The account where funds from the payment will be transferred to upon payment success.
   */
  @optional
  Json destination;

  mixin AddBuilder!(typeof(this));

}

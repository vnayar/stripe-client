// File automatically generated from OpenAPI spec.
module stripe.model.source_order;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;

import stripe.model.shipping : Shipping;
import stripe.model.source_order_item : SourceOrderItem;

/**
 */
class SourceOrder {
  /**
   * The email address of the customer placing the order.
   */
  @optional
  string email;

  @optional
  Shipping shipping;

  /**
   * A positive integer in the smallest currency unit (that is, 100 cents for $1.00, or 1 for ¥1,
   * Japanese Yen being a zero-decimal currency) representing the total amount for the order.
   */
  @optional
  Nullable!(int) amount;

  /**
   * Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in
   * lowercase. Must be a [supported currency](https://stripe.com/docs/currencies).
   */
  @optional
  string currency;

  /**
   * List of items constituting the order.
   */
  @optional
  SourceOrderItem[] items;

}

// File automatically generated from OpenAPI spec.
module stripe.model.item;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;

import stripe.model.line_items_discount_amount : LineItemsDiscountAmount;
import stripe.model.line_items_tax_amount : LineItemsTaxAmount;
import stripe.model.price : Price;

/**
 * A line item.
 */
class Item {
  /**
   * Total discount amount applied. If no discounts were applied, defaults to 0.
   */
  @optional
  Nullable!(int) amount_discount;

  /**
   * Unique identifier for the object.
   */
  @optional
  string id;

  /**
   * The taxes applied to the line item.
   */
  @optional
  LineItemsTaxAmount[] taxes;

  /**
   * Total after discounts and taxes.
   */
  @optional
  Nullable!(int) amount_total;

  /**
   * Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in
   * lowercase. Must be a [supported currency](https://stripe.com/docs/currencies).
   */
  @optional
  string currency;

  /**
   * The quantity of products being purchased.
   */
  @optional
  Nullable!(int) quantity;

  /**
   * Total tax amount applied. If no tax was applied, defaults to 0.
   */
  @optional
  Nullable!(int) amount_tax;

  /**
   * Total before any discounts or taxes are applied.
   */
  @optional
  Nullable!(int) amount_subtotal;

  /**
   * String representing the object's type. Objects of the same type share the same value.
   */
  @optional
  string object;

  /**
   * The discounts applied to the line item.
   */
  @optional
  LineItemsDiscountAmount[] discounts;

  /**
   * An arbitrary string attached to the object. Often useful for displaying to users. Defaults to
   * product name.
   */
  @optional
  string description;

  /**
   * The price used to generate the line item.
   */
  @optional
  Price price;

}

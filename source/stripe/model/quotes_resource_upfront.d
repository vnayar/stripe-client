// File automatically generated from OpenAPI spec.
module stripe.model.quotes_resource_upfront;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;

import stripe.model.item : Item;
import stripe.model.quotes_resource_total_details : QuotesResourceTotalDetails;

/**
 */
class QuotesResourceUpfront {
  /**
   * Total after discounts and taxes are applied.
   */
  @optional
  Nullable!(int) amount_total;

  /**
   * Total before any discounts or taxes are applied.
   */
  @optional
  Nullable!(int) amount_subtotal;

  @optional
  QuotesResourceTotalDetails total_details;

  static class QuotesResourceListLineItems {
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
    Item[] data;

    /**
     * The URL where this list can be accessed.
     */
    @optional
    string url;

  }

  /**
   * The line items that will appear on the next invoice after this quote is accepted. This does
   * not include pending invoice items that exist on the customer but may still be included in the
   * next invoice.
   */
  @optional
  QuotesResourceListLineItems line_items;

}

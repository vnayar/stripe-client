// File automatically generated from OpenAPI spec.
module stripe.model.source_order_item;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;


/**
 */
class SourceOrderItem {
  /**
   * Human-readable description for this order item.
   */
  @optional
  string description;

  /**
   * The type of this order item. Must be `sku`, `tax`, or `shipping`.
   */
  @optional
  string type;

  /**
   * The amount (price) for this order item.
   */
  @optional
  Nullable!(int) amount;

  /**
   * This currency of this order item. Required when `amount` is present.
   */
  @optional
  string currency;

  /**
   * The quantity of this order item. When type is `sku`, this is the number of instances of the
   * SKU to be ordered.
   */
  @optional
  Nullable!(int) quantity;

  /**
   * The ID of the associated object for this line item. Expandable if not null (e.g., expandable
   * to a SKU).
   */
  @optional
  string parent;

}

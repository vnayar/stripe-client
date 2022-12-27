// File automatically generated from OpenAPI spec.
module stripe.model.custom_unit_amount;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;


/**
 */
class CustomUnitAmount {
  /**
   * The minimum unit amount the customer can specify for this item. Must be at least the minimum
   * charge amount.
   */
  @optional
  Nullable!(int) minimum;

  /**
   * The starting unit amount which can be updated by the customer.
   */
  @optional
  Nullable!(int) preset;

  /**
   * The maximum unit amount the customer can specify for this item.
   */
  @optional
  Nullable!(int) maximum;

}

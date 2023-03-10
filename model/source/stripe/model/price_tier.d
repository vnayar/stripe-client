// File automatically generated from OpenAPI spec.
module stripe.model.price_tier;

import vibe.data.serialization : optional;
import vibe.data.json : Json;
import builder : AddBuilder;

import std.typecons : Nullable;


/**
 */
class PriceTier {
  /**
   * Same as `unit_amount`, but contains a decimal value with at most 12 decimal places.
   */
  @optional
  string unit_amount_decimal;

  /**
   * Price for the entire tier.
   */
  @optional
  Nullable!(int) flat_amount;

  /**
   * Up to and including to this quantity will be contained in the tier.
   */
  @optional
  Nullable!(int) up_to;

  /**
   * Per unit price for units relevant to the tier.
   */
  @optional
  Nullable!(int) unit_amount;

  /**
   * Same as `flat_amount`, but contains a decimal value with at most 12 decimal places.
   */
  @optional
  string flat_amount_decimal;

  mixin AddBuilder!(typeof(this));

}

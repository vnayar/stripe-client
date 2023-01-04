// File automatically generated from OpenAPI spec.
module stripe.model.issuing_transaction_fuel_data;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;


/**
 */
class IssuingTransactionFuelData {
  /**
   * The type of fuel that was purchased. One of `diesel`, `unleaded_plus`, `unleaded_regular`,
   * `unleaded_super`, or `other`.
   */
  @optional
  string type;

  /**
   * The cost in cents per each unit of fuel, represented as a decimal string with at most 12
   * decimal places.
   */
  @optional
  string unit_cost_decimal;

  /**
   * The units for `volume_decimal`. One of `us_gallon` or `liter`.
   */
  @optional
  string unit;

  /**
   * The volume of the fuel that was pumped, represented as a decimal string with at most 12
   * decimal places.
   */
  @optional
  string volume_decimal;

}

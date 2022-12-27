// File automatically generated from OpenAPI spec.
module stripe.model.line_items_tax_amount;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;

import stripe.model.tax_rate : TaxRate;

/**
 */
class LineItemsTaxAmount {
  /**
   * Amount of tax applied for this rate.
   */
  @optional
  Nullable!(int) amount;

  @optional
  TaxRate rate;

}

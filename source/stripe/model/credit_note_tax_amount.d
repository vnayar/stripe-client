// File automatically generated from OpenAPI spec.
module stripe.model.credit_note_tax_amount;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;

import stripe.model.tax_rate : TaxRate;

/**
 */
class CreditNoteTaxAmount {
  /**
   * The amount, in %s, of the tax.
   */
  @optional
  Nullable!(int) amount;

  /**
   * The tax rate that was applied to get this tax amount.
   */
  @optional
  Json tax_rate;

  /**
   * Whether this tax amount is inclusive or exclusive.
   */
  @optional
  Nullable!(bool) inclusive;

}

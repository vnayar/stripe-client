// File automatically generated from OpenAPI spec.
module stripe.model.invoice_tax_amount;

import vibe.data.serialization : optional;
import vibe.data.json : Json;
import builder : AddBuilder;

import std.typecons : Nullable;

import stripe.model.tax_rate : TaxRate;

/**
 */
class InvoiceTaxAmount {
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

  mixin AddBuilder!(typeof(this));

}

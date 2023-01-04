// File automatically generated from OpenAPI spec.
module stripe.model.tax_deducted_at_source;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;


/**
 */
class TaxDeductedAtSource {
  /**
   * The start of the invoicing period. This TDS applies to Stripe fees collected during this
   * invoicing period.
   */
  @optional
  Nullable!(long) period_start;

  /**
   * The TAN that was supplied to Stripe when TDS was assessed
   */
  @optional
  string tax_deduction_account_number;

  /**
   * Unique identifier for the object.
   */
  @optional
  string id;

  /**
   * String representing the object's type. Objects of the same type share the same value.
   */
  @optional
  string object;

  /**
   * The end of the invoicing period. This TDS applies to Stripe fees collected during this
   * invoicing period.
   */
  @optional
  Nullable!(long) period_end;

}

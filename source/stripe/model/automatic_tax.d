// File automatically generated from OpenAPI spec.
module stripe.model.automatic_tax;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;


/**
 */
class AutomaticTax {
  /**
   * Whether Stripe automatically computes tax on this invoice. Note that incompatible invoice
   * items (invoice items with manually specified [tax
   * rates](https://stripe.com/docs/api/tax_rates), negative amounts, or
   * `tax_behavior=unspecified`) cannot be added to automatic tax invoices.
   */
  @optional
  Nullable!(bool) enabled;

  /**
   * The status of the most recent automated tax calculation for this invoice.
   */
  @optional
  string status;

}

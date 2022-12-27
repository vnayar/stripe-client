// File automatically generated from OpenAPI spec.
module stripe.model.quotes_resource_automatic_tax;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;


/**
 */
class QuotesResourceAutomaticTax {
  /**
   * Automatically calculate taxes
   */
  @optional
  Nullable!(bool) enabled;

  /**
   * The status of the most recent automated tax calculation for this quote.
   */
  @optional
  Nullable!(string) status;

}

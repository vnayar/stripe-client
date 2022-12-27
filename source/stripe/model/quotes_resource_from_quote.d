// File automatically generated from OpenAPI spec.
module stripe.model.quotes_resource_from_quote;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;

import stripe.model.quote : Quote;

/**
 */
class QuotesResourceFromQuote {
  /**
   * The quote that was cloned.
   */
  @optional
  Json quote;

  /**
   * Whether this quote is a revision of a different quote.
   */
  @optional
  Nullable!(bool) is_revision;

}

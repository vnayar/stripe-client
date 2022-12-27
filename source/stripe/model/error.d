// File automatically generated from OpenAPI spec.
module stripe.model.error;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;

import stripe.model.api_errors : ApiErrors;

/**
 * An error response from the Stripe API
 */
class Error_ {
  @optional
  ApiErrors error;

}

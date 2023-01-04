// File automatically generated from OpenAPI spec.
module stripe.model.source_type_eps;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;


/**
 */
class SourceTypeEps {
  @optional
  string statement_descriptor;

  @optional
  string reference;

}

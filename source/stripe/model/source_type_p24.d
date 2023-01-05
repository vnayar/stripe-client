// File automatically generated from OpenAPI spec.
module stripe.model.source_type_p24;

import vibe.data.serialization : optional;
import vibe.data.json : Json;
import builder : AddBuilder;

import std.typecons : Nullable;


/**
 */
class SourceTypeP24 {
  @optional
  string reference;

  mixin AddBuilder!(typeof(this));

}

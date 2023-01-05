// File automatically generated from OpenAPI spec.
module stripe.model.source_type_giropay;

import vibe.data.serialization : optional;
import vibe.data.json : Json;
import builder : AddBuilder;

import std.typecons : Nullable;


/**
 */
class SourceTypeGiropay {
  @optional
  string statement_descriptor;

  @optional
  string bank_name;

  @optional
  string bank_code;

  @optional
  string bic;

  mixin AddBuilder!(typeof(this));

}

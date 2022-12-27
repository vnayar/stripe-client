// File automatically generated from OpenAPI spec.
module stripe.model.source_type_giropay;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;


/**
 */
class SourceTypeGiropay {
  @optional
  Nullable!(string) statement_descriptor;

  @optional
  Nullable!(string) bank_name;

  @optional
  Nullable!(string) bank_code;

  @optional
  Nullable!(string) bic;

}

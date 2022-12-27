// File automatically generated from OpenAPI spec.
module stripe.model.source_type_alipay;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;


/**
 */
class SourceTypeAlipay {
  @optional
  Nullable!(string) statement_descriptor;

  @optional
  Nullable!(string) native_url;

  @optional
  Nullable!(string) data_string;

}

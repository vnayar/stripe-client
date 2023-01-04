// File automatically generated from OpenAPI spec.
module stripe.model.source_type_alipay;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;


/**
 */
class SourceTypeAlipay {
  @optional
  string statement_descriptor;

  @optional
  string native_url;

  @optional
  string data_string;

}

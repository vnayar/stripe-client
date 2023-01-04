// File automatically generated from OpenAPI spec.
module stripe.model.source_type_wechat;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;


/**
 */
class SourceTypeWechat {
  @optional
  string prepay_id;

  @optional
  string statement_descriptor;

  @optional
  string qr_code_url;

}

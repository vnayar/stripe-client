// File automatically generated from OpenAPI spec.
module stripe.model.source_type_wechat;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;


/**
 */
class SourceTypeWechat {
  @optional
  Nullable!(string) prepay_id;

  @optional
  Nullable!(string) statement_descriptor;

  @optional
  Nullable!(string) qr_code_url;

}

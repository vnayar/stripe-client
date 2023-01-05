// File automatically generated from OpenAPI spec.
module stripe.model.source_type_ideal;

import vibe.data.serialization : optional;
import vibe.data.json : Json;
import builder : AddBuilder;

import std.typecons : Nullable;


/**
 */
class SourceTypeIdeal {
  @optional
  string bank;

  @optional
  string iban_last4;

  @optional
  string statement_descriptor;

  @optional
  string bic;

  mixin AddBuilder!(typeof(this));

}

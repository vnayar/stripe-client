// File automatically generated from OpenAPI spec.
module stripe.model.source_type_bancontact;

import vibe.data.serialization : optional;
import vibe.data.json : Json;
import builder : AddBuilder;

import std.typecons : Nullable;


/**
 */
class SourceTypeBancontact {
  @optional
  string statement_descriptor;

  @optional
  string iban_last4;

  @optional
  string bank_name;

  @optional
  string bank_code;

  @optional
  string bic;

  @optional
  string preferred_language;

  mixin AddBuilder!(typeof(this));

}

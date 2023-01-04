// File automatically generated from OpenAPI spec.
module stripe.model.source_type_sofort;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;


/**
 */
class SourceTypeSofort {
  @optional
  string statement_descriptor;

  @optional
  string iban_last4;

  @optional
  string country;

  @optional
  string bank_code;

  @optional
  string bank_name;

  @optional
  string bic;

  @optional
  string preferred_language;

}

// File automatically generated from OpenAPI spec.
module stripe.model.source_type_sofort;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;


/**
 */
class SourceTypeSofort {
  @optional
  Nullable!(string) statement_descriptor;

  @optional
  Nullable!(string) iban_last4;

  @optional
  Nullable!(string) country;

  @optional
  Nullable!(string) bank_code;

  @optional
  Nullable!(string) bank_name;

  @optional
  Nullable!(string) bic;

  @optional
  Nullable!(string) preferred_language;

}

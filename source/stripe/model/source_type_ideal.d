// File automatically generated from OpenAPI spec.
module stripe.model.source_type_ideal;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;


/**
 */
class SourceTypeIdeal {
  @optional
  Nullable!(string) bank;

  @optional
  Nullable!(string) iban_last4;

  @optional
  Nullable!(string) statement_descriptor;

  @optional
  Nullable!(string) bic;

}

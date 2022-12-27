// File automatically generated from OpenAPI spec.
module stripe.model.source_type_ach_debit;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;


/**
 */
class SourceTypeAchDebit {
  @optional
  Nullable!(string) last4;

  @optional
  Nullable!(string) type;

  @optional
  Nullable!(string) country;

  @optional
  Nullable!(string) bank_name;

  @optional
  Nullable!(string) routing_number;

  @optional
  Nullable!(string) fingerprint;

}

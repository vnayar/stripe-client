// File automatically generated from OpenAPI spec.
module stripe.model.source_type_ach_debit;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;


/**
 */
class SourceTypeAchDebit {
  @optional
  string last4;

  @optional
  string type;

  @optional
  string country;

  @optional
  string bank_name;

  @optional
  string routing_number;

  @optional
  string fingerprint;

}

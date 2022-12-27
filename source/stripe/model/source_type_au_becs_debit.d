// File automatically generated from OpenAPI spec.
module stripe.model.source_type_au_becs_debit;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;


/**
 */
class SourceTypeAuBecsDebit {
  @optional
  Nullable!(string) last4;

  @optional
  Nullable!(string) bsb_number;

  @optional
  Nullable!(string) fingerprint;

}

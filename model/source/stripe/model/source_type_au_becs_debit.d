// File automatically generated from OpenAPI spec.
module stripe.model.source_type_au_becs_debit;

import vibe.data.serialization : optional;
import vibe.data.json : Json;
import builder : AddBuilder;

import std.typecons : Nullable;


/**
 */
class SourceTypeAuBecsDebit {
  @optional
  string last4;

  @optional
  string bsb_number;

  @optional
  string fingerprint;

  mixin AddBuilder!(typeof(this));

}

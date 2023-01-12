// File automatically generated from OpenAPI spec.
module stripe.model.source_type_sepa_debit;

import vibe.data.serialization : optional;
import vibe.data.json : Json;
import builder : AddBuilder;

import std.typecons : Nullable;


/**
 */
class SourceTypeSepaDebit {
  @optional
  string country;

  @optional
  string bank_code;

  @optional
  string branch_code;

  @optional
  string mandate_reference;

  @optional
  string last4;

  @optional
  string fingerprint;

  @optional
  string mandate_url;

  mixin AddBuilder!(typeof(this));

}

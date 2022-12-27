// File automatically generated from OpenAPI spec.
module stripe.model.source_type_sepa_debit;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;


/**
 */
class SourceTypeSepaDebit {
  @optional
  Nullable!(string) country;

  @optional
  Nullable!(string) bank_code;

  @optional
  Nullable!(string) branch_code;

  @optional
  Nullable!(string) mandate_reference;

  @optional
  Nullable!(string) last4;

  @optional
  Nullable!(string) fingerprint;

  @optional
  Nullable!(string) mandate_url;

}

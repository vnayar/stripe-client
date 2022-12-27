// File automatically generated from OpenAPI spec.
module stripe.model.source_type_acss_debit;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;


/**
 */
class SourceTypeAcssDebit {
  @optional
  Nullable!(string) country;

  @optional
  Nullable!(string) routing_number;

  @optional
  Nullable!(string) bank_address_postal_code;

  @optional
  Nullable!(string) last4;

  @optional
  Nullable!(string) category;

  @optional
  Nullable!(string) bank_address_line_2;

  @optional
  Nullable!(string) bank_address_line_1;

  @optional
  Nullable!(string) bank_address_city;

  @optional
  Nullable!(string) bank_name;

  @optional
  Nullable!(string) fingerprint;

}

// File automatically generated from OpenAPI spec.
module stripe.model.source_type_acss_debit;

import vibe.data.serialization : optional;
import vibe.data.json : Json;
import builder : AddBuilder;

import std.typecons : Nullable;


/**
 */
class SourceTypeAcssDebit {
  @optional
  string country;

  @optional
  string routing_number;

  @optional
  string bank_address_postal_code;

  @optional
  string last4;

  @optional
  string category;

  @optional
  string bank_address_line_2;

  @optional
  string bank_address_line_1;

  @optional
  string bank_address_city;

  @optional
  string bank_name;

  @optional
  string fingerprint;

  mixin AddBuilder!(typeof(this));

}

// File automatically generated from OpenAPI spec.
module stripe.model.source_type_card;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;


/**
 */
class SourceTypeCard {
  @optional
  Nullable!(string) country;

  @optional
  Nullable!(string) dynamic_last4;

  @optional
  Nullable!(int) exp_month;

  @optional
  Nullable!(string) funding;

  @optional
  Nullable!(int) exp_year;

  @optional
  Nullable!(string) brand;

  @optional
  Nullable!(string) name;

  @optional
  Nullable!(string) last4;

  @optional
  Nullable!(string) cvc_check;

  @optional
  Nullable!(string) tokenization_method;

  @optional
  Nullable!(string) address_zip_check;

  @optional
  Nullable!(string) address_line1_check;

  @optional
  Nullable!(string) three_d_secure;

  @optional
  Nullable!(string) fingerprint;

}

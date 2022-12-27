// File automatically generated from OpenAPI spec.
module stripe.model.source_type_three_d_secure;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;


/**
 */
class SourceTypeThreeDSecure {
  @optional
  Nullable!(string) country;

  @optional
  Nullable!(string) customer;

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
  Nullable!(string) card;

  @optional
  Nullable!(string) cvc_check;

  @optional
  Nullable!(string) last4;

  @optional
  Nullable!(string) tokenization_method;

  @optional
  Nullable!(string) address_zip_check;

  @optional
  Nullable!(string) address_line1_check;

  @optional
  Nullable!(string) three_d_secure;

  @optional
  Nullable!(bool) authenticated;

  @optional
  Nullable!(string) fingerprint;

}

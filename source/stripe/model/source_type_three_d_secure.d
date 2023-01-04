// File automatically generated from OpenAPI spec.
module stripe.model.source_type_three_d_secure;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;


/**
 */
class SourceTypeThreeDSecure {
  @optional
  string country;

  @optional
  string customer;

  @optional
  string dynamic_last4;

  @optional
  Nullable!(int) exp_month;

  @optional
  string funding;

  @optional
  Nullable!(int) exp_year;

  @optional
  string brand;

  @optional
  string name;

  @optional
  string card;

  @optional
  string cvc_check;

  @optional
  string last4;

  @optional
  string tokenization_method;

  @optional
  string address_zip_check;

  @optional
  string address_line1_check;

  @optional
  string three_d_secure;

  @optional
  Nullable!(bool) authenticated;

  @optional
  string fingerprint;

}

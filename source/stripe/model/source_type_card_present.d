// File automatically generated from OpenAPI spec.
module stripe.model.source_type_card_present;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;


/**
 */
class SourceTypeCardPresent {
  @optional
  string reader;

  @optional
  string application_cryptogram;

  @optional
  string country;

  @optional
  string read_method;

  @optional
  string pos_entry_mode;

  @optional
  string evidence_customer_signature;

  @optional
  Nullable!(int) exp_month;

  @optional
  string dedicated_file_name;

  @optional
  Nullable!(int) exp_year;

  @optional
  string brand;

  @optional
  string authorization_response_code;

  @optional
  string funding;

  @optional
  string cvm_type;

  @optional
  string data_type;

  @optional
  string evidence_transaction_certificate;

  @optional
  string last4;

  @optional
  string transaction_status_information;

  @optional
  string pos_device_id;

  @optional
  string terminal_verification_results;

  @optional
  string authorization_code;

  @optional
  string application_preferred_name;

  @optional
  string fingerprint;

  @optional
  string emv_auth_data;

}

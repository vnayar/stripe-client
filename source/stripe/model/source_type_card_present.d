// File automatically generated from OpenAPI spec.
module stripe.model.source_type_card_present;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;


/**
 */
class SourceTypeCardPresent {
  @optional
  Nullable!(string) reader;

  @optional
  Nullable!(string) application_cryptogram;

  @optional
  Nullable!(string) country;

  @optional
  Nullable!(string) read_method;

  @optional
  Nullable!(string) pos_entry_mode;

  @optional
  Nullable!(string) evidence_customer_signature;

  @optional
  Nullable!(int) exp_month;

  @optional
  Nullable!(string) dedicated_file_name;

  @optional
  Nullable!(int) exp_year;

  @optional
  Nullable!(string) brand;

  @optional
  Nullable!(string) authorization_response_code;

  @optional
  Nullable!(string) funding;

  @optional
  Nullable!(string) cvm_type;

  @optional
  Nullable!(string) data_type;

  @optional
  Nullable!(string) evidence_transaction_certificate;

  @optional
  Nullable!(string) last4;

  @optional
  Nullable!(string) transaction_status_information;

  @optional
  Nullable!(string) pos_device_id;

  @optional
  Nullable!(string) terminal_verification_results;

  @optional
  Nullable!(string) authorization_code;

  @optional
  Nullable!(string) application_preferred_name;

  @optional
  Nullable!(string) fingerprint;

  @optional
  Nullable!(string) emv_auth_data;

}

// File automatically generated from OpenAPI spec.
module stripe.model.tax_id_verification;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;


/**
 */
class TaxIdVerification {
  /**
   * Verified address.
   */
  @optional
  string verified_address;

  /**
   * Verified name.
   */
  @optional
  string verified_name;

  /**
   * Verification status, one of `pending`, `verified`, `unverified`, or `unavailable`.
   */
  @optional
  string status;

}

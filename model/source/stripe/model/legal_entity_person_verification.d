// File automatically generated from OpenAPI spec.
module stripe.model.legal_entity_person_verification;

import vibe.data.serialization : optional;
import vibe.data.json : Json;
import builder : AddBuilder;

import std.typecons : Nullable;

import stripe.model.legal_entity_person_verification_document : LegalEntityPersonVerificationDocument;

/**
 */
class LegalEntityPersonVerification {
  /**
   * A document showing address, either a passport, local ID card, or utility bill from a
   * well-known utility company.
   */
  @optional
  LegalEntityPersonVerificationDocument additional_document;

  /**
   * A user-displayable string describing the verification state for the person. For example, this
   * may say "Provided identity information could not be verified".
   */
  @optional
  string details;

  @optional
  LegalEntityPersonVerificationDocument document;

  /**
   * The state of verification for the person. Possible values are `unverified`, `pending`, or
   * `verified`.
   */
  @optional
  string status;

  /**
   * One of `document_address_mismatch`, `document_dob_mismatch`, `document_duplicate_type`,
   * `document_id_number_mismatch`, `document_name_mismatch`, `document_nationality_mismatch`,
   * `failed_keyed_identity`, or `failed_other`. A machine-readable code specifying the
   * verification state for the person.
   */
  @optional
  string details_code;

  mixin AddBuilder!(typeof(this));

}

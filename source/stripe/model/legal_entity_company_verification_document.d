// File automatically generated from OpenAPI spec.
module stripe.model.legal_entity_company_verification_document;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;

import stripe.model.file : File;

/**
 */
class LegalEntityCompanyVerificationDocument {
  /**
   * The back of a document returned by a [file upload](https://stripe.com/docs/api#create_file)
   * with a `purpose` value of `additional_verification`.
   */
  @optional
  Json back;

  /**
   * A user-displayable string describing the verification state of this document.
   */
  @optional
  string details;

  /**
   * The front of a document returned by a [file upload](https://stripe.com/docs/api#create_file)
   * with a `purpose` value of `additional_verification`.
   */
  @optional
  Json front;

  /**
   * One of `document_corrupt`, `document_expired`, `document_failed_copy`,
   * `document_failed_greyscale`, `document_failed_other`, `document_failed_test_mode`,
   * `document_fraudulent`, `document_incomplete`, `document_invalid`, `document_manipulated`,
   * `document_not_readable`, `document_not_uploaded`, `document_type_not_supported`, or
   * `document_too_large`. A machine-readable code specifying the verification state for this
   * document.
   */
  @optional
  string details_code;

}

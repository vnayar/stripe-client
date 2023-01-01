// File automatically generated from OpenAPI spec.
module stripe.model.legal_entity_person_verification_document;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;

import stripe.model.file : File;

/**
 */
class LegalEntityPersonVerificationDocument {
  /**
   * The back of an ID returned by a [file upload](https://stripe.com/docs/api#create_file) with a
   * `purpose` value of `identity_document`.
   */
  @optional
  Json back;

  /**
   * A user-displayable string describing the verification state of this document. For example, if
   * a document is uploaded and the picture is too fuzzy, this may say "Identity document is too
   * unclear to read".
   */
  @optional
  Nullable!(string) details;

  /**
   * The front of an ID returned by a [file upload](https://stripe.com/docs/api#create_file) with
   * a `purpose` value of `identity_document`.
   */
  @optional
  Json front;

  /**
   * One of `document_corrupt`, `document_country_not_supported`, `document_expired`,
   * `document_failed_copy`, `document_failed_other`, `document_failed_test_mode`,
   * `document_fraudulent`, `document_failed_greyscale`, `document_incomplete`,
   * `document_invalid`, `document_manipulated`, `document_missing_back`,
   * `document_missing_front`, `document_not_readable`, `document_not_uploaded`,
   * `document_photo_mismatch`, `document_too_large`, or `document_type_not_supported`. A
   * machine-readable code specifying the verification state for this document.
   */
  @optional
  Nullable!(string) details_code;

}

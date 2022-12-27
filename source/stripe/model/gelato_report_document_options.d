// File automatically generated from OpenAPI spec.
module stripe.model.gelato_report_document_options;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;


/**
 */
class GelatoReportDocumentOptions {
  /**
   * Collect an ID number and perform an [ID number
   * check](https://stripe.com/docs/identity/verification-checks?type=id-number) with the
   * document’s extracted name and date of birth.
   */
  @optional
  Nullable!(bool) require_id_number;

  /**
   * Array of strings of allowed identity document types. If the provided identity document
   * isn’t one of the allowed types, the verification check will fail with a
   * document_type_not_allowed error code.
   */
  @optional
  Nullable!(string)[] allowed_types;

  /**
   * Disable image uploads, identity document images have to be captured using the device’s
   * camera.
   */
  @optional
  Nullable!(bool) require_live_capture;

  /**
   * Capture a face image and perform a [selfie
   * check](https://stripe.com/docs/identity/verification-checks?type=selfie) comparing a photo ID
   * and a picture of your user’s face. [Learn more](https://stripe.com/docs/identity/selfie).
   */
  @optional
  Nullable!(bool) require_matching_selfie;

}

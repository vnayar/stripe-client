// File automatically generated from OpenAPI spec.
module stripe.model.gelato_document_report_error;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;


/**
 */
class GelatoDocumentReportError {
  /**
   * A human-readable message giving the reason for the failure. These messages can be shown to
   * your users.
   */
  @optional
  string reason;

  /**
   * A short machine-readable string giving the reason for the verification failure.
   */
  @optional
  string code;

}

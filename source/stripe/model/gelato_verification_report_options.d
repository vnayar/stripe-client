// File automatically generated from OpenAPI spec.
module stripe.model.gelato_verification_report_options;

import vibe.data.serialization : optional;
import vibe.data.json : Json;
import builder : AddBuilder;

import std.typecons : Nullable;

import stripe.model.gelato_report_document_options : GelatoReportDocumentOptions;
import stripe.model.gelato_report_id_number_options : GelatoReportIdNumberOptions;

/**
 */
class GelatoVerificationReportOptions {
  @optional
  GelatoReportDocumentOptions document;

  @optional
  GelatoReportIdNumberOptions id_number;

  mixin AddBuilder!(typeof(this));

}

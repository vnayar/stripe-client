// File automatically generated from OpenAPI spec.
module stripe.model.identity.verification_report;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;

import stripe.model.gelato_document_report : GelatoDocumentReport;
import stripe.model.gelato_id_number_report : GelatoIdNumberReport;
import stripe.model.gelato_selfie_report : GelatoSelfieReport;
import stripe.model.gelato_verification_report_options : GelatoVerificationReportOptions;

/**
 * A VerificationReport is the result of an attempt to collect and verify data from a user.
 * The collection of verification checks performed is determined from the `type` and `options`
 * parameters used. You can find the result of each verification check performed in the
 * appropriate sub-resource: `document`, `id_number`, `selfie`.
 * Each VerificationReport contains a copy of any data collected by the user as well as
 * reference IDs which can be used to access collected images through the
 * [FileUpload](https://stripe.com/docs/api/files)
 * API. To configure and create VerificationReports, use the
 * [VerificationSession](https://stripe.com/docs/api/identity/verification_sessions) API.
 * Related guides: [Accessing verification
 * results](https://stripe.com/docs/identity/verification-sessions#results).
 */
class IdentityVerificationReport {
  /**
   * Unique identifier for the object.
   */
  @optional
  Nullable!(string) id;

  /**
   * ID of the VerificationSession that created this report.
   */
  @optional
  Nullable!(string) verification_session;

  /**
   * Has the value `true` if the object exists in live mode or the value `false` if the object
   * exists in test mode.
   */
  @optional
  Nullable!(bool) livemode;

  @optional
  GelatoSelfieReport selfie;

  /**
   * String representing the object's type. Objects of the same type share the same value.
   */
  @optional
  Nullable!(string) object;

  @optional
  GelatoDocumentReport document;

  /**
   * Type of report.
   */
  @optional
  Nullable!(string) type;

  /**
   * Time at which the object was created. Measured in seconds since the Unix epoch.
   */
  @optional
  Nullable!(long) created;

  @optional
  GelatoVerificationReportOptions options;

  @optional
  GelatoIdNumberReport id_number;

}
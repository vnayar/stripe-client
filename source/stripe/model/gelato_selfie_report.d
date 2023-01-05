// File automatically generated from OpenAPI spec.
module stripe.model.gelato_selfie_report;

import vibe.data.serialization : optional;
import vibe.data.json : Json;
import builder : AddBuilder;

import std.typecons : Nullable;

import stripe.model.gelato_selfie_report_error : GelatoSelfieReportError;

/**
 * Result from a selfie check
 */
class GelatoSelfieReport {
  /**
   * ID of the [File](https://stripe.com/docs/api/files) holding the image of the selfie used in
   * this check.
   */
  @optional
  string selfie;

  /**
   * Details on the verification error. Present when status is `unverified`.
   */
  @optional
  GelatoSelfieReportError error;

  /**
   * ID of the [File](https://stripe.com/docs/api/files) holding the image of the identity
   * document used in this check.
   */
  @optional
  string document;

  /**
   * Status of this `selfie` check.
   */
  @optional
  string status;

  mixin AddBuilder!(typeof(this));

}

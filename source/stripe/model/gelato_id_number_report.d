// File automatically generated from OpenAPI spec.
module stripe.model.gelato_id_number_report;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;

import stripe.model.gelato_data_id_number_report_date : GelatoDataIdNumberReportDate;
import stripe.model.gelato_id_number_report_error : GelatoIdNumberReportError;

/**
 * Result from an id_number check
 */
class GelatoIdNumberReport {
  /**
   * First name.
   */
  @optional
  string first_name;

  /**
   * Last name.
   */
  @optional
  string last_name;

  /**
   * Date of birth.
   */
  @optional
  GelatoDataIdNumberReportDate dob;

  /**
   * Details on the verification error. Present when status is `unverified`.
   */
  @optional
  GelatoIdNumberReportError error;

  /**
   * Type of ID number.
   */
  @optional
  string id_number_type;

  /**
   * ID number.
   */
  @optional
  string id_number;

  /**
   * Status of this `id_number` check.
   */
  @optional
  string status;

}

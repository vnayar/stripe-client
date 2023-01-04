// File automatically generated from OpenAPI spec.
module stripe.model.gelato_document_report;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;

import stripe.model.address : Address;
import stripe.model.gelato_data_document_report_date_of_birth : GelatoDataDocumentReportDateOfBirth;
import stripe.model.gelato_data_document_report_expiration_date : GelatoDataDocumentReportExpirationDate;
import stripe.model.gelato_data_document_report_issued_date : GelatoDataDocumentReportIssuedDate;
import stripe.model.gelato_document_report_error : GelatoDocumentReportError;

/**
 * Result from a document check
 */
class GelatoDocumentReport {
  /**
   * Issuing country of the document.
   */
  @optional
  string issuing_country;

  /**
   * Document ID number.
   */
  @optional
  string number;

  /**
   * Expiration date of the document.
   */
  @optional
  GelatoDataDocumentReportExpirationDate expiration_date;

  /**
   * First name as it appears in the document.
   */
  @optional
  string first_name;

  /**
   * Last name as it appears in the document.
   */
  @optional
  string last_name;

  /**
   * Array of [File](https://stripe.com/docs/api/files) ids containing images for this document.
   */
  @optional
  string[] files;

  /**
   * Issued date of the document.
   */
  @optional
  GelatoDataDocumentReportIssuedDate issued_date;

  /**
   * Address as it appears in the document.
   */
  @optional
  Address address;

  /**
   * Date of birth as it appears in the document.
   */
  @optional
  GelatoDataDocumentReportDateOfBirth dob;

  /**
   * Type of the document.
   */
  @optional
  string type;

  /**
   * Details on the verification error. Present when status is `unverified`.
   */
  @optional
  GelatoDocumentReportError error;

  /**
   * Status of this `document` check.
   */
  @optional
  string status;

}

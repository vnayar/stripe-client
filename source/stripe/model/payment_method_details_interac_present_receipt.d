// File automatically generated from OpenAPI spec.
module stripe.model.payment_method_details_interac_present_receipt;

import vibe.data.serialization : optional;
import vibe.data.json : Json;
import builder : AddBuilder;

import std.typecons : Nullable;


/**
 */
class PaymentMethodDetailsInteracPresentReceipt {
  /**
   * EMV tag 9F26, cryptogram generated by the integrated circuit chip.
   */
  @optional
  string application_cryptogram;

  /**
   * How the cardholder verified ownership of the card.
   */
  @optional
  string cardholder_verification_method;

  /**
   * EMV tag 84. Similar to the application identifier stored on the integrated circuit chip.
   */
  @optional
  string dedicated_file_name;

  /**
   * EMV tag 8A. A code returned by the card issuer.
   */
  @optional
  string authorization_response_code;

  /**
   * An indication of various EMV functions performed during the transaction.
   */
  @optional
  string transaction_status_information;

  /**
   * Identifier for this transaction.
   */
  @optional
  string authorization_code;

  /**
   * Mnenomic of the Application Identifier.
   */
  @optional
  string application_preferred_name;

  /**
   * The type of account being debited or credited
   */
  @optional
  string account_type;

  /**
   * The outcome of a series of EMV functions performed by the card reader.
   */
  @optional
  string terminal_verification_results;

  mixin AddBuilder!(typeof(this));

}

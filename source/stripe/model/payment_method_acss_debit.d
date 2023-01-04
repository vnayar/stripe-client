// File automatically generated from OpenAPI spec.
module stripe.model.payment_method_acss_debit;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;


/**
 */
class PaymentMethodAcssDebit {
  /**
   * Last four digits of the bank account number.
   */
  @optional
  string last4;

  /**
   * Transit number of the bank account.
   */
  @optional
  string transit_number;

  /**
   * Name of the bank associated with the bank account.
   */
  @optional
  string bank_name;

  /**
   * Institution number of the bank account.
   */
  @optional
  string institution_number;

  /**
   * Uniquely identifies this particular bank account. You can use this attribute to check whether
   * two bank accounts are the same.
   */
  @optional
  string fingerprint;

}

// File automatically generated from OpenAPI spec.
module stripe.model.payment_method_bacs_debit;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;


/**
 */
class PaymentMethodBacsDebit {
  /**
   * Last four digits of the bank account number.
   */
  @optional
  string last4;

  /**
   * Sort code of the bank account. (e.g., `10-20-30`)
   */
  @optional
  string sort_code;

  /**
   * Uniquely identifies this particular bank account. You can use this attribute to check whether
   * two bank accounts are the same.
   */
  @optional
  string fingerprint;

}

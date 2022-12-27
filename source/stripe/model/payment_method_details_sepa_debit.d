// File automatically generated from OpenAPI spec.
module stripe.model.payment_method_details_sepa_debit;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;


/**
 */
class PaymentMethodDetailsSepaDebit {
  /**
   * Branch code of bank associated with the bank account.
   */
  @optional
  Nullable!(string) branch_code;

  /**
   * Last four characters of the IBAN.
   */
  @optional
  Nullable!(string) last4;

  /**
   * Two-letter ISO code representing the country the bank account is located in.
   */
  @optional
  Nullable!(string) country;

  /**
   * Bank code of bank associated with the bank account.
   */
  @optional
  Nullable!(string) bank_code;

  /**
   * Uniquely identifies this particular bank account. You can use this attribute to check whether
   * two bank accounts are the same.
   */
  @optional
  Nullable!(string) fingerprint;

  /**
   * ID of the mandate used to make this payment.
   */
  @optional
  Nullable!(string) mandate;

}

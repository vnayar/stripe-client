// File automatically generated from OpenAPI spec.
module stripe.model.payment_method_au_becs_debit;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;


/**
 */
class PaymentMethodAuBecsDebit {
  /**
   * Last four digits of the bank account number.
   */
  @optional
  Nullable!(string) last4;

  /**
   * Six-digit number identifying bank and branch associated with this bank account.
   */
  @optional
  Nullable!(string) bsb_number;

  /**
   * Uniquely identifies this particular bank account. You can use this attribute to check whether
   * two bank accounts are the same.
   */
  @optional
  Nullable!(string) fingerprint;

}

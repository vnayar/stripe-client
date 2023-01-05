// File automatically generated from OpenAPI spec.
module stripe.model.payment_method_details_us_bank_account;

import vibe.data.serialization : optional;
import vibe.data.json : Json;
import builder : AddBuilder;

import std.typecons : Nullable;


/**
 */
class PaymentMethodDetailsUsBankAccount {
  /**
   * Account holder type: individual or company.
   */
  @optional
  string account_holder_type;

  /**
   * Last four digits of the bank account number.
   */
  @optional
  string last4;

  /**
   * Name of the bank associated with the bank account.
   */
  @optional
  string bank_name;

  /**
   * Routing number of the bank account.
   */
  @optional
  string routing_number;

  /**
   * Account type: checkings or savings. Defaults to checking if omitted.
   */
  @optional
  string account_type;

  /**
   * Uniquely identifies this particular bank account. You can use this attribute to check whether
   * two bank accounts are the same.
   */
  @optional
  string fingerprint;

  mixin AddBuilder!(typeof(this));

}

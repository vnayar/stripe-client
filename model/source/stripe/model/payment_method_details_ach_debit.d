// File automatically generated from OpenAPI spec.
module stripe.model.payment_method_details_ach_debit;

import vibe.data.serialization : optional;
import vibe.data.json : Json;
import builder : AddBuilder;

import std.typecons : Nullable;


/**
 */
class PaymentMethodDetailsAchDebit {
  /**
   * Type of entity that holds the account. This can be either `individual` or `company`.
   */
  @optional
  string account_holder_type;

  /**
   * Last four digits of the bank account number.
   */
  @optional
  string last4;

  /**
   * Two-letter ISO code representing the country the bank account is located in.
   */
  @optional
  string country;

  /**
   * Name of the bank associated with the bank account.
   */
  @optional
  string bank_name;

  /**
   * Routing transit number of the bank account.
   */
  @optional
  string routing_number;

  /**
   * Uniquely identifies this particular bank account. You can use this attribute to check whether
   * two bank accounts are the same.
   */
  @optional
  string fingerprint;

  mixin AddBuilder!(typeof(this));

}

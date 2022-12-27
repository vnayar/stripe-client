// File automatically generated from OpenAPI spec.
module stripe.model.payment_method_us_bank_account;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;

import stripe.model.us_bank_account_networks : UsBankAccountNetworks;

/**
 */
class PaymentMethodUsBankAccount {
  /**
   * The ID of the Financial Connections Account used to create the payment method.
   */
  @optional
  Nullable!(string) financial_connections_account;

  /**
   * Routing number of the bank account.
   */
  @optional
  Nullable!(string) routing_number;

  /**
   * Contains information about US bank account networks that can be used.
   */
  @optional
  UsBankAccountNetworks networks;

  /**
   * Last four digits of the bank account number.
   */
  @optional
  Nullable!(string) last4;

  /**
   * Account holder type: individual or company.
   */
  @optional
  Nullable!(string) account_holder_type;

  /**
   * The name of the bank.
   */
  @optional
  Nullable!(string) bank_name;

  /**
   * Account type: checkings or savings. Defaults to checking if omitted.
   */
  @optional
  Nullable!(string) account_type;

  /**
   * Uniquely identifies this particular bank account. You can use this attribute to check whether
   * two bank accounts are the same.
   */
  @optional
  Nullable!(string) fingerprint;

}

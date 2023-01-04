// File automatically generated from OpenAPI spec.
module stripe.model.inbound_transfers_payment_method_details_us_bank_account;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;


/**
 */
class InboundTransfersPaymentMethodDetailsUsBankAccount {
  /**
   * Routing number of the bank account.
   */
  @optional
  string routing_number;

  /**
   * Last four digits of the bank account number.
   */
  @optional
  string last4;

  /**
   * The US bank account network used to debit funds.
   */
  @optional
  string network;

  /**
   * Account holder type: individual or company.
   */
  @optional
  string account_holder_type;

  /**
   * Name of the bank associated with the bank account.
   */
  @optional
  string bank_name;

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

}

// File automatically generated from OpenAPI spec.
module stripe.model.payment_method_details_ach_credit_transfer;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;


/**
 */
class PaymentMethodDetailsAchCreditTransfer {
  /**
   * Name of the bank associated with the routing number.
   */
  @optional
  string bank_name;

  /**
   * Account number to transfer funds to.
   */
  @optional
  string account_number;

  /**
   * Routing transit number for the bank account to transfer funds to.
   */
  @optional
  string routing_number;

  /**
   * SWIFT code of the bank associated with the routing number.
   */
  @optional
  string swift_code;

}

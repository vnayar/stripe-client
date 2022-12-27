// File automatically generated from OpenAPI spec.
module stripe.model.payment_method_options_customer_balance_eu_bank_account;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;


/**
 */
class PaymentMethodOptionsCustomerBalanceEuBankAccount {
  /**
   * The desired country code of the bank account information. Permitted values include: `DE`,
   * `ES`, `FR`, `IE`, or `NL`.
   */
  @optional
  Nullable!(string) country;

}
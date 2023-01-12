// File automatically generated from OpenAPI spec.
module stripe.model.payment_method_options_customer_balance_bank_transfer;

import vibe.data.serialization : optional;
import vibe.data.json : Json;
import builder : AddBuilder;

import std.typecons : Nullable;

import stripe.model.payment_method_options_customer_balance_eu_bank_account : PaymentMethodOptionsCustomerBalanceEuBankAccount;

/**
 */
class PaymentMethodOptionsCustomerBalanceBankTransfer {
  /**
   * The bank transfer type that this PaymentIntent is allowed to use for funding Permitted values
   * include: `eu_bank_transfer`, `gb_bank_transfer`, `jp_bank_transfer`, or `mx_bank_transfer`.
   */
  @optional
  string type;

  /**
   * List of address types that should be returned in the financial_addresses response. If not
   * specified, all valid types will be returned.
   * Permitted values include: `sort_code`, `zengin`, `iban`, or `spei`.
   */
  @optional
  string[] requested_address_types;

  @optional
  PaymentMethodOptionsCustomerBalanceEuBankAccount eu_bank_transfer;

  mixin AddBuilder!(typeof(this));

}

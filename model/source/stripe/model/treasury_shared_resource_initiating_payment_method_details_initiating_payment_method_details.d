// File automatically generated from OpenAPI spec.
module stripe.model.treasury_shared_resource_initiating_payment_method_details_initiating_payment_method_details;

import vibe.data.serialization : optional;
import vibe.data.json : Json;
import builder : AddBuilder;

import std.typecons : Nullable;

import stripe.model.received_payment_method_details_financial_account : ReceivedPaymentMethodDetailsFinancialAccount;
import stripe.model.treasury_shared_resource_billing_details : TreasurySharedResourceBillingDetails;
import stripe.model.treasury_shared_resource_initiating_payment_method_details_us_bank_account : TreasurySharedResourceInitiatingPaymentMethodDetailsUsBankAccount;

/**
 */
class TreasurySharedResourceInitiatingPaymentMethodDetailsInitiatingPaymentMethodDetails {
  /**
   * Set when `type` is `issuing_card`. This is an [Issuing
   * Card](https://stripe.com/docs/api#issuing_cards) ID.
   */
  @optional
  string issuing_card;

  /**
   * Polymorphic type matching the originating money movement's source. This can be an external
   * account, a Stripe balance, or a FinancialAccount.
   */
  @optional
  string type;

  @optional
  TreasurySharedResourceBillingDetails billing_details;

  @optional
  TreasurySharedResourceInitiatingPaymentMethodDetailsUsBankAccount us_bank_account;

  @optional
  ReceivedPaymentMethodDetailsFinancialAccount financial_account;

  /**
   * Set when `type` is `balance`.
   */
  @optional
  string balance;

  mixin AddBuilder!(typeof(this));

}

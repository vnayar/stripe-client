// File automatically generated from OpenAPI spec.
module stripe.model.outbound_payments_payment_method_details;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;

import stripe.model.outbound_payments_payment_method_details_financial_account : OutboundPaymentsPaymentMethodDetailsFinancialAccount;
import stripe.model.outbound_payments_payment_method_details_us_bank_account : OutboundPaymentsPaymentMethodDetailsUsBankAccount;
import stripe.model.treasury_shared_resource_billing_details : TreasurySharedResourceBillingDetails;

/**
 */
class OutboundPaymentsPaymentMethodDetails {
  /**
   * The type of the payment method used in the OutboundPayment.
   */
  @optional
  string type;

  @optional
  TreasurySharedResourceBillingDetails billing_details;

  @optional
  OutboundPaymentsPaymentMethodDetailsUsBankAccount us_bank_account;

  @optional
  OutboundPaymentsPaymentMethodDetailsFinancialAccount financial_account;

}

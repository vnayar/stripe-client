// File automatically generated from OpenAPI spec.
module stripe.model.outbound_payments_payment_method_details_financial_account;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;


/**
 */
class OutboundPaymentsPaymentMethodDetailsFinancialAccount {
  /**
   * The rails used to send funds.
   */
  @optional
  Nullable!(string) network;

  /**
   * Token of the FinancialAccount.
   */
  @optional
  Nullable!(string) id;

}
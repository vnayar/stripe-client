// File automatically generated from OpenAPI spec.
module stripe.model.outbound_transfers_payment_method_details;

import vibe.data.serialization : optional;
import vibe.data.json : Json;
import builder : AddBuilder;

import std.typecons : Nullable;

import stripe.model.outbound_transfers_payment_method_details_us_bank_account : OutboundTransfersPaymentMethodDetailsUsBankAccount;
import stripe.model.treasury_shared_resource_billing_details : TreasurySharedResourceBillingDetails;

/**
 */
class OutboundTransfersPaymentMethodDetails {
  /**
   * The type of the payment method used in the OutboundTransfer.
   */
  @optional
  string type;

  @optional
  TreasurySharedResourceBillingDetails billing_details;

  @optional
  OutboundTransfersPaymentMethodDetailsUsBankAccount us_bank_account;

  mixin AddBuilder!(typeof(this));

}

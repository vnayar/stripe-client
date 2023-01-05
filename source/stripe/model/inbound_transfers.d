// File automatically generated from OpenAPI spec.
module stripe.model.inbound_transfers;

import vibe.data.serialization : optional;
import vibe.data.json : Json;
import builder : AddBuilder;

import std.typecons : Nullable;

import stripe.model.inbound_transfers_payment_method_details_us_bank_account : InboundTransfersPaymentMethodDetailsUsBankAccount;
import stripe.model.treasury_shared_resource_billing_details : TreasurySharedResourceBillingDetails;

/**
 */
class InboundTransfers {
  /**
   * The type of the payment method used in the InboundTransfer.
   */
  @optional
  string type;

  @optional
  TreasurySharedResourceBillingDetails billing_details;

  @optional
  InboundTransfersPaymentMethodDetailsUsBankAccount us_bank_account;

  mixin AddBuilder!(typeof(this));

}

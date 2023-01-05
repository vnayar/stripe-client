// File automatically generated from OpenAPI spec.
module stripe.model.treasury.received_credit;

import vibe.data.serialization : optional;
import vibe.data.json : Json;
import builder : AddBuilder;

import std.typecons : Nullable;

import stripe.model.treasury.transaction : TreasuryTransaction;
import stripe.model.treasury_received_credits_resource_linked_flows : TreasuryReceivedCreditsResourceLinkedFlows;
import stripe.model.treasury_received_credits_resource_reversal_details : TreasuryReceivedCreditsResourceReversalDetails;
import stripe.model.treasury_shared_resource_initiating_payment_method_details_initiating_payment_method_details : TreasurySharedResourceInitiatingPaymentMethodDetailsInitiatingPaymentMethodDetails;

/**
 * ReceivedCredits represent funds sent to a
 * [FinancialAccount](https://stripe.com/docs/api#financial_accounts) (for example, via ACH or
 * wire). These money movements are not initiated from the FinancialAccount.
 */
class TreasuryReceivedCredit {
  /**
   * Amount (in cents) transferred.
   */
  @optional
  Nullable!(int) amount;

  /**
   * Unique identifier for the object.
   */
  @optional
  string id;

  /**
   * Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in
   * lowercase. Must be a [supported currency](https://stripe.com/docs/currencies).
   */
  @optional
  string currency;

  /**
   * The Transaction associated with this object.
   */
  @optional
  Json transaction;

  /**
   * Details describing when a ReceivedCredit may be reversed.
   */
  @optional
  TreasuryReceivedCreditsResourceReversalDetails reversal_details;

  /**
   * Has the value `true` if the object exists in live mode or the value `false` if the object
   * exists in test mode.
   */
  @optional
  Nullable!(bool) livemode;

  /**
   * The rails used to send the funds.
   */
  @optional
  string network;

  /**
   * The FinancialAccount that received the funds.
   */
  @optional
  string financial_account;

  /**
   * String representing the object's type. Objects of the same type share the same value.
   */
  @optional
  string object;

  @optional
  TreasuryReceivedCreditsResourceLinkedFlows linked_flows;

  /**
   * An arbitrary string attached to the object. Often useful for displaying to users.
   */
  @optional
  string description;

  /**
   * Time at which the object was created. Measured in seconds since the Unix epoch.
   */
  @optional
  Nullable!(long) created;

  /**
   * A [hosted transaction
   * receipt](https://stripe.com/docs/treasury/moving-money/regulatory-receipts) URL that is
   * provided when money movement is considered regulated under Stripe's money transmission
   * licenses.
   */
  @optional
  string hosted_regulatory_receipt_url;

  /**
   * Reason for the failure. A ReceivedCredit might fail because the receiving FinancialAccount is
   * closed or frozen.
   */
  @optional
  string failure_code;

  @optional
  TreasurySharedResourceInitiatingPaymentMethodDetailsInitiatingPaymentMethodDetails initiating_payment_method_details;

  /**
   * Status of the ReceivedCredit. ReceivedCredits are created either `succeeded` (approved) or
   * `failed` (declined). If a ReceivedCredit is declined, the failure reason can be found in the
   * `failure_code` field.
   */
  @optional
  string status;

  mixin AddBuilder!(typeof(this));

}

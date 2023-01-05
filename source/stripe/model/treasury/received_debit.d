// File automatically generated from OpenAPI spec.
module stripe.model.treasury.received_debit;

import vibe.data.serialization : optional;
import vibe.data.json : Json;
import builder : AddBuilder;

import std.typecons : Nullable;

import stripe.model.treasury.transaction : TreasuryTransaction;
import stripe.model.treasury_received_debits_resource_linked_flows : TreasuryReceivedDebitsResourceLinkedFlows;
import stripe.model.treasury_received_debits_resource_reversal_details : TreasuryReceivedDebitsResourceReversalDetails;
import stripe.model.treasury_shared_resource_initiating_payment_method_details_initiating_payment_method_details : TreasurySharedResourceInitiatingPaymentMethodDetailsInitiatingPaymentMethodDetails;

/**
 * ReceivedDebits represent funds pulled from a
 * [FinancialAccount](https://stripe.com/docs/api#financial_accounts). These are not initiated
 * from the FinancialAccount.
 */
class TreasuryReceivedDebit {
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
   * Details describing when a ReceivedDebit might be reversed.
   */
  @optional
  TreasuryReceivedDebitsResourceReversalDetails reversal_details;

  /**
   * Has the value `true` if the object exists in live mode or the value `false` if the object
   * exists in test mode.
   */
  @optional
  Nullable!(bool) livemode;

  /**
   * The network used for the ReceivedDebit.
   */
  @optional
  string network;

  /**
   * The FinancialAccount that funds were pulled from.
   */
  @optional
  string financial_account;

  /**
   * String representing the object's type. Objects of the same type share the same value.
   */
  @optional
  string object;

  @optional
  TreasuryReceivedDebitsResourceLinkedFlows linked_flows;

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
   * Reason for the failure. A ReceivedDebit might fail because the FinancialAccount doesn't have
   * sufficient funds, is closed, or is frozen.
   */
  @optional
  string failure_code;

  @optional
  TreasurySharedResourceInitiatingPaymentMethodDetailsInitiatingPaymentMethodDetails initiating_payment_method_details;

  /**
   * Status of the ReceivedDebit. ReceivedDebits are created with a status of either `succeeded`
   * (approved) or `failed` (declined). The failure reason can be found under the `failure_code`.
   */
  @optional
  string status;

  mixin AddBuilder!(typeof(this));

}

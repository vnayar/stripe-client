// File automatically generated from OpenAPI spec.
module stripe.model.treasury.inbound_transfer;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;

import stripe.model.inbound_transfers : InboundTransfers;
import stripe.model.treasury.transaction : TreasuryTransaction;
import stripe.model.treasury_inbound_transfers_resource_failure_details : TreasuryInboundTransfersResourceFailureDetails;
import stripe.model.treasury_inbound_transfers_resource_inbound_transfer_resource_linked_flows : TreasuryInboundTransfersResourceInboundTransferResourceLinkedFlows;
import stripe.model.treasury_inbound_transfers_resource_inbound_transfer_resource_status_transitions : TreasuryInboundTransfersResourceInboundTransferResourceStatusTransitions;

/**
 * Use
 * [InboundTransfers](https://stripe.com/docs/treasury/moving-money/financial-accounts/into/inboun
 * d-transfers) to add funds to your
 * [FinancialAccount](https://stripe.com/docs/api#financial_accounts) via a PaymentMethod that is
 * owned by you. The funds will be transferred via an ACH debit.
 */
class TreasuryInboundTransfer {
  /**
   * Amount (in cents) transferred.
   */
  @optional
  Nullable!(int) amount;

  /**
   * Statement descriptor shown when funds are debited from the source. Not all payment networks
   * support `statement_descriptor`.
   */
  @optional
  Nullable!(string) statement_descriptor;

  /**
   * Details about this InboundTransfer's failure. Only set when status is `failed`.
   */
  @optional
  TreasuryInboundTransfersResourceFailureDetails failure_details;

  /**
   * Unique identifier for the object.
   */
  @optional
  Nullable!(string) id;

  @optional
  TreasuryInboundTransfersResourceInboundTransferResourceStatusTransitions status_transitions;

  /**
   * Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an
   * object. This can be useful for storing additional information about the object in a
   * structured format.
   */
  @optional
  Nullable!(string)[string] metadata;

  /**
   * Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in
   * lowercase. Must be a [supported currency](https://stripe.com/docs/currencies).
   */
  @optional
  Nullable!(string) currency;

  /**
   * The origin payment method to be debited for an InboundTransfer.
   */
  @optional
  Nullable!(string) origin_payment_method;

  /**
   * Details about the PaymentMethod for an InboundTransfer.
   */
  @optional
  InboundTransfers origin_payment_method_details;

  /**
   * The Transaction associated with this object.
   */
  @optional
  Json transaction;

  /**
   * Has the value `true` if the object exists in live mode or the value `false` if the object
   * exists in test mode.
   */
  @optional
  Nullable!(bool) livemode;

  /**
   * Returns `true` if the InboundTransfer is able to be canceled.
   */
  @optional
  Nullable!(bool) cancelable;

  /**
   * The FinancialAccount that received the funds.
   */
  @optional
  Nullable!(string) financial_account;

  /**
   * String representing the object's type. Objects of the same type share the same value.
   */
  @optional
  Nullable!(string) object;

  @optional
  TreasuryInboundTransfersResourceInboundTransferResourceLinkedFlows linked_flows;

  /**
   * An arbitrary string attached to the object. Often useful for displaying to users.
   */
  @optional
  Nullable!(string) description;

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
  Nullable!(string) hosted_regulatory_receipt_url;

  /**
   * Returns `true` if the funds for an InboundTransfer were returned after the InboundTransfer
   * went to the `succeeded` state.
   */
  @optional
  Nullable!(bool) returned;

  /**
   * Status of the InboundTransfer: `processing`, `succeeded`, `failed`, and `canceled`. An
   * InboundTransfer is `processing` if it is created and pending. The status changes to
   * `succeeded` once the funds have been "confirmed" and a `transaction` is created and posted.
   * The status changes to `failed` if the transfer fails.
   */
  @optional
  Nullable!(string) status;

}

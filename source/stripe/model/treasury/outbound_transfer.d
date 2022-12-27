// File automatically generated from OpenAPI spec.
module stripe.model.treasury.outbound_transfer;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;

import stripe.model.outbound_transfers_payment_method_details : OutboundTransfersPaymentMethodDetails;
import stripe.model.treasury.transaction : TreasuryTransaction;
import stripe.model.treasury_outbound_transfers_resource_returned_details : TreasuryOutboundTransfersResourceReturnedDetails;
import stripe.model.treasury_outbound_transfers_resource_status_transitions : TreasuryOutboundTransfersResourceStatusTransitions;

/**
 * Use OutboundTransfers to transfer funds from a
 * [FinancialAccount](https://stripe.com/docs/api#financial_accounts) to a PaymentMethod belonging
 * to the same entity. To send funds to a different party, use
 * [OutboundPayments](https://stripe.com/docs/api#outbound_payments) instead. You can send funds
 * over ACH rails or through a domestic wire transfer to a user's own external bank account.
 * Simulate OutboundTransfer state changes with the `/v1/test_helpers/treasury/outbound_transfers`
 * endpoints. These methods can only be called on test mode objects.
 */
class TreasuryOutboundTransfer {
  /**
   * Amount (in cents) transferred.
   */
  @optional
  Nullable!(int) amount;

  /**
   * Information about the OutboundTransfer to be sent to the recipient account.
   */
  @optional
  Nullable!(string) statement_descriptor;

  @optional
  TreasuryOutboundTransfersResourceStatusTransitions status_transitions;

  /**
   * Unique identifier for the object.
   */
  @optional
  Nullable!(string) id;

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
   * The PaymentMethod used as the payment instrument for an OutboundTransfer.
   */
  @optional
  Nullable!(string) destination_payment_method;

  /**
   * The Transaction associated with this object.
   */
  @optional
  Json transaction;

  /**
   * Details about a returned OutboundTransfer. Only set when the status is `returned`.
   */
  @optional
  TreasuryOutboundTransfersResourceReturnedDetails returned_details;

  /**
   * The date when funds are expected to arrive in the destination account.
   */
  @optional
  Nullable!(long) expected_arrival_date;

  /**
   * Has the value `true` if the object exists in live mode or the value `false` if the object
   * exists in test mode.
   */
  @optional
  Nullable!(bool) livemode;

  /**
   * Returns `true` if the object can be canceled, and `false` otherwise.
   */
  @optional
  Nullable!(bool) cancelable;

  /**
   * The FinancialAccount that funds were pulled from.
   */
  @optional
  Nullable!(string) financial_account;

  /**
   * String representing the object's type. Objects of the same type share the same value.
   */
  @optional
  Nullable!(string) object;

  /**
   * An arbitrary string attached to the object. Often useful for displaying to users.
   */
  @optional
  Nullable!(string) description;

  @optional
  OutboundTransfersPaymentMethodDetails destination_payment_method_details;

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
   * Current status of the OutboundTransfer: `processing`, `failed`, `canceled`, `posted`,
   * `returned`. An OutboundTransfer is `processing` if it has been created and is pending. The
   * status changes to `posted` once the OutboundTransfer has been "confirmed" and funds have left
   * the account, or to `failed` or `canceled`. If an OutboundTransfer fails to arrive at its
   * destination, its status will change to `returned`.
   */
  @optional
  Nullable!(string) status;

}

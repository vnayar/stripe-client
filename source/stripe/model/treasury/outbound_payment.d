// File automatically generated from OpenAPI spec.
module stripe.model.treasury.outbound_payment;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;

import stripe.model.outbound_payments_payment_method_details : OutboundPaymentsPaymentMethodDetails;
import stripe.model.treasury.transaction : TreasuryTransaction;
import stripe.model.treasury_outbound_payments_resource_outbound_payment_resource_end_user_details : TreasuryOutboundPaymentsResourceOutboundPaymentResourceEndUserDetails;
import stripe.model.treasury_outbound_payments_resource_outbound_payment_resource_status_transitions : TreasuryOutboundPaymentsResourceOutboundPaymentResourceStatusTransitions;
import stripe.model.treasury_outbound_payments_resource_returned_status : TreasuryOutboundPaymentsResourceReturnedStatus;

/**
 * Use OutboundPayments to send funds to another party's external bank account or
 * [FinancialAccount](https://stripe.com/docs/api#financial_accounts). To send money to an account
 * belonging to the same user, use an
 * [OutboundTransfer](https://stripe.com/docs/api#outbound_transfers).
 * Simulate OutboundPayment state changes with the `/v1/test_helpers/treasury/outbound_payments`
 * endpoints. These methods can only be called on test mode objects.
 */
class TreasuryOutboundPayment {
  /**
   * Amount (in cents) transferred.
   */
  @optional
  Nullable!(int) amount;

  /**
   * The description that appears on the receiving end for an OutboundPayment (for example, bank
   * statement for external bank transfer).
   */
  @optional
  string statement_descriptor;

  @optional
  TreasuryOutboundPaymentsResourceOutboundPaymentResourceStatusTransitions status_transitions;

  /**
   * Unique identifier for the object.
   */
  @optional
  string id;

  /**
   * Details about the end user.
   */
  @optional
  TreasuryOutboundPaymentsResourceOutboundPaymentResourceEndUserDetails end_user_details;

  /**
   * ID of the [customer](https://stripe.com/docs/api/customers) to whom an OutboundPayment is
   * sent.
   */
  @optional
  string customer;

  /**
   * Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an
   * object. This can be useful for storing additional information about the object in a
   * structured format.
   */
  @optional
  string[string] metadata;

  /**
   * Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in
   * lowercase. Must be a [supported currency](https://stripe.com/docs/currencies).
   */
  @optional
  string currency;

  /**
   * The PaymentMethod via which an OutboundPayment is sent. This field can be empty if the
   * OutboundPayment was created using `destination_payment_method_data`.
   */
  @optional
  string destination_payment_method;

  /**
   * The Transaction associated with this object.
   */
  @optional
  Json transaction;

  /**
   * Details about a returned OutboundPayment. Only set when the status is `returned`.
   */
  @optional
  TreasuryOutboundPaymentsResourceReturnedStatus returned_details;

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
  string financial_account;

  /**
   * String representing the object's type. Objects of the same type share the same value.
   */
  @optional
  string object;

  /**
   * An arbitrary string attached to the object. Often useful for displaying to users.
   */
  @optional
  string description;

  /**
   * Details about the PaymentMethod for an OutboundPayment.
   */
  @optional
  OutboundPaymentsPaymentMethodDetails destination_payment_method_details;

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
   * Current status of the OutboundPayment: `processing`, `failed`, `posted`, `returned`,
   * `canceled`. An OutboundPayment is `processing` if it has been created and is pending. The
   * status changes to `posted` once the OutboundPayment has been "confirmed" and funds have left
   * the account, or to `failed` or `canceled`. If an OutboundPayment fails to arrive at its
   * destination, its status will change to `returned`.
   */
  @optional
  string status;

}

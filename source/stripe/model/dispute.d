// File automatically generated from OpenAPI spec.
module stripe.model.dispute;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;

import stripe.model.balance_transaction : BalanceTransaction;
import stripe.model.charge : Charge;
import stripe.model.dispute_evidence : DisputeEvidence;
import stripe.model.dispute_evidence_details : DisputeEvidenceDetails;
import stripe.model.payment_intent : PaymentIntent;

/**
 * A dispute occurs when a customer questions your charge with their card issuer.
 * When this happens, you're given the opportunity to respond to the dispute with
 * evidence that shows that the charge is legitimate. You can find more
 * information about the dispute process in our [Disputes and
 * Fraud](/docs/disputes) documentation.
 * Related guide: [Disputes and Fraud](https://stripe.com/docs/disputes).
 */
class Dispute {
  /**
   * Disputed amount. Usually the amount of the charge, but can differ (usually because of
   * currency fluctuation or because only part of the order is disputed).
   */
  @optional
  Nullable!(int) amount;

  /**
   * ID of the PaymentIntent that was disputed.
   */
  @optional
  Json payment_intent;

  /**
   * If true, it is still possible to refund the disputed payment. Once the payment has been fully
   * refunded, no further funds will be withdrawn from your Stripe account as a result of this
   * dispute.
   */
  @optional
  Nullable!(bool) is_charge_refundable;

  /**
   * Unique identifier for the object.
   */
  @optional
  Nullable!(string) id;

  @optional
  DisputeEvidenceDetails evidence_details;

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
   * Reason given by cardholder for dispute. Possible values are `bank_cannot_process`,
   * `check_returned`, `credit_not_processed`, `customer_initiated`, `debit_not_authorized`,
   * `duplicate`, `fraudulent`, `general`, `incorrect_account_details`, `insufficient_funds`,
   * `product_not_received`, `product_unacceptable`, `subscription_canceled`, or `unrecognized`.
   * Read more about [dispute reasons](https://stripe.com/docs/disputes/categories).
   */
  @optional
  Nullable!(string) reason;

  /**
   * ID of the charge that was disputed.
   */
  @optional
  Json charge;

  /**
   * List of zero, one, or two balance transactions that show funds withdrawn and reinstated to
   * your Stripe account as a result of this dispute.
   */
  @optional
  BalanceTransaction[] balance_transactions;

  /**
   * Has the value `true` if the object exists in live mode or the value `false` if the object
   * exists in test mode.
   */
  @optional
  Nullable!(bool) livemode;

  /**
   * String representing the object's type. Objects of the same type share the same value.
   */
  @optional
  Nullable!(string) object;

  @optional
  DisputeEvidence evidence;

  /**
   * Time at which the object was created. Measured in seconds since the Unix epoch.
   */
  @optional
  Nullable!(long) created;

  /**
   * Current status of dispute. Possible values are `warning_needs_response`,
   * `warning_under_review`, `warning_closed`, `needs_response`, `under_review`,
   * `charge_refunded`, `won`, or `lost`.
   */
  @optional
  Nullable!(string) status;

}

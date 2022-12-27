// File automatically generated from OpenAPI spec.
module stripe.model.treasury.credit_reversal;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;

import stripe.model.treasury.transaction : TreasuryTransaction;
import stripe.model.treasury_received_credits_resource_status_transitions : TreasuryReceivedCreditsResourceStatusTransitions;

/**
 * You can reverse some [ReceivedCredits](https://stripe.com/docs/api#received_credits) depending
 * on their network and source flow. Reversing a ReceivedCredit leads to the creation of a new
 * object known as a CreditReversal.
 */
class TreasuryCreditReversal {
  /**
   * Amount (in cents) transferred.
   */
  @optional
  Nullable!(int) amount;

  @optional
  TreasuryReceivedCreditsResourceStatusTransitions status_transitions;

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
   * The ReceivedCredit being reversed.
   */
  @optional
  Nullable!(string) received_credit;

  /**
   * The rails used to reverse the funds.
   */
  @optional
  Nullable!(string) network;

  /**
   * The FinancialAccount to reverse funds from.
   */
  @optional
  Nullable!(string) financial_account;

  /**
   * String representing the object's type. Objects of the same type share the same value.
   */
  @optional
  Nullable!(string) object;

  /**
   * A [hosted transaction
   * receipt](https://stripe.com/docs/treasury/moving-money/regulatory-receipts) URL that is
   * provided when money movement is considered regulated under Stripe's money transmission
   * licenses.
   */
  @optional
  Nullable!(string) hosted_regulatory_receipt_url;

  /**
   * Time at which the object was created. Measured in seconds since the Unix epoch.
   */
  @optional
  Nullable!(long) created;

  /**
   * Status of the CreditReversal
   */
  @optional
  Nullable!(string) status;

}

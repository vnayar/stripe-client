// File automatically generated from OpenAPI spec.
module stripe.model.issuing.dispute;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;

import stripe.model.balance_transaction : BalanceTransaction;
import stripe.model.issuing.transaction : IssuingTransaction;
import stripe.model.issuing_dispute_evidence : IssuingDisputeEvidence;
import stripe.model.issuing_dispute_treasury : IssuingDisputeTreasury;

/**
 * As a [card issuer](https://stripe.com/docs/issuing), you can dispute transactions that the
 * cardholder does not recognize, suspects to be fraudulent, or has other issues with.
 * Related guide: [Disputing Transactions](https://stripe.com/docs/issuing/purchases/disputes)
 */
class IssuingDispute {
  /**
   * Disputed amount in the card's currency and in the [smallest currency
   * unit](https://stripe.com/docs/currencies#zero-decimal). Usually the amount of the
   * `transaction`, but can differ (usually because of currency fluctuation).
   */
  @optional
  Nullable!(int) amount;

  /**
   * Unique identifier for the object.
   */
  @optional
  string id;

  /**
   * Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an
   * object. This can be useful for storing additional information about the object in a
   * structured format.
   */
  @optional
  string[string] metadata;

  /**
   * The currency the `transaction` was made in.
   */
  @optional
  string currency;

  /**
   * The transaction being disputed.
   */
  @optional
  Json transaction;

  /**
   * List of balance transactions associated with the dispute.
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
  string object;

  /**
   * [Treasury](https://stripe.com/docs/api/treasury) details related to this dispute if it was
   * created on a [FinancialAccount](/docs/api/treasury/financial_accounts
   */
  @optional
  IssuingDisputeTreasury treasury;

  @optional
  IssuingDisputeEvidence evidence;

  /**
   * Time at which the object was created. Measured in seconds since the Unix epoch.
   */
  @optional
  Nullable!(long) created;

  /**
   * Current status of the dispute.
   */
  @optional
  string status;

}

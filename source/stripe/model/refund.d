// File automatically generated from OpenAPI spec.
module stripe.model.refund;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;

import stripe.model.balance_transaction : BalanceTransaction;
import stripe.model.charge : Charge;
import stripe.model.payment_intent : PaymentIntent;
import stripe.model.refund_next_action : RefundNextAction;
import stripe.model.transfer_reversal : TransferReversal;

/**
 * `Refund` objects allow you to refund a charge that has previously been created
 * but not yet refunded. Funds will be refunded to the credit or debit card that
 * was originally charged.
 * Related guide: [Refunds](https://stripe.com/docs/refunds).
 */
class Refund {
  /**
   * Amount, in %s.
   */
  @optional
  Nullable!(int) amount;

  /**
   * ID of the PaymentIntent that was refunded.
   */
  @optional
  Json payment_intent;

  /**
   * Unique identifier for the object.
   */
  @optional
  string id;

  /**
   * Email to which refund instructions, if required, are sent to.
   */
  @optional
  string instructions_email;

  @optional
  RefundNextAction next_action;

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
   * Reason for the refund, either user-provided (`duplicate`, `fraudulent`, or
   * `requested_by_customer`) or generated by Stripe internally (`expired_uncaptured_charge`).
   */
  @optional
  string reason;

  /**
   * Balance transaction that describes the impact on your account balance.
   */
  @optional
  Json balance_transaction;

  /**
   * This is the transaction number that appears on email receipts sent for this refund.
   */
  @optional
  string receipt_number;

  /**
   * ID of the charge that was refunded.
   */
  @optional
  Json charge;

  /**
   * If the refund failed, the reason for refund failure if known. Possible values are
   * `lost_or_stolen_card`, `expired_or_canceled_card`, or `unknown`.
   */
  @optional
  string failure_reason;

  /**
   * The transfer reversal that is associated with the refund. Only present if the charge came
   * from another Stripe account. See the Connect documentation for details.
   */
  @optional
  Json source_transfer_reversal;

  /**
   * String representing the object's type. Objects of the same type share the same value.
   */
  @optional
  string object;

  /**
   * If the accompanying transfer was reversed, the transfer reversal object. Only applicable if
   * the charge was created using the destination parameter.
   */
  @optional
  Json transfer_reversal;

  /**
   * An arbitrary string attached to the object. Often useful for displaying to users. (Available
   * on non-card refunds only)
   */
  @optional
  string description;

  /**
   * Time at which the object was created. Measured in seconds since the Unix epoch.
   */
  @optional
  Nullable!(long) created;

  /**
   * If the refund failed, this balance transaction describes the adjustment made on your account
   * balance that reverses the initial balance transaction.
   */
  @optional
  Json failure_balance_transaction;

  /**
   * Status of the refund. For credit card refunds, this can be `pending`, `succeeded`, or
   * `failed`. For other types of refunds, it can be `pending`, `requires_action`, `succeeded`,
   * `failed`, or `canceled`. Refer to our
   * [refunds](https://stripe.com/docs/refunds#failed-refunds) documentation for more details.
   */
  @optional
  string status;

}

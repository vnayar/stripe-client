// File automatically generated from OpenAPI spec.
module stripe.model.charge;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;

import stripe.model.account : Account;
import stripe.model.application : Application;
import stripe.model.application_fee : ApplicationFee;
import stripe.model.balance_transaction : BalanceTransaction;
import stripe.model.billing_details : BillingDetails;
import stripe.model.charge_fraud_details : ChargeFraudDetails;
import stripe.model.charge_outcome : ChargeOutcome;
import stripe.model.charge_transfer_data : ChargeTransferData;
import stripe.model.customer : Customer;
import stripe.model.deleted_customer : DeletedCustomer;
import stripe.model.invoice : Invoice;
import stripe.model.payment_intent : PaymentIntent;
import stripe.model.payment_method_details : PaymentMethodDetails;
import stripe.model.radar_radar_options : RadarRadarOptions;
import stripe.model.refund : Refund;
import stripe.model.review : Review;
import stripe.model.shipping : Shipping;
import stripe.model.transfer : Transfer;

/**
 * To charge a credit or a debit card, you create a `Charge` object. You can
 * retrieve and refund individual charges as well as list all charges. Charges
 * are identified by a unique, random ID.
 * Related guide: [Accept a payment with the Charges
 * API](https://stripe.com/docs/payments/accept-a-payment-charges).
 */
class Charge {
  /**
   * Unique identifier for the object.
   */
  @optional
  string id;

  /**
   * A string that identifies this transaction as part of a group. See the [Connect
   * documentation](https://stripe.com/docs/connect/charges-transfers#transfer-options) for
   * details.
   */
  @optional
  string transfer_group;

  /**
   * ID of the review associated with this charge if one exists.
   */
  @optional
  Json review;

  /**
   * This is the email address that the receipt for this charge was sent to.
   */
  @optional
  string receipt_email;

  static class RefundList {
    /**
     * True if this list has another page of items after this one that can be fetched.
     */
    @optional
    Nullable!(bool) has_more;

    /**
     * String representing the object's type. Objects of the same type share the same value. Always
     * has the value `list`.
     */
    @optional
    string object;

    /**
     * Details about each object.
     */
    @optional
    Refund[] data;

    /**
     * The URL where this list can be accessed.
     */
    @optional
    string url;

  }

  /**
   * A list of refunds that have been applied to the charge.
   */
  @optional
  RefundList refunds;

  /**
   * Time at which the object was created. Measured in seconds since the Unix epoch.
   */
  @optional
  Nullable!(long) created;

  /**
   * The account (if any) the charge was made on behalf of without triggering an automatic
   * transfer. See the [Connect documentation](https://stripe.com/docs/connect/charges-transfers)
   * for details.
   */
  @optional
  Json on_behalf_of;

  /**
   * The application fee (if any) for the charge. [See the Connect
   * documentation](https://stripe.com/docs/connect/direct-charges#collecting-fees) for details.
   */
  @optional
  Json application_fee;

  /**
   * ID of the invoice this charge is for if one exists.
   */
  @optional
  Json invoice;

  /**
   * Message to user further explaining reason for charge failure if available.
   */
  @optional
  string failure_message;

  /**
   * ID of the customer this charge is for if one exists.
   */
  @optional
  Json customer;

  /**
   * Information on fraud assessments for the charge.
   */
  @optional
  ChargeFraudDetails fraud_details;

  /**
   * Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in
   * lowercase. Must be a [supported currency](https://stripe.com/docs/currencies).
   */
  @optional
  string currency;

  /**
   * Amount in %s refunded (can be less than the amount attribute on the charge if a partial
   * refund was issued).
   */
  @optional
  Nullable!(int) amount_refunded;

  /**
   * ID of the balance transaction that describes the impact of this charge on your account
   * balance (not including refunds or disputes).
   */
  @optional
  Json balance_transaction;

  /**
   * The full statement descriptor that is passed to card networks, and that is displayed on your
   * customers' credit card and bank statements. Allows you to see what the statement descriptor
   * looks like after the static and dynamic portions are combined.
   */
  @optional
  string calculated_statement_descriptor;

  /**
   * `true` if the charge succeeded, or was successfully authorized for later capture.
   */
  @optional
  Nullable!(bool) paid;

  /**
   * Whether the charge has been disputed.
   */
  @optional
  Nullable!(bool) disputed;

  @optional
  RadarRadarOptions radar_options;

  /**
   * An optional dictionary including the account to automatically transfer to as part of a
   * destination charge. [See the Connect
   * documentation](https://stripe.com/docs/connect/destination-charges) for details.
   */
  @optional
  ChargeTransferData transfer_data;

  /**
   * ID of the transfer to the `destination` account (only applicable if the charge was created
   * using the `destination` parameter).
   */
  @optional
  Json transfer;

  /**
   * Amount intended to be collected by this payment. A positive integer representing how much to
   * charge in the [smallest currency unit](https://stripe.com/docs/currencies#zero-decimal)
   * (e.g., 100 cents to charge $1.00 or 100 to charge ¥100, a zero-decimal currency). The
   * minimum amount is $0.50 US or [equivalent in charge
   * currency](https://stripe.com/docs/currencies#minimum-and-maximum-charge-amounts). The amount
   * value supports up to eight digits (e.g., a value of 99999999 for a USD charge of
   * $999,999.99).
   */
  @optional
  Nullable!(int) amount;

  /**
   * Details about the payment method at the time of the transaction.
   */
  @optional
  PaymentMethodDetails payment_method_details;

  /**
   * This is the URL to view the receipt for this charge. The receipt is kept up-to-date to the
   * latest state of the charge, including any refunds. If the charge is for an Invoice, the
   * receipt will be stylized as an Invoice receipt.
   */
  @optional
  string receipt_url;

  /**
   * The transfer ID which created this charge. Only present if the charge came from another
   * Stripe account. [See the Connect
   * documentation](https://stripe.com/docs/connect/destination-charges) for details.
   */
  @optional
  Json source_transfer;

  /**
   * Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an
   * object. This can be useful for storing additional information about the object in a
   * structured format.
   */
  @optional
  string[string] metadata;

  /**
   * This is the transaction number that appears on email receipts sent for this charge. This
   * attribute will be `null` until a receipt has been sent.
   */
  @optional
  string receipt_number;

  /**
   * ID of the Connect application that created the charge.
   */
  @optional
  Json application;

  /**
   * ID of the payment method used in this charge.
   */
  @optional
  string payment_method;

  /**
   * If the charge was created without capturing, this Boolean represents whether it is still
   * uncaptured or has since been captured.
   */
  @optional
  Nullable!(bool) captured;

  /**
   * The amount of the application fee (if any) requested for the charge. [See the Connect
   * documentation](https://stripe.com/docs/connect/direct-charges#collecting-fees) for details.
   */
  @optional
  Nullable!(int) application_fee_amount;

  @optional
  BillingDetails billing_details;

  /**
   * ID of the balance transaction that describes the reversal of the balance on your account due
   * to payment failure.
   */
  @optional
  Json failure_balance_transaction;

  /**
   * The status of the payment is either `succeeded`, `pending`, or `failed`.
   */
  @optional
  string status;

  /**
   * For card charges, use `statement_descriptor_suffix` instead. Otherwise, you can use this
   * value as the complete description of a charge on your customers’ statements. Must contain
   * at least one letter, maximum 22 characters.
   */
  @optional
  string statement_descriptor;

  /**
   * ID of the PaymentIntent associated with this charge, if one exists.
   */
  @optional
  Json payment_intent;

  /**
   * Amount in %s captured (can be less than the amount attribute on the charge if a partial
   * capture was made).
   */
  @optional
  Nullable!(int) amount_captured;

  /**
   * Details about whether the payment was accepted, and why. See [understanding
   * declines](https://stripe.com/docs/declines) for details.
   */
  @optional
  ChargeOutcome outcome;

  /**
   * Has the value `true` if the object exists in live mode or the value `false` if the object
   * exists in test mode.
   */
  @optional
  Nullable!(bool) livemode;

  /**
   * Whether the charge has been fully refunded. If the charge is only partially refunded, this
   * attribute will still be false.
   */
  @optional
  Nullable!(bool) refunded;

  /**
   * Provides information about the charge that customers see on their statements. Concatenated
   * with the prefix (shortened descriptor) or statement descriptor that’s set on the account to
   * form the complete statement descriptor. Maximum 22 characters for the concatenated
   * descriptor.
   */
  @optional
  string statement_descriptor_suffix;

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
   * Shipping information for the charge.
   */
  @optional
  Shipping shipping;

  /**
   * Error code explaining reason for charge failure if available (see [the errors
   * section](https://stripe.com/docs/error-codes) for a list of codes).
   */
  @optional
  string failure_code;

}

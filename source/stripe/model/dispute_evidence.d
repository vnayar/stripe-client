// File automatically generated from OpenAPI spec.
module stripe.model.dispute_evidence;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;

import stripe.model.file : File;

/**
 */
class DisputeEvidence {
  /**
   * The IP address that the customer used when making the purchase.
   */
  @optional
  Nullable!(string) customer_purchase_ip;

  /**
   * (ID of a [file upload](https://stripe.com/docs/guides/file-upload)) Any communication with
   * the customer that you feel is relevant to your case. Examples include emails proving that the
   * customer received the product or service, or demonstrating their use of or satisfaction with
   * the product or service.
   */
  @optional
  Json customer_communication;

  /**
   * The date on which a physical product began its route to the shipping address, in a clear
   * human-readable format.
   */
  @optional
  Nullable!(string) shipping_date;

  /**
   * The tracking number for a physical product, obtained from the delivery service. If multiple
   * tracking numbers were generated for this purchase, please separate them with commas.
   */
  @optional
  Nullable!(string) shipping_tracking_number;

  /**
   * The delivery service that shipped a physical product, such as Fedex, UPS, USPS, etc. If
   * multiple carriers were used for this purchase, please separate them with commas.
   */
  @optional
  Nullable!(string) shipping_carrier;

  /**
   * (ID of a [file upload](https://stripe.com/docs/guides/file-upload)) Your refund policy, as
   * shown to the customer.
   */
  @optional
  Json refund_policy;

  /**
   * The address to which a physical product was shipped. You should try to include as complete
   * address information as possible.
   */
  @optional
  Nullable!(string) shipping_address;

  /**
   * (ID of a [file upload](https://stripe.com/docs/guides/file-upload)) Documentation showing
   * proof that a service was provided to the customer. This could include a copy of a signed
   * contract, work order, or other form of written agreement.
   */
  @optional
  Json service_documentation;

  /**
   * A justification for why the customer is not entitled to a refund.
   */
  @optional
  Nullable!(string) refund_refusal_explanation;

  /**
   * (ID of a [file upload](https://stripe.com/docs/guides/file-upload)) Any receipt or message
   * sent to the customer notifying them of the charge.
   */
  @optional
  Json receipt;

  /**
   * The email address of the customer.
   */
  @optional
  Nullable!(string) customer_email_address;

  /**
   * (ID of a [file upload](https://stripe.com/docs/guides/file-upload)) Your subscription
   * cancellation policy, as shown to the customer.
   */
  @optional
  Json cancellation_policy;

  /**
   * A description of the product or service that was sold.
   */
  @optional
  Nullable!(string) product_description;

  /**
   * (ID of a [file upload](https://stripe.com/docs/guides/file-upload)) Documentation for the
   * prior charge that can uniquely identify the charge, such as a receipt, shipping label, work
   * order, etc. This document should be paired with a similar document from the disputed payment
   * that proves the two payments are separate.
   */
  @optional
  Json duplicate_charge_documentation;

  /**
   * (ID of a [file upload](https://stripe.com/docs/guides/file-upload)) Any additional evidence
   * or statements.
   */
  @optional
  Json uncategorized_file;

  /**
   * (ID of a [file upload](https://stripe.com/docs/guides/file-upload)) Documentation showing
   * proof that a product was shipped to the customer at the same address the customer provided to
   * you. This could include a copy of the shipment receipt, shipping label, etc. It should show
   * the customer's full shipping address, if possible.
   */
  @optional
  Json shipping_documentation;

  /**
   * The date on which the customer received or began receiving the purchased service, in a clear
   * human-readable format.
   */
  @optional
  Nullable!(string) service_date;

  /**
   * The billing address provided by the customer.
   */
  @optional
  Nullable!(string) billing_address;

  /**
   * The Stripe ID for the prior charge which appears to be a duplicate of the disputed charge.
   */
  @optional
  Nullable!(string) duplicate_charge_id;

  /**
   * Documentation demonstrating that the customer was shown your refund policy prior to purchase.
   */
  @optional
  Nullable!(string) refund_policy_disclosure;

  /**
   * The name of the customer.
   */
  @optional
  Nullable!(string) customer_name;

  /**
   * An explanation of how and when the customer was shown your refund policy prior to purchase.
   */
  @optional
  Nullable!(string) cancellation_policy_disclosure;

  /**
   * Any additional evidence or statements.
   */
  @optional
  Nullable!(string) uncategorized_text;

  /**
   * A justification for why the customer's subscription was not canceled.
   */
  @optional
  Nullable!(string) cancellation_rebuttal;

  /**
   * Any server or activity logs showing proof that the customer accessed or downloaded the
   * purchased digital product. This information should include IP addresses, corresponding
   * timestamps, and any detailed recorded activity.
   */
  @optional
  Nullable!(string) access_activity_log;

  /**
   * An explanation of the difference between the disputed charge versus the prior charge that
   * appears to be a duplicate.
   */
  @optional
  Nullable!(string) duplicate_charge_explanation;

  /**
   * (ID of a [file upload](https://stripe.com/docs/guides/file-upload)) A relevant document or
   * contract showing the customer's signature.
   */
  @optional
  Json customer_signature;

}

// File automatically generated from OpenAPI spec.
module stripe.model.payment_flows_private_payment_methods_alipay_details;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;


/**
 */
class PaymentFlowsPrivatePaymentMethodsAlipayDetails {
  /**
   * Transaction ID of this particular Alipay transaction.
   */
  @optional
  string transaction_id;

  /**
   * Uniquely identifies this particular Alipay account. You can use this attribute to check
   * whether two Alipay accounts are the same.
   */
  @optional
  string fingerprint;

  /**
   * Uniquely identifies this particular Alipay account. You can use this attribute to check
   * whether two Alipay accounts are the same.
   */
  @optional
  string buyer_id;

}

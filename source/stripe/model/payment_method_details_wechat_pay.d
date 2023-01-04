// File automatically generated from OpenAPI spec.
module stripe.model.payment_method_details_wechat_pay;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;


/**
 */
class PaymentMethodDetailsWechatPay {
  /**
   * Transaction ID of this particular WeChat Pay transaction.
   */
  @optional
  string transaction_id;

  /**
   * Uniquely identifies this particular WeChat Pay account. You can use this attribute to check
   * whether two WeChat accounts are the same.
   */
  @optional
  string fingerprint;

}

// File automatically generated from OpenAPI spec.
module stripe.model.payment_intent_next_action_wechat_pay_redirect_to_android_app;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;


/**
 */
class PaymentIntentNextActionWechatPayRedirectToAndroidApp {
  /**
   * package is static value
   */
  @optional
  Nullable!(string) package_;

  /**
   * A signature
   */
  @optional
  Nullable!(string) sign;

  /**
   * nonce_str is a random string
   */
  @optional
  Nullable!(string) nonce_str;

  /**
   * app_id is the APP ID registered on WeChat open platform
   */
  @optional
  Nullable!(string) app_id;

  /**
   * an unique trading ID assigned by WeChat Pay
   */
  @optional
  Nullable!(string) prepay_id;

  /**
   * an unique merchant ID assigned by WeChat Pay
   */
  @optional
  Nullable!(string) partner_id;

  /**
   * Specifies the current time in epoch format
   */
  @optional
  Nullable!(string) timestamp;

}

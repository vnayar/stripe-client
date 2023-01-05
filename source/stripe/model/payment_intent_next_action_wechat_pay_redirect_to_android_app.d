// File automatically generated from OpenAPI spec.
module stripe.model.payment_intent_next_action_wechat_pay_redirect_to_android_app;

import vibe.data.serialization : optional;
import vibe.data.json : Json;
import builder : AddBuilder;

import std.typecons : Nullable;


/**
 */
class PaymentIntentNextActionWechatPayRedirectToAndroidApp {
  /**
   * package is static value
   */
  @optional
  string package_;

  /**
   * A signature
   */
  @optional
  string sign;

  /**
   * nonce_str is a random string
   */
  @optional
  string nonce_str;

  /**
   * app_id is the APP ID registered on WeChat open platform
   */
  @optional
  string app_id;

  /**
   * an unique trading ID assigned by WeChat Pay
   */
  @optional
  string prepay_id;

  /**
   * an unique merchant ID assigned by WeChat Pay
   */
  @optional
  string partner_id;

  /**
   * Specifies the current time in epoch format
   */
  @optional
  string timestamp;

  mixin AddBuilder!(typeof(this));

}

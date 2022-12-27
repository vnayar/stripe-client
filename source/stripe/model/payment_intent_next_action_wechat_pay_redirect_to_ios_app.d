// File automatically generated from OpenAPI spec.
module stripe.model.payment_intent_next_action_wechat_pay_redirect_to_ios_app;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;


/**
 */
class PaymentIntentNextActionWechatPayRedirectToIosApp {
  /**
   * An universal link that redirect to WeChat Pay app
   */
  @optional
  Nullable!(string) native_url;

}

// File automatically generated from OpenAPI spec.
module stripe.model.payment_intent_next_action_wechat_pay_redirect_to_ios_app;

import vibe.data.serialization : optional;
import vibe.data.json : Json;
import builder : AddBuilder;

import std.typecons : Nullable;


/**
 */
class PaymentIntentNextActionWechatPayRedirectToIosApp {
  /**
   * An universal link that redirect to WeChat Pay app
   */
  @optional
  string native_url;

  mixin AddBuilder!(typeof(this));

}

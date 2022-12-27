// File automatically generated from OpenAPI spec.
module stripe.model.payment_intent_next_action;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;

import stripe.model.payment_intent_next_action_alipay_handle_redirect : PaymentIntentNextActionAlipayHandleRedirect;
import stripe.model.payment_intent_next_action_boleto : PaymentIntentNextActionBoleto;
import stripe.model.payment_intent_next_action_card_await_notification : PaymentIntentNextActionCardAwaitNotification;
import stripe.model.payment_intent_next_action_display_bank_transfer_instructions : PaymentIntentNextActionDisplayBankTransferInstructions;
import stripe.model.payment_intent_next_action_display_oxxo_details : PaymentIntentNextActionDisplayOxxoDetails;
import stripe.model.payment_intent_next_action_konbini : PaymentIntentNextActionKonbini;
import stripe.model.payment_intent_next_action_paynow_display_qr_code : PaymentIntentNextActionPaynowDisplayQrCode;
import stripe.model.payment_intent_next_action_pix_display_qr_code : PaymentIntentNextActionPixDisplayQrCode;
import stripe.model.payment_intent_next_action_promptpay_display_qr_code : PaymentIntentNextActionPromptpayDisplayQrCode;
import stripe.model.payment_intent_next_action_redirect_to_url : PaymentIntentNextActionRedirectToUrl;
import stripe.model.payment_intent_next_action_verify_with_microdeposits : PaymentIntentNextActionVerifyWithMicrodeposits;
import stripe.model.payment_intent_next_action_wechat_pay_display_qr_code : PaymentIntentNextActionWechatPayDisplayQrCode;
import stripe.model.payment_intent_next_action_wechat_pay_redirect_to_android_app : PaymentIntentNextActionWechatPayRedirectToAndroidApp;
import stripe.model.payment_intent_next_action_wechat_pay_redirect_to_ios_app : PaymentIntentNextActionWechatPayRedirectToIosApp;

/**
 */
class PaymentIntentNextAction {
  @optional
  PaymentIntentNextActionPromptpayDisplayQrCode promptpay_display_qr_code;

  @optional
  PaymentIntentNextActionDisplayBankTransferInstructions display_bank_transfer_instructions;

  @optional
  PaymentIntentNextActionBoleto boleto_display_details;

  @optional
  PaymentIntentNextActionKonbini konbini_display_details;

  @optional
  PaymentIntentNextActionVerifyWithMicrodeposits verify_with_microdeposits;

  @optional
  PaymentIntentNextActionCardAwaitNotification card_await_notification;

  @optional
  PaymentIntentNextActionPixDisplayQrCode pix_display_qr_code;

  /**
   * When confirming a PaymentIntent with Stripe.js, Stripe.js depends on the contents of this
   * dictionary to invoke authentication flows. The shape of the contents is subject to change and
   * is only intended to be used by Stripe.js.
   */
  @optional
  Json use_stripe_sdk;

  @optional
  PaymentIntentNextActionWechatPayDisplayQrCode wechat_pay_display_qr_code;

  @optional
  PaymentIntentNextActionDisplayOxxoDetails oxxo_display_details;

  @optional
  PaymentIntentNextActionAlipayHandleRedirect alipay_handle_redirect;

  @optional
  PaymentIntentNextActionPaynowDisplayQrCode paynow_display_qr_code;

  @optional
  PaymentIntentNextActionRedirectToUrl redirect_to_url;

  @optional
  PaymentIntentNextActionWechatPayRedirectToAndroidApp wechat_pay_redirect_to_android_app;

  /**
   * Type of the next action to perform, one of `redirect_to_url`, `use_stripe_sdk`,
   * `alipay_handle_redirect`, `oxxo_display_details`, or `verify_with_microdeposits`.
   */
  @optional
  Nullable!(string) type;

  @optional
  PaymentIntentNextActionWechatPayRedirectToIosApp wechat_pay_redirect_to_ios_app;

}

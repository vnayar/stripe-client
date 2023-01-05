// File automatically generated from OpenAPI spec.
module stripe.model.payment_intent_next_action_promptpay_display_qr_code;

import vibe.data.serialization : optional;
import vibe.data.json : Json;
import builder : AddBuilder;

import std.typecons : Nullable;


/**
 */
class PaymentIntentNextActionPromptpayDisplayQrCode {
  /**
   * The SVG path used to render the QR code, can be used as the source in an HTML img tag
   */
  @optional
  string image_url_svg;

  /**
   * The URL to the hosted PromptPay instructions page, which allows customers to view the
   * PromptPay QR code.
   */
  @optional
  string hosted_instructions_url;

  /**
   * The raw data string used to generate QR code, it should be used together with QR code
   * library.
   */
  @optional
  string data;

  /**
   * The PNG path used to render the QR code, can be used as the source in an HTML img tag
   */
  @optional
  string image_url_png;

  mixin AddBuilder!(typeof(this));

}

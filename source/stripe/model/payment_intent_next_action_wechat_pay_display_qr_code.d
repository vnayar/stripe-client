// File automatically generated from OpenAPI spec.
module stripe.model.payment_intent_next_action_wechat_pay_display_qr_code;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;


/**
 */
class PaymentIntentNextActionWechatPayDisplayQrCode {
  /**
   * The base64 image data for a pre-generated QR code
   */
  @optional
  Nullable!(string) image_data_url;

  /**
   * The image_url_svg string used to render QR code
   */
  @optional
  Nullable!(string) image_url_svg;

  /**
   * The URL to the hosted WeChat Pay instructions page, which allows customers to view the WeChat
   * Pay QR code.
   */
  @optional
  Nullable!(string) hosted_instructions_url;

  /**
   * The image_url_png string used to render QR code
   */
  @optional
  Nullable!(string) image_url_png;

  /**
   * The data being used to generate QR code
   */
  @optional
  Nullable!(string) data;

}

// File automatically generated from OpenAPI spec.
module stripe.model.payment_intent_next_action_paynow_display_qr_code;

import vibe.data.serialization : optional;
import vibe.data.json : Json;
import builder : AddBuilder;

import std.typecons : Nullable;


/**
 */
class PaymentIntentNextActionPaynowDisplayQrCode {
  /**
   * The image_url_svg string used to render QR code
   */
  @optional
  string image_url_svg;

  /**
   * The URL to the hosted PayNow instructions page, which allows customers to view the PayNow QR
   * code.
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
   * The image_url_png string used to render QR code
   */
  @optional
  string image_url_png;

  mixin AddBuilder!(typeof(this));

}

// File automatically generated from OpenAPI spec.
module stripe.model.payment_intent_next_action_display_oxxo_details;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;


/**
 */
class PaymentIntentNextActionDisplayOxxoDetails {
  /**
   * The URL for the hosted OXXO voucher page, which allows customers to view and print an OXXO
   * voucher.
   */
  @optional
  string hosted_voucher_url;

  /**
   * OXXO reference number.
   */
  @optional
  string number;

  /**
   * The timestamp after which the OXXO voucher expires.
   */
  @optional
  Nullable!(long) expires_after;

}

// File automatically generated from OpenAPI spec.
module stripe.model.payment_intent_next_action_boleto;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;


/**
 */
class PaymentIntentNextActionBoleto {
  /**
   * The URL to the downloadable boleto voucher PDF.
   */
  @optional
  Nullable!(string) pdf;

  /**
   * The URL to the hosted boleto voucher page, which allows customers to view the boleto voucher.
   */
  @optional
  Nullable!(string) hosted_voucher_url;

  /**
   * The boleto number.
   */
  @optional
  Nullable!(string) number;

  /**
   * The timestamp after which the boleto expires.
   */
  @optional
  Nullable!(long) expires_at;

}

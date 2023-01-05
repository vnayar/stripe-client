// File automatically generated from OpenAPI spec.
module stripe.model.payment_intent_next_action_boleto;

import vibe.data.serialization : optional;
import vibe.data.json : Json;
import builder : AddBuilder;

import std.typecons : Nullable;


/**
 */
class PaymentIntentNextActionBoleto {
  /**
   * The URL to the downloadable boleto voucher PDF.
   */
  @optional
  string pdf;

  /**
   * The URL to the hosted boleto voucher page, which allows customers to view the boleto voucher.
   */
  @optional
  string hosted_voucher_url;

  /**
   * The boleto number.
   */
  @optional
  string number;

  /**
   * The timestamp after which the boleto expires.
   */
  @optional
  Nullable!(long) expires_at;

  mixin AddBuilder!(typeof(this));

}

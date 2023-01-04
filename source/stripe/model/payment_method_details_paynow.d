// File automatically generated from OpenAPI spec.
module stripe.model.payment_method_details_paynow;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;


/**
 */
class PaymentMethodDetailsPaynow {
  /**
   * Reference number associated with this PayNow payment
   */
  @optional
  string reference;

}

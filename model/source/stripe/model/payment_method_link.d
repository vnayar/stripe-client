// File automatically generated from OpenAPI spec.
module stripe.model.payment_method_link;

import vibe.data.serialization : optional;
import vibe.data.json : Json;
import builder : AddBuilder;

import std.typecons : Nullable;


/**
 */
class PaymentMethodLink {
  /**
   * Account owner's email address.
   */
  @optional
  string email;

  /**
   * Token used for persistent Link logins.
   */
  @optional
  string persistent_token;

  mixin AddBuilder!(typeof(this));

}

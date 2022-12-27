// File automatically generated from OpenAPI spec.
module stripe.model.payment_method_link;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;


/**
 */
class PaymentMethodLink {
  /**
   * Account owner's email address.
   */
  @optional
  Nullable!(string) email;

  /**
   * Token used for persistent Link logins.
   */
  @optional
  Nullable!(string) persistent_token;

}

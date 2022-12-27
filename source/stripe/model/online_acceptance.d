// File automatically generated from OpenAPI spec.
module stripe.model.online_acceptance;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;


/**
 */
class OnlineAcceptance {
  /**
   * The user agent of the browser from which the Mandate was accepted by the customer.
   */
  @optional
  Nullable!(string) user_agent;

  /**
   * The IP address from which the Mandate was accepted by the customer.
   */
  @optional
  Nullable!(string) ip_address;

}

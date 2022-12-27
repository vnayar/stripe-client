// File automatically generated from OpenAPI spec.
module stripe.model.account_tos_acceptance;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;


/**
 */
class AccountTosAcceptance {
  /**
   * The user's service agreement type
   */
  @optional
  Nullable!(string) service_agreement;

  /**
   * The IP address from which the account representative accepted their service agreement
   */
  @optional
  Nullable!(string) ip;

  /**
   * The Unix timestamp marking when the account representative accepted their service agreement
   */
  @optional
  Nullable!(long) date;

  /**
   * The user agent of the browser from which the account representative accepted their service
   * agreement
   */
  @optional
  Nullable!(string) user_agent;

}

// File automatically generated from OpenAPI spec.
module stripe.model.card_issuing_account_terms_of_service;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;


/**
 */
class CardIssuingAccountTermsOfService {
  /**
   * The IP address from which the account representative accepted the service agreement.
   */
  @optional
  Nullable!(string) ip;

  /**
   * The Unix timestamp marking when the account representative accepted the service agreement.
   */
  @optional
  Nullable!(int) date;

  /**
   * The user agent of the browser from which the account representative accepted the service
   * agreement.
   */
  @optional
  Nullable!(string) user_agent;

}

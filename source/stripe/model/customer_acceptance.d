// File automatically generated from OpenAPI spec.
module stripe.model.customer_acceptance;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;

import stripe.model.offline_acceptance : OfflineAcceptance;
import stripe.model.online_acceptance : OnlineAcceptance;

/**
 */
class CustomerAcceptance {
  /**
   * The time at which the customer accepted the Mandate.
   */
  @optional
  Nullable!(long) accepted_at;

  /**
   * The type of customer acceptance information included with the Mandate. One of `online` or
   * `offline`.
   */
  @optional
  string type;

  @optional
  OfflineAcceptance offline;

  @optional
  OnlineAcceptance online;

}

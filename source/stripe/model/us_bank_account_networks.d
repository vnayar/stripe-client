// File automatically generated from OpenAPI spec.
module stripe.model.us_bank_account_networks;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;


/**
 */
class UsBankAccountNetworks {
  /**
   * All supported networks.
   */
  @optional
  string[] supported;

  /**
   * The preferred network.
   */
  @optional
  string preferred;

}

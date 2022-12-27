// File automatically generated from OpenAPI spec.
module stripe.model.networks;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;


/**
 */
class Networks {
  /**
   * All available networks for the card.
   */
  @optional
  Nullable!(string)[] available;

  /**
   * The preferred network for the card.
   */
  @optional
  Nullable!(string) preferred;

}

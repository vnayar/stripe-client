// File automatically generated from OpenAPI spec.
module stripe.model.terminal.location;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;

import stripe.model.address : Address;

/**
 * A Location represents a grouping of readers.
 * Related guide: [Fleet Management](https://stripe.com/docs/terminal/fleet/locations).
 */
class TerminalLocation {
  /**
   * Unique identifier for the object.
   */
  @optional
  string id;

  /**
   * Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an
   * object. This can be useful for storing additional information about the object in a
   * structured format.
   */
  @optional
  string[string] metadata;

  /**
   * The ID of a configuration that will be used to customize all readers in this location.
   */
  @optional
  string configuration_overrides;

  /**
   * Has the value `true` if the object exists in live mode or the value `false` if the object
   * exists in test mode.
   */
  @optional
  Nullable!(bool) livemode;

  /**
   * The display name of the location.
   */
  @optional
  string display_name;

  @optional
  Address address;

  /**
   * String representing the object's type. Objects of the same type share the same value.
   */
  @optional
  string object;

}

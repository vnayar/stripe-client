// File automatically generated from OpenAPI spec.
module stripe.model.radar.value_list_item;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;


/**
 * Value list items allow you to add specific values to a given Radar value list, which can then
 * be used in rules.
 * Related guide: [Managing List Items](https://stripe.com/docs/radar/lists#managing-list-items).
 */
class RadarValueListItem {
  /**
   * Unique identifier for the object.
   */
  @optional
  Nullable!(string) id;

  /**
   * The name or email address of the user who added this item to the value list.
   */
  @optional
  Nullable!(string) created_by;

  /**
   * Has the value `true` if the object exists in live mode or the value `false` if the object
   * exists in test mode.
   */
  @optional
  Nullable!(bool) livemode;

  /**
   * String representing the object's type. Objects of the same type share the same value.
   */
  @optional
  Nullable!(string) object;

  /**
   * Time at which the object was created. Measured in seconds since the Unix epoch.
   */
  @optional
  Nullable!(long) created;

  /**
   * The value of the item.
   */
  @optional
  Nullable!(string) value;

  /**
   * The identifier of the value list this item belongs to.
   */
  @optional
  Nullable!(string) value_list;

}

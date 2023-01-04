// File automatically generated from OpenAPI spec.
module stripe.model.radar.value_list;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;

import stripe.model.radar.value_list_item : RadarValueListItem;

/**
 * Value lists allow you to group values together which can then be referenced in rules.
 * Related guide: [Default Stripe Lists](https://stripe.com/docs/radar/lists#managing-list-items).
 */
class RadarValueList {
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
   * The name or email address of the user who created this value list.
   */
  @optional
  string created_by;

  /**
   * The name of the value list.
   */
  @optional
  string name;

  /**
   * The type of items in the value list. One of `card_fingerprint`, `card_bin`, `email`,
   * `ip_address`, `country`, `string`, `case_sensitive_string`, or `customer_id`.
   */
  @optional
  string item_type;

  /**
   * The name of the value list for use in rules.
   */
  @optional
  string alias_;

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
  string object;

  /**
   * Time at which the object was created. Measured in seconds since the Unix epoch.
   */
  @optional
  Nullable!(long) created;

  static class RadarListListItemList {
    /**
     * True if this list has another page of items after this one that can be fetched.
     */
    @optional
    Nullable!(bool) has_more;

    /**
     * String representing the object's type. Objects of the same type share the same value. Always
     * has the value `list`.
     */
    @optional
    string object;

    /**
     * Details about each object.
     */
    @optional
    RadarValueListItem[] data;

    /**
     * The URL where this list can be accessed.
     */
    @optional
    string url;

  }

  /**
   * List of items contained within this value list.
   */
  @optional
  RadarListListItemList list_items;

}

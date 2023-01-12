// File automatically generated from OpenAPI spec.
module stripe.model.portal_customer_update;

import vibe.data.serialization : optional;
import vibe.data.json : Json;
import builder : AddBuilder;

import std.typecons : Nullable;


/**
 */
class PortalCustomerUpdate {
  /**
   * Whether the feature is enabled.
   */
  @optional
  Nullable!(bool) enabled;

  /**
   * The types of customer updates that are supported. When empty, customers are not updateable.
   */
  @optional
  string[] allowed_updates;

  mixin AddBuilder!(typeof(this));

}

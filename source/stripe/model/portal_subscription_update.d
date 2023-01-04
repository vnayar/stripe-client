// File automatically generated from OpenAPI spec.
module stripe.model.portal_subscription_update;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;

import stripe.model.portal_subscription_update_product : PortalSubscriptionUpdateProduct;

/**
 */
class PortalSubscriptionUpdate {
  /**
   * Whether the feature is enabled.
   */
  @optional
  Nullable!(bool) enabled;

  /**
   * Determines how to handle prorations resulting from subscription updates. Valid values are
   * `none`, `create_prorations`, and `always_invoice`.
   */
  @optional
  string proration_behavior;

  /**
   * The types of subscription updates that are supported for items listed in the `products`
   * attribute. When empty, subscriptions are not updateable.
   */
  @optional
  string[] default_allowed_updates;

  /**
   * The list of products that support subscription updates.
   */
  @optional
  PortalSubscriptionUpdateProduct[] products;

}

// File automatically generated from OpenAPI spec.
module stripe.model.portal_subscription_update_product;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;


/**
 */
class PortalSubscriptionUpdateProduct {
  /**
   * The product ID.
   */
  @optional
  Nullable!(string) product;

  /**
   * The list of price IDs which, when subscribed to, a subscription can be updated.
   */
  @optional
  Nullable!(string)[] prices;

}

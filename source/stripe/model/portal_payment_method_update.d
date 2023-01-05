// File automatically generated from OpenAPI spec.
module stripe.model.portal_payment_method_update;

import vibe.data.serialization : optional;
import vibe.data.json : Json;
import builder : AddBuilder;

import std.typecons : Nullable;


/**
 */
class PortalPaymentMethodUpdate {
  /**
   * Whether the feature is enabled.
   */
  @optional
  Nullable!(bool) enabled;

  mixin AddBuilder!(typeof(this));

}

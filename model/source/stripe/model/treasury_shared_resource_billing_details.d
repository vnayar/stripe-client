// File automatically generated from OpenAPI spec.
module stripe.model.treasury_shared_resource_billing_details;

import vibe.data.serialization : optional;
import vibe.data.json : Json;
import builder : AddBuilder;

import std.typecons : Nullable;

import stripe.model.address : Address;

/**
 */
class TreasurySharedResourceBillingDetails {
  /**
   * Email address.
   */
  @optional
  string email;

  @optional
  Address address;

  /**
   * Full name.
   */
  @optional
  string name;

  mixin AddBuilder!(typeof(this));

}

// File automatically generated from OpenAPI spec.
module stripe.model.billing_details;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;

import stripe.model.address : Address;

/**
 */
class BillingDetails {
  /**
   * Email address.
   */
  @optional
  Nullable!(string) email;

  /**
   * Billing phone number (including extension).
   */
  @optional
  Nullable!(string) phone;

  /**
   * Billing address.
   */
  @optional
  Address address;

  /**
   * Full name.
   */
  @optional
  Nullable!(string) name;

}

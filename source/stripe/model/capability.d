// File automatically generated from OpenAPI spec.
module stripe.model.capability;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;

import stripe.model.account : Account;
import stripe.model.account_capability_future_requirements : AccountCapabilityFutureRequirements;
import stripe.model.account_capability_requirements : AccountCapabilityRequirements;

/**
 * This is an object representing a capability for a Stripe account.
 * Related guide: [Account capabilities](https://stripe.com/docs/connect/account-capabilities).
 */
class Capability {
  /**
   * The identifier for the capability.
   */
  @optional
  string id;

  /**
   * Whether the capability has been requested.
   */
  @optional
  Nullable!(bool) requested;

  @optional
  AccountCapabilityRequirements requirements;

  /**
   * Time at which the capability was requested. Measured in seconds since the Unix epoch.
   */
  @optional
  Nullable!(long) requested_at;

  /**
   * String representing the object's type. Objects of the same type share the same value.
   */
  @optional
  string object;

  @optional
  AccountCapabilityFutureRequirements future_requirements;

  /**
   * The account for which the capability enables functionality.
   */
  @optional
  Json account;

  /**
   * The status of the capability. Can be `active`, `inactive`, `pending`, or `unrequested`.
   */
  @optional
  string status;

}

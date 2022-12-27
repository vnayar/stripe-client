// File automatically generated from OpenAPI spec.
module stripe.model.account_link;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;


/**
 * Account Links are the means by which a Connect platform grants a connected account permission
 * to access
 * Stripe-hosted applications, such as Connect Onboarding.
 * Related guide: [Connect Onboarding](https://stripe.com/docs/connect/connect-onboarding).
 */
class AccountLink {
  /**
   * Time at which the object was created. Measured in seconds since the Unix epoch.
   */
  @optional
  Nullable!(long) created;

  /**
   * The timestamp at which this account link will expire.
   */
  @optional
  Nullable!(long) expires_at;

  /**
   * String representing the object's type. Objects of the same type share the same value.
   */
  @optional
  Nullable!(string) object;

  /**
   * The URL for the account link.
   */
  @optional
  Nullable!(string) url;

}

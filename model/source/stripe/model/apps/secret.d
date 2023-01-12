// File automatically generated from OpenAPI spec.
module stripe.model.apps.secret;

import vibe.data.serialization : optional;
import vibe.data.json : Json;
import builder : AddBuilder;

import std.typecons : Nullable;

import stripe.model.secret_service_resource_scope : SecretServiceResourceScope;

/**
 * Secret Store is an API that allows Stripe Apps developers to securely persist secrets for use
 * by UI Extensions and app backends.
 * The primary resource in Secret Store is a `secret`. Other apps can't view secrets created by an
 * app. Additionally, secrets are scoped to provide further permission control.
 * All Dashboard users and the app backend share `account` scoped secrets. Use the `account` scope
 * for secrets that don't change per-user, like a third-party API key.
 * A `user` scoped secret is accessible by the app backend and one specific Dashboard user. Use
 * the `user` scope for per-user secrets like per-user OAuth tokens, where different users might
 * have different permissions.
 * Related guide: [Store data between page
 * reloads](https://stripe.com/docs/stripe-apps/store-auth-data-custom-objects).
 */
class AppsSecret {
  /**
   * The plaintext secret value to be stored.
   */
  @optional
  string payload;

  /**
   * The Unix timestamp for the expiry time of the secret, after which the secret deletes.
   */
  @optional
  Nullable!(long) expires_at;

  /**
   * Unique identifier for the object.
   */
  @optional
  string id;

  /**
   * A name for the secret that's unique within the scope.
   */
  @optional
  string name;

  @optional
  SecretServiceResourceScope scope_;

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

  /**
   * If true, indicates that this secret has been deleted
   */
  @optional
  Nullable!(bool) deleted;

  mixin AddBuilder!(typeof(this));

}

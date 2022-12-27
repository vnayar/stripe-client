// File automatically generated from OpenAPI spec.
module stripe.model.terminal.connection_token;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;


/**
 * A Connection Token is used by the Stripe Terminal SDK to connect to a reader.
 * Related guide: [Fleet Management](https://stripe.com/docs/terminal/fleet/locations).
 */
class TerminalConnectionToken {
  /**
   * The id of the location that this connection token is scoped to. Note that location scoping
   * only applies to internet-connected readers. For more details, see [the docs on scoping
   * connection tokens](https://stripe.com/docs/terminal/fleet/locations#connection-tokens).
   */
  @optional
  Nullable!(string) location;

  /**
   * Your application should pass this token to the Stripe Terminal SDK.
   */
  @optional
  Nullable!(string) secret;

  /**
   * String representing the object's type. Objects of the same type share the same value.
   */
  @optional
  Nullable!(string) object;

}

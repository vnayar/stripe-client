// File automatically generated from OpenAPI spec.
module stripe.model.file_link;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;

import stripe.model.file : File;

/**
 * To share the contents of a `File` object with non-Stripe users, you can
 * create a `FileLink`. `FileLink`s contain a URL that can be used to
 * retrieve the contents of the file without authentication.
 */
class FileLink {
  /**
   * Time at which the link expires.
   */
  @optional
  Nullable!(long) expires_at;

  /**
   * Unique identifier for the object.
   */
  @optional
  Nullable!(string) id;

  /**
   * Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an
   * object. This can be useful for storing additional information about the object in a
   * structured format.
   */
  @optional
  Nullable!(string)[string] metadata;

  /**
   * Whether this link is already expired.
   */
  @optional
  Nullable!(bool) expired;

  /**
   * The publicly accessible URL to download the file.
   */
  @optional
  Nullable!(string) url;

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
  Nullable!(string) object;

  /**
   * Time at which the object was created. Measured in seconds since the Unix epoch.
   */
  @optional
  Nullable!(long) created;

  /**
   * The file object this link points to.
   */
  @optional
  Json file;

}

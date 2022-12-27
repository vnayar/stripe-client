// File automatically generated from OpenAPI spec.
module stripe.model.file;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;

import stripe.model.file_link : FileLink;

/**
 * This is an object representing a file hosted on Stripe's servers. The
 * file may have been uploaded by yourself using the [create
 * file](https://stripe.com/docs/api#create_file)
 * request (for example, when uploading dispute evidence) or it may have
 * been created by Stripe (for example, the results of a [Sigma scheduled
 * query](#scheduled_queries)).
 * Related guide: [File Upload Guide](https://stripe.com/docs/file-upload).
 */
class File {
  /**
   * The time at which the file expires and is no longer available in epoch seconds.
   */
  @optional
  Nullable!(long) expires_at;

  /**
   * Unique identifier for the object.
   */
  @optional
  Nullable!(string) id;

  /**
   * A filename for the file, suitable for saving to a filesystem.
   */
  @optional
  Nullable!(string) filename;

  /**
   * A user friendly title for the document.
   */
  @optional
  Nullable!(string) title;

  /**
   * The URL from which the file can be downloaded using your live secret API key.
   */
  @optional
  Nullable!(string) url;

  /**
   * The size in bytes of the file object.
   */
  @optional
  Nullable!(int) size;

  static class FileFileLinkList {
    /**
     * True if this list has another page of items after this one that can be fetched.
     */
    @optional
    Nullable!(bool) has_more;

    /**
     * String representing the object's type. Objects of the same type share the same value. Always
     * has the value `list`.
     */
    @optional
    Nullable!(string) object;

    /**
     * Details about each object.
     */
    @optional
    FileLink[] data;

    /**
     * The URL where this list can be accessed.
     */
    @optional
    Nullable!(string) url;

  }

  /**
   * A list of [file links](https://stripe.com/docs/api#file_links) that point at this file.
   */
  @optional
  FileFileLinkList links;

  /**
   * String representing the object's type. Objects of the same type share the same value.
   */
  @optional
  Nullable!(string) object;

  /**
   * The type of the file returned (e.g., `csv`, `pdf`, `jpg`, or `png`).
   */
  @optional
  Nullable!(string) type;

  /**
   * Time at which the object was created. Measured in seconds since the Unix epoch.
   */
  @optional
  Nullable!(long) created;

  /**
   * The [purpose](https://stripe.com/docs/file-upload#uploading-a-file) of the uploaded file.
   */
  @optional
  Nullable!(string) purpose;

}

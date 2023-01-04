// File automatically generated from OpenAPI spec.
module stripe.model.email_sent;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;


/**
 */
class EmailSent {
  /**
   * The recipient's email address.
   */
  @optional
  string email_sent_to;

  /**
   * The timestamp when the email was sent.
   */
  @optional
  Nullable!(long) email_sent_at;

}

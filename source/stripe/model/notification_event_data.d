// File automatically generated from OpenAPI spec.
module stripe.model.notification_event_data;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;


/**
 */
class NotificationEventData {
  /**
   * Object containing the names of the attributes that have changed, and their previous values
   * (sent along only with *.updated events).
   */
  @optional
  Json previous_attributes;

  /**
   * Object containing the API resource relevant to the event. For example, an `invoice.created`
   * event will have a full [invoice object](https://stripe.com/docs/api#invoice_object) as the
   * value of the object key.
   */
  @optional
  Json object;

}

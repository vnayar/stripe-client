// File automatically generated from OpenAPI spec.
module stripe.model.notification_event_request;

import vibe.data.serialization : optional;
import vibe.data.json : Json;
import builder : AddBuilder;

import std.typecons : Nullable;


/**
 */
class NotificationEventRequest {
  /**
   * ID of the API request that caused the event. If null, the event was automatic (e.g., Stripe's
   * automatic subscription handling). Request logs are available in the
   * [dashboard](https://dashboard.stripe.com/logs), but currently not in the API.
   */
  @optional
  string id;

  /**
   * The idempotency key transmitted during the request, if any. *Note: This property is populated
   * only for events on or after May 23, 2017*.
   */
  @optional
  string idempotency_key;

  mixin AddBuilder!(typeof(this));

}

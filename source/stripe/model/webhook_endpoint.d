// File automatically generated from OpenAPI spec.
module stripe.model.webhook_endpoint;

import vibe.data.serialization : optional;
import vibe.data.json : Json;
import builder : AddBuilder;

import std.typecons : Nullable;


/**
 * You can configure [webhook endpoints](https://stripe.com/docs/webhooks/) via the API to be
 * notified about events that happen in your Stripe account or connected
 * accounts.
 * Most users configure webhooks from [the dashboard](https://dashboard.stripe.com/webhooks),
 * which provides a user interface for registering and testing your webhook endpoints.
 * Related guide: [Setting up Webhooks](https://stripe.com/docs/webhooks/configure).
 */
class WebhookEndpoint {
  /**
   * The endpoint's secret, used to generate [webhook
   * signatures](https://stripe.com/docs/webhooks/signatures). Only returned at creation.
   */
  @optional
  string secret;

  /**
   * Unique identifier for the object.
   */
  @optional
  string id;

  /**
   * Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an
   * object. This can be useful for storing additional information about the object in a
   * structured format.
   */
  @optional
  string[string] metadata;

  /**
   * The URL of the webhook endpoint.
   */
  @optional
  string url;

  /**
   * The ID of the associated Connect application.
   */
  @optional
  string application;

  /**
   * Has the value `true` if the object exists in live mode or the value `false` if the object
   * exists in test mode.
   */
  @optional
  Nullable!(bool) livemode;

  /**
   * The API version events are rendered as for this webhook endpoint.
   */
  @optional
  string api_version;

  /**
   * String representing the object's type. Objects of the same type share the same value.
   */
  @optional
  string object;

  /**
   * An optional description of what the webhook is used for.
   */
  @optional
  string description;

  /**
   * Time at which the object was created. Measured in seconds since the Unix epoch.
   */
  @optional
  Nullable!(long) created;

  /**
   * The list of events to enable for this endpoint. `['*']` indicates that all events are
   * enabled, except those that require explicit selection.
   */
  @optional
  string[] enabled_events;

  /**
   * The status of the webhook. It can be `enabled` or `disabled`.
   */
  @optional
  string status;

  mixin AddBuilder!(typeof(this));

}

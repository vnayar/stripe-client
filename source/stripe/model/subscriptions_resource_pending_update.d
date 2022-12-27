// File automatically generated from OpenAPI spec.
module stripe.model.subscriptions_resource_pending_update;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;

import stripe.model.subscription_item : SubscriptionItem;

/**
 * Pending Updates store the changes pending from a previous update that will be applied
 * to the Subscription upon successful payment.
 */
class SubscriptionsResourcePendingUpdate {
  /**
   * List of subscription items, each with an attached plan, that will be set if the update is
   * applied.
   */
  @optional
  SubscriptionItem[] subscription_items;

  /**
   * If the update is applied, determines the date of the first full invoice, and, for plans with
   * `month` or `year` intervals, the day of the month for subsequent invoices. The timestamp is
   * in UTC format.
   */
  @optional
  Nullable!(long) billing_cycle_anchor;

  /**
   * Unix timestamp representing the end of the trial period the customer will get before being
   * charged for the first time, if the update is applied.
   */
  @optional
  Nullable!(long) trial_end;

  /**
   * The point after which the changes reflected by this update will be discarded and no longer
   * applied.
   */
  @optional
  Nullable!(long) expires_at;

  /**
   * Indicates if a plan's `trial_period_days` should be applied to the subscription. Setting
   * `trial_end` per subscription is preferred, and this defaults to `false`. Setting this flag to
   * `true` together with `trial_end` is not allowed. See [Using trial periods on
   * subscriptions](https://stripe.com/docs/billing/subscriptions/trials) to learn more.
   */
  @optional
  Nullable!(bool) trial_from_plan;

}

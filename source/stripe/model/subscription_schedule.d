// File automatically generated from OpenAPI spec.
module stripe.model.subscription_schedule;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;

import stripe.model.application : Application;
import stripe.model.customer : Customer;
import stripe.model.deleted_application : DeletedApplication;
import stripe.model.deleted_customer : DeletedCustomer;
import stripe.model.subscription : Subscription;
import stripe.model.subscription_schedule_current_phase : SubscriptionScheduleCurrentPhase;
import stripe.model.subscription_schedule_phase_configuration : SubscriptionSchedulePhaseConfiguration;
import stripe.model.subscription_schedules_resource_default_settings : SubscriptionSchedulesResourceDefaultSettings;
import stripe.model.test_helpers.test_clock : TestHelpersTestClock;

/**
 * A subscription schedule allows you to create and manage the lifecycle of a subscription by
 * predefining expected changes.
 * Related guide: [Subscription
 * Schedules](https://stripe.com/docs/billing/subscriptions/subscription-schedules).
 */
class SubscriptionSchedule {
  /**
   * Time at which the subscription schedule was completed. Measured in seconds since the Unix
   * epoch.
   */
  @optional
  Nullable!(long) completed_at;

  /**
   * Configuration for the subscription schedule's phases.
   */
  @optional
  SubscriptionSchedulePhaseConfiguration[] phases;

  /**
   * Time at which the subscription schedule was released. Measured in seconds since the Unix
   * epoch.
   */
  @optional
  Nullable!(long) released_at;

  /**
   * Behavior of the subscription schedule and underlying subscription when it ends. Possible
   * values are `release` and `cancel`.
   */
  @optional
  Nullable!(string) end_behavior;

  /**
   * Unique identifier for the object.
   */
  @optional
  Nullable!(string) id;

  @optional
  SubscriptionSchedulesResourceDefaultSettings default_settings;

  /**
   * ID of the customer who owns the subscription schedule.
   */
  @optional
  Json customer;

  /**
   * Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an
   * object. This can be useful for storing additional information about the object in a
   * structured format.
   */
  @optional
  Nullable!(string)[string] metadata;

  /**
   * Time at which the subscription schedule was canceled. Measured in seconds since the Unix
   * epoch.
   */
  @optional
  Nullable!(long) canceled_at;

  /**
   * ID of the subscription managed by the subscription schedule.
   */
  @optional
  Json subscription;

  /**
   * Object representing the start and end dates for the current phase of the subscription
   * schedule, if it is `active`.
   */
  @optional
  SubscriptionScheduleCurrentPhase current_phase;

  /**
   * ID of the Connect Application that created the schedule.
   */
  @optional
  Json application;

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
   * ID of the test clock this subscription schedule belongs to.
   */
  @optional
  Json test_clock;

  /**
   * Time at which the object was created. Measured in seconds since the Unix epoch.
   */
  @optional
  Nullable!(long) created;

  /**
   * The present status of the subscription schedule. Possible values are `not_started`, `active`,
   * `completed`, `released`, and `canceled`. You can read more about the different states in our
   * [behavior guide](https://stripe.com/docs/billing/subscriptions/subscription-schedules).
   */
  @optional
  Nullable!(string) status;

  /**
   * ID of the subscription once managed by the subscription schedule (if it is released).
   */
  @optional
  Nullable!(string) released_subscription;

}

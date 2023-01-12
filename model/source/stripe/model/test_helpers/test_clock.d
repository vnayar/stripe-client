// File automatically generated from OpenAPI spec.
module stripe.model.test_helpers.test_clock;

import vibe.data.serialization : optional;
import vibe.data.json : Json;
import builder : AddBuilder;

import std.typecons : Nullable;


/**
 * A test clock enables deterministic control over objects in testmode. With a test clock, you can
 * create
 * objects at a frozen time in the past or future, and advance to a specific future time to
 * observe webhooks and state changes. After the clock advances,
 * you can either validate the current state of your scenario (and test your assumptions), change
 * the current state of your scenario (and test more complex scenarios), or keep advancing forward
 * in time.
 */
class TestHelpersTestClock {
  /**
   * Unique identifier for the object.
   */
  @optional
  string id;

  /**
   * Time at which all objects belonging to this clock are frozen.
   */
  @optional
  Nullable!(long) frozen_time;

  /**
   * The custom name supplied at creation.
   */
  @optional
  string name;

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
   * Time at which this clock is scheduled to auto delete.
   */
  @optional
  Nullable!(long) deletes_after;

  /**
   * The status of the Test Clock.
   */
  @optional
  string status;

  mixin AddBuilder!(typeof(this));

}

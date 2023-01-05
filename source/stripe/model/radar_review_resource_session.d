// File automatically generated from OpenAPI spec.
module stripe.model.radar_review_resource_session;

import vibe.data.serialization : optional;
import vibe.data.json : Json;
import builder : AddBuilder;

import std.typecons : Nullable;


/**
 */
class RadarReviewResourceSession {
  /**
   * The platform for the browser session (e.g., `Macintosh`).
   */
  @optional
  string platform;

  /**
   * The version for the browser session (e.g., `61.0.3163.100`).
   */
  @optional
  string version_;

  /**
   * Information about the device used for the browser session (e.g., `Samsung SM-G930T`).
   */
  @optional
  string device;

  /**
   * The browser used in this browser session (e.g., `Chrome`).
   */
  @optional
  string browser;

  mixin AddBuilder!(typeof(this));

}

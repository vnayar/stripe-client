// File automatically generated from OpenAPI spec.
module stripe.model.radar_radar_options;

import vibe.data.serialization : optional;
import vibe.data.json : Json;
import builder : AddBuilder;

import std.typecons : Nullable;


/**
 * Options to configure Radar. See [Radar Session](https://stripe.com/docs/radar/radar-session)
 * for more information.
 */
class RadarRadarOptions {
  /**
   * A [Radar Session](https://stripe.com/docs/radar/radar-session) is a snapshot of the browser
   * metadata and device details that help Radar make more accurate predictions on your payments.
   */
  @optional
  string session;

  mixin AddBuilder!(typeof(this));

}

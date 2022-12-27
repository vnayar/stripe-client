// File automatically generated from OpenAPI spec.
module stripe.model.account_dashboard_settings;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;


/**
 */
class AccountDashboardSettings {
  /**
   * The display name for this account. This is used on the Stripe Dashboard to differentiate
   * between accounts.
   */
  @optional
  Nullable!(string) display_name;

  /**
   * The timezone used in the Stripe Dashboard for this account. A list of possible time zone
   * values is maintained at the [IANA Time Zone Database](http://www.iana.org/time-zones).
   */
  @optional
  Nullable!(string) timezone;

}

// File automatically generated from OpenAPI spec.
module stripe.model.bank_connections_resource_balance_refresh;

import vibe.data.serialization : optional;
import vibe.data.json : Json;
import builder : AddBuilder;

import std.typecons : Nullable;


/**
 */
class BankConnectionsResourceBalanceRefresh {
  /**
   * The status of the last refresh attempt.
   */
  @optional
  string status;

  /**
   * The time at which the last refresh attempt was initiated. Measured in seconds since the Unix
   * epoch.
   */
  @optional
  Nullable!(long) last_attempted_at;

  mixin AddBuilder!(typeof(this));

}

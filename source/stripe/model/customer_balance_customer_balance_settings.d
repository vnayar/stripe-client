// File automatically generated from OpenAPI spec.
module stripe.model.customer_balance_customer_balance_settings;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;


/**
 */
class CustomerBalanceCustomerBalanceSettings {
  /**
   * The configuration for how funds that land in the customer cash balance are reconciled.
   */
  @optional
  Nullable!(string) reconciliation_mode;

}

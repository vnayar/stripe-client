// File automatically generated from OpenAPI spec.
module stripe.model.bank_connections_resource_link_account_session_filters;

import vibe.data.serialization : optional;
import vibe.data.json : Json;
import builder : AddBuilder;

import std.typecons : Nullable;


/**
 */
class BankConnectionsResourceLinkAccountSessionFilters {
  /**
   * List of countries from which to filter accounts.
   */
  @optional
  string[] countries;

  mixin AddBuilder!(typeof(this));

}

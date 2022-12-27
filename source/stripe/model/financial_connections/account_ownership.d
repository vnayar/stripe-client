// File automatically generated from OpenAPI spec.
module stripe.model.financial_connections.account_ownership;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;

import stripe.model.financial_connections.account_owner : FinancialConnectionsAccountOwner;

/**
 * Describes a snapshot of the owners of an account at a particular point in time.
 */
class FinancialConnectionsAccountOwnership {
  /**
   * Time at which the object was created. Measured in seconds since the Unix epoch.
   */
  @optional
  Nullable!(long) created;

  /**
   * Unique identifier for the object.
   */
  @optional
  Nullable!(string) id;

  /**
   * String representing the object's type. Objects of the same type share the same value.
   */
  @optional
  Nullable!(string) object;

  static class BankConnectionsResourceOwnerList {
    /**
     * True if this list has another page of items after this one that can be fetched.
     */
    @optional
    Nullable!(bool) has_more;

    /**
     * String representing the object's type. Objects of the same type share the same value. Always
     * has the value `list`.
     */
    @optional
    Nullable!(string) object;

    /**
     * Details about each object.
     */
    @optional
    FinancialConnectionsAccountOwner[] data;

    /**
     * The URL where this list can be accessed.
     */
    @optional
    Nullable!(string) url;

  }

  /**
   * A paginated list of owners for this account.
   */
  @optional
  BankConnectionsResourceOwnerList owners;

}

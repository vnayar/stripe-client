// File automatically generated from OpenAPI spec.
module stripe.model.financial_connections.account_owner;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;


/**
 */
class FinancialConnectionsAccountOwner {
  /**
   * The email address of the owner.
   */
  @optional
  Nullable!(string) email;

  /**
   * The raw physical address of the owner.
   */
  @optional
  Nullable!(string) raw_address;

  /**
   * Unique identifier for the object.
   */
  @optional
  Nullable!(string) id;

  /**
   * The timestamp of the refresh that updated this owner.
   */
  @optional
  Nullable!(long) refreshed_at;

  /**
   * The full name of the owner.
   */
  @optional
  Nullable!(string) name;

  /**
   * The raw phone number of the owner.
   */
  @optional
  Nullable!(string) phone;

  /**
   * String representing the object's type. Objects of the same type share the same value.
   */
  @optional
  Nullable!(string) object;

  /**
   * The ownership object that this owner belongs to.
   */
  @optional
  Nullable!(string) ownership;

}

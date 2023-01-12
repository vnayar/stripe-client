// File automatically generated from OpenAPI spec.
module stripe.model.deleted_bank_account;

import vibe.data.serialization : optional;
import vibe.data.json : Json;
import builder : AddBuilder;

import std.typecons : Nullable;


/**
 */
class DeletedBankAccount {
  /**
   * Unique identifier for the object.
   */
  @optional
  string id;

  /**
   * Three-letter [ISO code for the currency](https://stripe.com/docs/payouts) paid out to the
   * bank account.
   */
  @optional
  string currency;

  /**
   * String representing the object's type. Objects of the same type share the same value.
   */
  @optional
  string object;

  /**
   * Always true for a deleted object
   */
  @optional
  Nullable!(bool) deleted;

  mixin AddBuilder!(typeof(this));

}

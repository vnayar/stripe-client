// File automatically generated from OpenAPI spec.
module stripe.model.platform_tax_fee;

import vibe.data.serialization : optional;
import vibe.data.json : Json;
import builder : AddBuilder;

import std.typecons : Nullable;


/**
 */
class PlatformTaxFee {
  /**
   * The type of tax (VAT).
   */
  @optional
  string type;

  /**
   * The payment object that caused this tax to be inflicted.
   */
  @optional
  string source_transaction;

  /**
   * The Connected account that incurred this charge.
   */
  @optional
  string account;

  /**
   * Unique identifier for the object.
   */
  @optional
  string id;

  /**
   * String representing the object's type. Objects of the same type share the same value.
   */
  @optional
  string object;

  mixin AddBuilder!(typeof(this));

}

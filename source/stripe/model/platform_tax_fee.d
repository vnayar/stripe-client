// File automatically generated from OpenAPI spec.
module stripe.model.platform_tax_fee;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;


/**
 */
class PlatformTaxFee {
  /**
   * The type of tax (VAT).
   */
  @optional
  Nullable!(string) type;

  /**
   * The payment object that caused this tax to be inflicted.
   */
  @optional
  Nullable!(string) source_transaction;

  /**
   * The Connected account that incurred this charge.
   */
  @optional
  Nullable!(string) account;

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

}

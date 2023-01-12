// File automatically generated from OpenAPI spec.
module stripe.model.tax_code;

import vibe.data.serialization : optional;
import vibe.data.json : Json;
import builder : AddBuilder;

import std.typecons : Nullable;


/**
 * [Tax codes](https://stripe.com/docs/tax/tax-categories) classify goods and services for tax
 * purposes.
 */
class TaxCode {
  /**
   * A detailed description of which types of products the tax code represents.
   */
  @optional
  string description;

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

  /**
   * A short name for the tax code.
   */
  @optional
  string name;

  mixin AddBuilder!(typeof(this));

}

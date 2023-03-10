// File automatically generated from OpenAPI spec.
module stripe.model.customer_tax_location;

import vibe.data.serialization : optional;
import vibe.data.json : Json;
import builder : AddBuilder;

import std.typecons : Nullable;


/**
 */
class CustomerTaxLocation {
  /**
   * The customer's country as identified by Stripe Tax.
   */
  @optional
  string country;

  /**
   * The data source used to infer the customer's location.
   */
  @optional
  string source;

  /**
   * The customer's state, county, province, or region as identified by Stripe Tax.
   */
  @optional
  string state;

  mixin AddBuilder!(typeof(this));

}

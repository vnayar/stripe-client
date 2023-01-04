// File automatically generated from OpenAPI spec.
module stripe.model.customer_tax;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;

import stripe.model.customer_tax_location : CustomerTaxLocation;

/**
 */
class CustomerTax {
  /**
   * The customer's location as identified by Stripe Tax.
   */
  @optional
  CustomerTaxLocation location;

  /**
   * Surfaces if automatic tax computation is possible given the current customer location
   * information.
   */
  @optional
  string automatic_tax;

  /**
   * A recent IP address of the customer used for tax reporting and tax location inference.
   */
  @optional
  string ip_address;

}

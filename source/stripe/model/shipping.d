// File automatically generated from OpenAPI spec.
module stripe.model.shipping;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;

import stripe.model.address : Address;

/**
 */
class Shipping {
  /**
   * Recipient phone (including extension).
   */
  @optional
  string phone;

  /**
   * The delivery service that shipped a physical product, such as Fedex, UPS, USPS, etc.
   */
  @optional
  string carrier;

  @optional
  Address address;

  /**
   * The tracking number for a physical product, obtained from the delivery service. If multiple
   * tracking numbers were generated for this purchase, please separate them with commas.
   */
  @optional
  string tracking_number;

  /**
   * Recipient name.
   */
  @optional
  string name;

}

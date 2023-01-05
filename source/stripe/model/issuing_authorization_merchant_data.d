// File automatically generated from OpenAPI spec.
module stripe.model.issuing_authorization_merchant_data;

import vibe.data.serialization : optional;
import vibe.data.json : Json;
import builder : AddBuilder;

import std.typecons : Nullable;


/**
 */
class IssuingAuthorizationMerchantData {
  /**
   * Identifier assigned to the seller by the card network. Different card networks may assign
   * different network_id fields to the same merchant.
   */
  @optional
  string network_id;

  /**
   * Country where the seller is located
   */
  @optional
  string country;

  /**
   * State where the seller is located
   */
  @optional
  string state;

  /**
   * The merchant category code for the seller’s business
   */
  @optional
  string category_code;

  /**
   * Name of the seller
   */
  @optional
  string name;

  /**
   * A categorization of the seller's type of business. See our [merchant categories
   * guide](https://stripe.com/docs/issuing/merchant-categories) for a list of possible values.
   */
  @optional
  string category;

  /**
   * Postal code where the seller is located
   */
  @optional
  string postal_code;

  /**
   * City where the seller is located
   */
  @optional
  string city;

  mixin AddBuilder!(typeof(this));

}

// File automatically generated from OpenAPI spec.
module stripe.model.account_business_profile;

import vibe.data.serialization : optional;
import vibe.data.json : Json;
import builder : AddBuilder;

import std.typecons : Nullable;

import stripe.model.address : Address;

/**
 */
class AccountBusinessProfile {
  /**
   * [The merchant category code for the account](https://stripe.com/docs/connect/setting-mcc).
   * MCCs are used to classify businesses based on the goods or services they provide.
   */
  @optional
  string mcc;

  /**
   * Internal-only description of the product sold or service provided by the business. It's used
   * by Stripe for risk and underwriting purposes.
   */
  @optional
  string product_description;

  /**
   * A publicly available mailing address for sending support issues to.
   */
  @optional
  Address support_address;

  /**
   * A publicly available website for handling support issues.
   */
  @optional
  string support_url;

  /**
   * The business's publicly available website.
   */
  @optional
  string url;

  /**
   * The customer-facing business name.
   */
  @optional
  string name;

  /**
   * A publicly available email address for sending support issues to.
   */
  @optional
  string support_email;

  /**
   * A publicly available phone number to call with support issues.
   */
  @optional
  string support_phone;

  mixin AddBuilder!(typeof(this));

}

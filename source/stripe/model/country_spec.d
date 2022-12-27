// File automatically generated from OpenAPI spec.
module stripe.model.country_spec;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;

import stripe.model.country_spec_verification_fields : CountrySpecVerificationFields;

/**
 * Stripe needs to collect certain pieces of information about each account
 * created. These requirements can differ depending on the account's country. The
 * Country Specs API makes these rules available to your integration.
 * You can also view the information from this API call as [an online
 * guide](/docs/connect/required-verification-information).
 */
class CountrySpec {
  /**
   * The default currency for this country. This applies to both payment methods and bank
   * accounts.
   */
  @optional
  Nullable!(string) default_currency;

  /**
   * Countries that can accept transfers from the specified country.
   */
  @optional
  Nullable!(string)[] supported_transfer_countries;

  /**
   * Unique identifier for the object. Represented as the ISO country code for this country.
   */
  @optional
  Nullable!(string) id;

  /**
   * Currencies that can be accepted in the specified country (for payments).
   */
  @optional
  Nullable!(string)[] supported_payment_currencies;

  @optional
  CountrySpecVerificationFields verification_fields;

  /**
   * Payment methods available in the specified country. You may need to enable some payment
   * methods (e.g., [ACH](https://stripe.com/docs/ach)) on your account before they appear in this
   * list. The `stripe` payment method refers to [charging through your
   * platform](https://stripe.com/docs/connect/destination-charges).
   */
  @optional
  Nullable!(string)[] supported_payment_methods;

  /**
   * String representing the object's type. Objects of the same type share the same value.
   */
  @optional
  Nullable!(string) object;

  /**
   * Currencies that can be accepted in the specific country (for transfers).
   */
  @optional
  Nullable!(string)[][string] supported_bank_account_currencies;

}

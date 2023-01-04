// File automatically generated from OpenAPI spec.
module stripe.model.issuing.cardholder;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;

import stripe.model.issuing_cardholder_address : IssuingCardholderAddress;
import stripe.model.issuing_cardholder_authorization_controls : IssuingCardholderAuthorizationControls;
import stripe.model.issuing_cardholder_company : IssuingCardholderCompany;
import stripe.model.issuing_cardholder_individual : IssuingCardholderIndividual;
import stripe.model.issuing_cardholder_requirements : IssuingCardholderRequirements;

/**
 * An Issuing `Cardholder` object represents an individual or business entity who is
 * [issued](https://stripe.com/docs/issuing) cards.
 * Related guide: [How to create a
 * Cardholder](https://stripe.com/docs/issuing/cards#create-cardholder)
 */
class IssuingCardholder {
  /**
   * The cardholder's email address.
   */
  @optional
  string email;

  /**
   * Rules that control spending across this cardholder's cards. Refer to our
   * [documentation](https://stripe.com/docs/issuing/controls/spending-controls) for more details.
   */
  @optional
  IssuingCardholderAuthorizationControls spending_controls;

  /**
   * Unique identifier for the object.
   */
  @optional
  string id;

  /**
   * Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an
   * object. This can be useful for storing additional information about the object in a
   * structured format.
   */
  @optional
  string[string] metadata;

  /**
   * Additional information about a `company` cardholder.
   */
  @optional
  IssuingCardholderCompany company;

  /**
   * The cardholder's name. This will be printed on cards issued to them.
   */
  @optional
  string name;

  /**
   * Has the value `true` if the object exists in live mode or the value `false` if the object
   * exists in test mode.
   */
  @optional
  Nullable!(bool) livemode;

  @optional
  IssuingCardholderRequirements requirements;

  /**
   * String representing the object's type. Objects of the same type share the same value.
   */
  @optional
  string object;

  @optional
  IssuingCardholderAddress billing;

  /**
   * Additional information about an `individual` cardholder.
   */
  @optional
  IssuingCardholderIndividual individual;

  /**
   * The cardholder's phone number. This is required for all cardholders who will be creating EU
   * cards. See the [3D Secure
   * documentation](https://stripe.com/docs/issuing/3d-secure#when-is-3d-secure-applied) for more
   * details.
   */
  @optional
  string phone_number;

  /**
   * Time at which the object was created. Measured in seconds since the Unix epoch.
   */
  @optional
  Nullable!(long) created;

  /**
   * One of `individual` or `company`.
   */
  @optional
  string type;

  /**
   * Specifies whether to permit authorizations on this cardholder's cards.
   */
  @optional
  string status;

}

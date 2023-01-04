// File automatically generated from OpenAPI spec.
module stripe.model.issuing_cardholder_individual;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;

import stripe.model.issuing_cardholder_individual_dob : IssuingCardholderIndividualDob;
import stripe.model.issuing_cardholder_verification : IssuingCardholderVerification;

/**
 */
class IssuingCardholderIndividual {
  /**
   * The date of birth of this cardholder.
   */
  @optional
  IssuingCardholderIndividualDob dob;

  /**
   * The first name of this cardholder.
   */
  @optional
  string first_name;

  /**
   * The last name of this cardholder.
   */
  @optional
  string last_name;

  /**
   * Government-issued ID document for this cardholder.
   */
  @optional
  IssuingCardholderVerification verification;

}

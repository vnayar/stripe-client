// File automatically generated from OpenAPI spec.
module stripe.model.person;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;

import stripe.model.address : Address;
import stripe.model.legal_entity_dob : LegalEntityDob;
import stripe.model.legal_entity_japan_address : LegalEntityJapanAddress;
import stripe.model.legal_entity_person_verification : LegalEntityPersonVerification;
import stripe.model.person_future_requirements : PersonFutureRequirements;
import stripe.model.person_relationship : PersonRelationship;
import stripe.model.person_requirements : PersonRequirements;

/**
 * This is an object representing a person associated with a Stripe account.
 * A platform cannot access a Standard or Express account's persons after the account starts
 * onboarding, such as after generating an account link for the account.
 * See the [Standard onboarding](https://stripe.com/docs/connect/standard-accounts) or [Express
 * onboarding documentation](https://stripe.com/docs/connect/express-accounts) for information
 * about platform pre-filling and account onboarding steps.
 * Related guide: [Handling Identity Verification with the
 * API](https://stripe.com/docs/connect/identity-verification-api#person-information).
 */
class Person {
  /**
   * The person's email address.
   */
  @optional
  string email;

  /**
   * Unique identifier for the object.
   */
  @optional
  string id;

  /**
   * The person's last name.
   */
  @optional
  string last_name;

  @optional
  LegalEntityPersonVerification verification;

  @optional
  PersonRequirements requirements;

  @optional
  Address address;

  /**
   * Whether the last four digits of the person's Social Security number have been provided (U.S.
   * only).
   */
  @optional
  Nullable!(bool) ssn_last_4_provided;

  /**
   * Time at which the object was created. Measured in seconds since the Unix epoch.
   */
  @optional
  Nullable!(long) created;

  @optional
  Address registered_address;

  /**
   * A list of alternate names or aliases that the person is known by.
   */
  @optional
  string[] full_name_aliases;

  /**
   * The person's first name.
   */
  @optional
  string first_name;

  /**
   * Indicates if the person or any of their representatives, family members, or other closely
   * related persons, declares that they hold or have held an important public job or function, in
   * any jurisdiction.
   */
  @optional
  string political_exposure;

  /**
   * The person's maiden name.
   */
  @optional
  string maiden_name;

  /**
   * The person's phone number.
   */
  @optional
  string phone;

  /**
   * The person's gender (International regulations require either "male" or "female").
   */
  @optional
  string gender;

  /**
   * Whether the person's `id_number` was provided.
   */
  @optional
  Nullable!(bool) id_number_provided;

  @optional
  LegalEntityDob dob;

  /**
   * The Kanji variation of the person's last name (Japan only).
   */
  @optional
  string last_name_kanji;

  /**
   * Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an
   * object. This can be useful for storing additional information about the object in a
   * structured format.
   */
  @optional
  string[string] metadata;

  /**
   * The Kana variation of the person's last name (Japan only).
   */
  @optional
  string last_name_kana;

  /**
   * The Kana variation of the person's first name (Japan only).
   */
  @optional
  string first_name_kana;

  @optional
  PersonFutureRequirements future_requirements;

  @optional
  PersonRelationship relationship;

  @optional
  LegalEntityJapanAddress address_kana;

  /**
   * The country where the person is a national.
   */
  @optional
  string nationality;

  /**
   * The Kanji variation of the person's first name (Japan only).
   */
  @optional
  string first_name_kanji;

  /**
   * Whether the person's `id_number_secondary` was provided.
   */
  @optional
  Nullable!(bool) id_number_secondary_provided;

  /**
   * String representing the object's type. Objects of the same type share the same value.
   */
  @optional
  string object;

  /**
   * The account the person is associated with.
   */
  @optional
  string account;

  @optional
  LegalEntityJapanAddress address_kanji;

}

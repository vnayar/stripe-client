// File automatically generated from OpenAPI spec.
module stripe.model.person_relationship;

import vibe.data.serialization : optional;
import vibe.data.json : Json;
import builder : AddBuilder;

import std.typecons : Nullable;


/**
 */
class PersonRelationship {
  /**
   * Whether the person has significant responsibility to control, manage, or direct the
   * organization.
   */
  @optional
  Nullable!(bool) executive;

  /**
   * Whether the person is an owner of the account’s legal entity.
   */
  @optional
  Nullable!(bool) owner;

  /**
   * Whether the person is a director of the account's legal entity. Directors are typically
   * members of the governing board of the company, or responsible for ensuring the company meets
   * its regulatory obligations.
   */
  @optional
  Nullable!(bool) director;

  /**
   * Whether the person is authorized as the primary representative of the account. This is the
   * person nominated by the business to provide information about themselves, and general
   * information about the account. There can only be one representative at any given time. At the
   * time the account is created, this person should be set to the person responsible for opening
   * the account.
   */
  @optional
  Nullable!(bool) representative;

  /**
   * The percent owned by the person of the account's legal entity.
   */
  @optional
  Nullable!(float) percent_ownership;

  /**
   * The person's title (e.g., CEO, Support Engineer).
   */
  @optional
  string title;

  mixin AddBuilder!(typeof(this));

}

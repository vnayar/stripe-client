// File automatically generated from OpenAPI spec.
module stripe.model.legal_entity_company;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;

import stripe.model.address : Address;
import stripe.model.legal_entity_company_verification : LegalEntityCompanyVerification;
import stripe.model.legal_entity_japan_address : LegalEntityJapanAddress;
import stripe.model.legal_entity_ubo_declaration : LegalEntityUboDeclaration;

/**
 */
class LegalEntityCompany {
  /**
   * The jurisdiction in which the `tax_id` is registered (Germany-based companies only).
   */
  @optional
  string tax_id_registrar;

  /**
   * The category identifying the legal structure of the company or legal entity. See [Business
   * structure](https://stripe.com/docs/connect/identity-verification#business-structure) for more
   * details.
   */
  @optional
  string structure;

  /**
   * The Kana variation of the company's primary address (Japan only).
   */
  @optional
  LegalEntityJapanAddress address_kana;

  /**
   * Whether the company's directors have been provided. This Boolean will be `true` if you've
   * manually indicated that all directors are provided via [the `directors_provided`
   * parameter](https://stripe.com/docs/api/accounts/update#update_account-company-directors_provi
   * ded).
   */
  @optional
  Nullable!(bool) directors_provided;

  /**
   * Whether the company's business VAT number was provided.
   */
  @optional
  Nullable!(bool) vat_id_provided;

  /**
   * Information on the verification state of the company.
   */
  @optional
  LegalEntityCompanyVerification verification;

  /**
   * The company's legal name.
   */
  @optional
  string name;

  /**
   * The company's phone number (used for verification).
   */
  @optional
  string phone;

  /**
   * Whether the company's business ID number was provided.
   */
  @optional
  Nullable!(bool) tax_id_provided;

  /**
   * The Kana variation of the company's legal name (Japan only).
   */
  @optional
  string name_kana;

  @optional
  Address address;

  /**
   * Whether the company's executives have been provided. This Boolean will be `true` if you've
   * manually indicated that all executives are provided via [the `executives_provided`
   * parameter](https://stripe.com/docs/api/accounts/update#update_account-company-executives_prov
   * ided), or if Stripe determined that sufficient executives were provided.
   */
  @optional
  Nullable!(bool) executives_provided;

  /**
   * Whether the company's owners have been provided. This Boolean will be `true` if you've
   * manually indicated that all owners are provided via [the `owners_provided`
   * parameter](https://stripe.com/docs/api/accounts/update#update_account-company-owners_provided
   * ), or if Stripe determined that sufficient owners were provided. Stripe determines ownership
   * requirements using both the number of owners provided and their total percent ownership
   * (calculated by adding the `percent_ownership` of each owner together).
   */
  @optional
  Nullable!(bool) owners_provided;

  /**
   * This hash is used to attest that the beneficial owner information provided to Stripe is both
   * current and correct.
   */
  @optional
  LegalEntityUboDeclaration ownership_declaration;

  /**
   * The Kanji variation of the company's primary address (Japan only).
   */
  @optional
  LegalEntityJapanAddress address_kanji;

  /**
   * The Kanji variation of the company's legal name (Japan only).
   */
  @optional
  string name_kanji;

}

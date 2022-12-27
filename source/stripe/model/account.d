// File automatically generated from OpenAPI spec.
module stripe.model.account;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;

import stripe.model.account_business_profile : AccountBusinessProfile;
import stripe.model.account_capabilities : AccountCapabilities;
import stripe.model.account_future_requirements : AccountFutureRequirements;
import stripe.model.account_requirements : AccountRequirements;
import stripe.model.account_settings : AccountSettings;
import stripe.model.account_tos_acceptance : AccountTosAcceptance;
import stripe.model.account_unification_account_controller : AccountUnificationAccountController;
import stripe.model.bank_account : BankAccount;
import stripe.model.card : Card;
import stripe.model.legal_entity_company : LegalEntityCompany;
import stripe.model.person : Person;

/**
 * This is an object representing a Stripe account. You can retrieve it to see
 * properties on the account like its current e-mail address or if the account is
 * enabled yet to make live charges.
 * Some properties, marked below, are available only to platforms that want to
 * [create and manage Express or Custom accounts](https://stripe.com/docs/connect/accounts).
 */
class Account {
  /**
   * An email address associated with the account. You can treat this as metadata: it is not used
   * for authentication or messaging account holders.
   */
  @optional
  Nullable!(string) email;

  /**
   * Three-letter ISO currency code representing the default currency for the account. This must
   * be a currency that [Stripe supports in the account's
   * country](https://stripe.com/docs/payouts).
   */
  @optional
  Nullable!(string) default_currency;

  /**
   * The account's country.
   */
  @optional
  Nullable!(string) country;

  /**
   * Unique identifier for the object.
   */
  @optional
  Nullable!(string) id;

  /**
   * Whether Stripe can send payouts to this account.
   */
  @optional
  Nullable!(bool) payouts_enabled;

  /**
   * Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an
   * object. This can be useful for storing additional information about the object in a
   * structured format.
   */
  @optional
  Nullable!(string)[string] metadata;

  /**
   * Business information about the account.
   */
  @optional
  AccountBusinessProfile business_profile;

  @optional
  AccountCapabilities capabilities;

  @optional
  LegalEntityCompany company;

  @optional
  AccountUnificationAccountController controller;

  /**
   * Options for customizing how the account functions within Stripe.
   */
  @optional
  AccountSettings settings;

  @optional
  AccountRequirements requirements;

  /**
   * Whether account details have been submitted. Standard accounts cannot receive payouts before
   * this is true.
   */
  @optional
  Nullable!(bool) details_submitted;

  /**
   * String representing the object's type. Objects of the same type share the same value.
   */
  @optional
  Nullable!(string) object;

  /**
   * The business type.
   */
  @optional
  Nullable!(string) business_type;

  @optional
  Person individual;

  /**
   * The Stripe account type. Can be `standard`, `express`, or `custom`.
   */
  @optional
  Nullable!(string) type;

  /**
   * Time at which the account was connected. Measured in seconds since the Unix epoch.
   */
  @optional
  Nullable!(long) created;

  @optional
  AccountFutureRequirements future_requirements;

  @optional
  AccountTosAcceptance tos_acceptance;

  static class ExternalAccountList {
    /**
     * True if this list has another page of items after this one that can be fetched.
     */
    @optional
    Nullable!(bool) has_more;

    /**
     * String representing the object's type. Objects of the same type share the same value. Always
     * has the value `list`.
     */
    @optional
    Nullable!(string) object;

    /**
     * The list contains all external accounts that have been attached to the Stripe account. These
     * may be bank accounts or cards.
     */
    @optional
    Json[] data;

    /**
     * The URL where this list can be accessed.
     */
    @optional
    Nullable!(string) url;

  }

  /**
   * External accounts (bank accounts and debit cards) currently attached to this account
   */
  @optional
  ExternalAccountList external_accounts;

  /**
   * Whether the account can create live charges.
   */
  @optional
  Nullable!(bool) charges_enabled;

}

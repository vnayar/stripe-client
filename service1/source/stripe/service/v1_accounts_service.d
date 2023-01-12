// File automatically generated from OpenAPI spec.
module stripe.service.v1_accounts_service;

import vibe.http.client : requestHTTP, HTTPClientRequest, HTTPClientResponse;
import vibe.http.common : HTTPMethod;
import vibe.stream.operations : readAllUTF8;
import vibe.data.serialization : optional;
import vibe.data.json : Json, deserializeJson;
import builder : AddBuilder;

import stripe.servers : Servers;
import stripe.security : Security;
import openapi_client.util : isNull;
import openapi_client.apirequest : ApiRequest;
import openapi_client.handler : ResponseHandler;

import std.conv : to;
import std.typecons : Nullable;
import std.stdio;

public import stripe.model.account : Account;
public import stripe.model.bank_account : BankAccount;
public import stripe.model.capability : Capability;
public import stripe.model.card : Card;
public import stripe.model.deleted_account : DeletedAccount;
public import stripe.model.deleted_external_account : DeletedExternalAccount;
public import stripe.model.deleted_person : DeletedPerson;
public import stripe.model.error : Error_;
public import stripe.model.external_account : ExternalAccount;
public import stripe.model.login_link : LoginLink;
public import stripe.model.person : Person;

/**
 * Service to make REST API calls to paths beginning with: /v1/accounts
 */
class V1AccountsService {
  static class GetAccountsAccountParams {
    /**
     */
    string account;

    /**
     * Specifies which fields in the response should be expanded.
     */
    string[] expand;

    mixin AddBuilder!(typeof(this));

  }

  static class GetAccountsAccountResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(Account response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponseDefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        if (handleResponse200 is null) throw new Exception("Unhandled response status code 200");
        handleResponse200(deserializeJson!(Account)(res.readJson()));
        return;
      }
      if (handleResponseDefault is null) throw new Exception("Unhandled response status code default");
      handleResponseDefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

  }

  /**
   * <p>Retrieves the details of an account.</p>
   * See_Also: HTTP GET `/v1/accounts/{account}`
   */
  void getAccountsAccount(
      GetAccountsAccountParams params,
      GetAccountsAccountResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.GET,
        Servers.getServerUrl(),
        "/v1/accounts/{account}");
    if (!params.account.isNull)
      requestor.setPathParam("account", params.account);
    if (!params.expand.isNull)
      requestor.setQueryParam!("deepObject")("expand", params.expand);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class PostAccountsAccountParams {
    /**
     */
    string account;

    mixin AddBuilder!(typeof(this));

  }

  static class PostAccountsAccountBody {
    /**
     * An [account token](https://stripe.com/docs/api#create_account_token), used to securely
     * provide details to the account.
     */
    @optional
    string account_token;

    /**
     * Three-letter ISO currency code representing the default currency for the account. This must
     * be a currency that [Stripe supports in the account's
     * country](https://stripe.com/docs/payouts).
     */
    @optional
    string default_currency;

    /**
     * The email address of the account holder. This is only to make the account easier to identify
     * to you. Stripe only emails Custom accounts with your consent.
     */
    @optional
    string email;

    /**
     * A card or bank account to attach to the account for receiving
     * [payouts](https://stripe.com/docs/connect/bank-debit-card-payouts) (you won’t be able to
     * use it for top-ups). You can provide either a token, like the ones returned by
     * [Stripe.js](https://stripe.com/docs/js), or a dictionary, as documented in the
     * `external_account` parameter for [bank
     * account](https://stripe.com/docs/api#account_create_bank_account) creation. <br><br>By
     * default, providing an external account sets it as the new default external account for its
     * currency, and deletes the old default if one exists. To add additional external accounts
     * without replacing the existing default for the currency, use the [bank
     * account](https://stripe.com/docs/api#account_create_bank_account) or [card
     * creation](https://stripe.com/docs/api#account_create_card) APIs.
     */
    @optional
    string external_account;

    /**
     * Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an
     * object. This can be useful for storing additional information about the object in a
     * structured format. Individual keys can be unset by posting an empty value to them. All keys
     * can be unset by posting an empty value to `metadata`.
     */
    @optional
    Json metadata;

    static class BusinessProfileSpecs {
      @optional
      string mcc;

      @optional
      string product_description;

      static class AddressSpecs {
        @optional
        string line1;

        @optional
        string line2;

        @optional
        string country;

        @optional
        string postal_code;

        @optional
        string city;

        @optional
        string state;

        mixin AddBuilder!(typeof(this));

      }

      @optional
      AddressSpecs support_address;

      @optional
      Json support_url;

      @optional
      string url;

      @optional
      string name;

      @optional
      string support_email;

      @optional
      string support_phone;

      mixin AddBuilder!(typeof(this));

    }

    /**
     * Business information about the account.
     */
    @optional
    BusinessProfileSpecs business_profile;

    static class CapabilitiesParam {
      static class CapabilityParam {
        @optional
        Nullable!(bool) requested;

        mixin AddBuilder!(typeof(this));

      }

      @optional
      CapabilityParam konbini_payments;

      @optional
      CapabilityParam blik_payments;

      @optional
      CapabilityParam sepa_debit_payments;

      @optional
      CapabilityParam au_becs_debit_payments;

      @optional
      CapabilityParam card_issuing;

      @optional
      CapabilityParam oxxo_payments;

      @optional
      CapabilityParam ideal_payments;

      @optional
      CapabilityParam jcb_payments;

      @optional
      CapabilityParam us_bank_account_ach_payments;

      @optional
      CapabilityParam cartes_bancaires_payments;

      @optional
      CapabilityParam tax_reporting_us_1099_k;

      @optional
      CapabilityParam transfers;

      @optional
      CapabilityParam promptpay_payments;

      @optional
      CapabilityParam grabpay_payments;

      @optional
      CapabilityParam card_payments;

      @optional
      CapabilityParam bancontact_payments;

      @optional
      CapabilityParam sofort_payments;

      @optional
      CapabilityParam treasury;

      @optional
      CapabilityParam p24_payments;

      @optional
      CapabilityParam bacs_debit_payments;

      @optional
      CapabilityParam klarna_payments;

      @optional
      CapabilityParam legacy_payments;

      @optional
      CapabilityParam paynow_payments;

      @optional
      CapabilityParam afterpay_clearpay_payments;

      @optional
      CapabilityParam boleto_payments;

      @optional
      CapabilityParam fpx_payments;

      @optional
      CapabilityParam india_international_payments;

      @optional
      CapabilityParam tax_reporting_us_1099_misc;

      @optional
      CapabilityParam giropay_payments;

      @optional
      CapabilityParam bank_transfer_payments;

      @optional
      CapabilityParam eps_payments;

      @optional
      CapabilityParam affirm_payments;

      @optional
      CapabilityParam link_payments;

      @optional
      CapabilityParam acss_debit_payments;

      mixin AddBuilder!(typeof(this));

    }

    /**
     * Each key of the dictionary represents a capability, and each capability maps to its settings
     * (e.g. whether it has been requested or not). Each capability will be inactive until you have
     * provided its specific requirements and Stripe has verified them. An account may have some of
     * its requested capabilities be active and some be inactive.
     */
    @optional
    CapabilitiesParam capabilities;

    static class CompanySpecs {
      @optional
      string tax_id_registrar;

      @optional
      string structure;

      static class JapanAddressKanaSpecs {
        @optional
        string country;

        @optional
        string state;

        @optional
        string line1;

        @optional
        string town;

        @optional
        string postal_code;

        @optional
        string city;

        @optional
        string line2;

        mixin AddBuilder!(typeof(this));

      }

      @optional
      JapanAddressKanaSpecs address_kana;

      @optional
      Nullable!(bool) directors_provided;

      @optional
      string tax_id;

      @optional
      string registration_number;

      static class VerificationSpecs {
        static class VerificationDocumentSpecs {
          @optional
          string front;

          @optional
          string back;

          mixin AddBuilder!(typeof(this));

        }

        @optional
        VerificationDocumentSpecs document;

        mixin AddBuilder!(typeof(this));

      }

      @optional
      VerificationSpecs verification;

      @optional
      string name;

      @optional
      string phone;

      @optional
      string name_kana;

      static class AddressSpecs {
        @optional
        string line1;

        @optional
        string line2;

        @optional
        string country;

        @optional
        string postal_code;

        @optional
        string city;

        @optional
        string state;

        mixin AddBuilder!(typeof(this));

      }

      @optional
      AddressSpecs address;

      @optional
      Nullable!(bool) executives_provided;

      @optional
      Nullable!(bool) owners_provided;

      static class CompanyOwnershipDeclaration {
        @optional
        string ip;

        @optional
        Nullable!(long) date;

        @optional
        string user_agent;

        mixin AddBuilder!(typeof(this));

      }

      @optional
      CompanyOwnershipDeclaration ownership_declaration;

      @optional
      string vat_id;

      static class JapanAddressKanjiSpecs {
        @optional
        string country;

        @optional
        string state;

        @optional
        string line1;

        @optional
        string town;

        @optional
        string postal_code;

        @optional
        string city;

        @optional
        string line2;

        mixin AddBuilder!(typeof(this));

      }

      @optional
      JapanAddressKanjiSpecs address_kanji;

      @optional
      string name_kanji;

      mixin AddBuilder!(typeof(this));

    }

    /**
     * Information about the company or business. This field is available for any `business_type`.
     */
    @optional
    CompanySpecs company;

    static class SettingsSpecsUpdate {
      static class CardIssuingSettingsSpecs {
        static class SettingsTermsOfServiceSpecs {
          @optional
          string ip;

          @optional
          Nullable!(long) date;

          @optional
          string user_agent;

          mixin AddBuilder!(typeof(this));

        }

        @optional
        SettingsTermsOfServiceSpecs tos_acceptance;

        mixin AddBuilder!(typeof(this));

      }

      @optional
      CardIssuingSettingsSpecs card_issuing;

      static class PaymentsSettingsSpecs {
        @optional
        string statement_descriptor_kana;

        @optional
        string statement_descriptor;

        @optional
        string statement_descriptor_kanji;

        mixin AddBuilder!(typeof(this));

      }

      @optional
      PaymentsSettingsSpecs payments;

      static class PayoutSettingsSpecs {
        @optional
        string statement_descriptor;

        @optional
        Nullable!(bool) debit_negative_balances;

        static class TransferScheduleSpecs {
          @optional
          Nullable!(int) monthly_anchor;

          @optional
          Json delay_days;

          @optional
          string weekly_anchor;

          @optional
          string interval;

          mixin AddBuilder!(typeof(this));

        }

        @optional
        TransferScheduleSpecs schedule;

        mixin AddBuilder!(typeof(this));

      }

      @optional
      PayoutSettingsSpecs payouts;

      static class CardPaymentsSettingsSpecs {
        @optional
        Json statement_descriptor_prefix_kanji;

        @optional
        string statement_descriptor_prefix;

        @optional
        Json statement_descriptor_prefix_kana;

        static class DeclineChargeOnSpecs {
          @optional
          Nullable!(bool) cvc_failure;

          @optional
          Nullable!(bool) avs_failure;

          mixin AddBuilder!(typeof(this));

        }

        @optional
        DeclineChargeOnSpecs decline_on;

        mixin AddBuilder!(typeof(this));

      }

      @optional
      CardPaymentsSettingsSpecs card_payments;

      static class TreasurySettingsSpecs {
        static class SettingsTermsOfServiceSpecs {
          @optional
          string ip;

          @optional
          Nullable!(long) date;

          @optional
          string user_agent;

          mixin AddBuilder!(typeof(this));

        }

        @optional
        SettingsTermsOfServiceSpecs tos_acceptance;

        mixin AddBuilder!(typeof(this));

      }

      @optional
      TreasurySettingsSpecs treasury;

      static class BrandingSettingsSpecs {
        @optional
        string icon;

        @optional
        string logo;

        @optional
        string primary_color;

        @optional
        string secondary_color;

        mixin AddBuilder!(typeof(this));

      }

      @optional
      BrandingSettingsSpecs branding;

      mixin AddBuilder!(typeof(this));

    }

    /**
     * Options for customizing how the account functions within Stripe.
     */
    @optional
    SettingsSpecsUpdate settings;

    /**
     * Specifies which fields in the response should be expanded.
     */
    @optional
    string[] expand;

    /**
     * The business type.
     */
    @optional
    string business_type;

    static class DocumentsSpecs {
      static class DocumentsParam {
        @optional
        string[] files;

        mixin AddBuilder!(typeof(this));

      }

      @optional
      DocumentsParam bank_account_ownership_verification;

      @optional
      DocumentsParam proof_of_registration;

      @optional
      DocumentsParam company_tax_id_verification;

      @optional
      DocumentsParam company_memorandum_of_association;

      @optional
      DocumentsParam company_registration_verification;

      @optional
      DocumentsParam company_license;

      @optional
      DocumentsParam company_ministerial_decree;

      mixin AddBuilder!(typeof(this));

    }

    /**
     * Documents that may be submitted to satisfy various informational requests.
     */
    @optional
    DocumentsSpecs documents;

    static class IndividualSpecs {
      @optional
      string email;

      static class JapanAddressKanaSpecs {
        @optional
        string country;

        @optional
        string state;

        @optional
        string line1;

        @optional
        string town;

        @optional
        string postal_code;

        @optional
        string city;

        @optional
        string line2;

        mixin AddBuilder!(typeof(this));

      }

      @optional
      JapanAddressKanaSpecs address_kana;

      @optional
      string last_name_kanji;

      static class AddressSpecs {
        @optional
        string line1;

        @optional
        string line2;

        @optional
        string country;

        @optional
        string postal_code;

        @optional
        string city;

        @optional
        string state;

        mixin AddBuilder!(typeof(this));

      }

      @optional
      AddressSpecs registered_address;

      @optional
      Json full_name_aliases;

      @optional
      Json metadata;

      @optional
      string first_name;

      @optional
      string last_name;

      @optional
      string political_exposure;

      @optional
      string first_name_kanji;

      @optional
      string maiden_name;

      @optional
      string phone;

      @optional
      string ssn_last_4;

      @optional
      string last_name_kana;

      @optional
      AddressSpecs address;

      @optional
      string gender;

      static class PersonVerificationSpecs {
        static class PersonVerificationDocumentSpecs {
          @optional
          string front;

          @optional
          string back;

          mixin AddBuilder!(typeof(this));

        }

        @optional
        PersonVerificationDocumentSpecs additional_document;

        @optional
        PersonVerificationDocumentSpecs document;

        mixin AddBuilder!(typeof(this));

      }

      @optional
      PersonVerificationSpecs verification;

      @optional
      Json dob;

      @optional
      string first_name_kana;

      @optional
      string id_number_secondary;

      static class JapanAddressKanjiSpecs {
        @optional
        string country;

        @optional
        string state;

        @optional
        string line1;

        @optional
        string town;

        @optional
        string postal_code;

        @optional
        string city;

        @optional
        string line2;

        mixin AddBuilder!(typeof(this));

      }

      @optional
      JapanAddressKanjiSpecs address_kanji;

      @optional
      string id_number;

      mixin AddBuilder!(typeof(this));

    }

    /**
     * Information about the person represented by the account. This field is null unless
     * `business_type` is set to `individual`.
     */
    @optional
    IndividualSpecs individual;

    static class TosAcceptanceSpecs {
      @optional
      string service_agreement;

      @optional
      string ip;

      @optional
      Nullable!(long) date;

      @optional
      string user_agent;

      mixin AddBuilder!(typeof(this));

    }

    /**
     * Details on the account's acceptance of the [Stripe Services
     * Agreement](https://stripe.com/docs/connect/updating-accounts#tos-acceptance).
     */
    @optional
    TosAcceptanceSpecs tos_acceptance;

    mixin AddBuilder!(typeof(this));

  }

  static class PostAccountsAccountResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(Account response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponseDefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        if (handleResponse200 is null) throw new Exception("Unhandled response status code 200");
        handleResponse200(deserializeJson!(Account)(res.readJson()));
        return;
      }
      if (handleResponseDefault is null) throw new Exception("Unhandled response status code default");
      handleResponseDefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

  }

  /**
   * <p>Updates a <a href="/docs/connect/accounts">connected account</a> by setting the values of
   * the parameters passed. Any parameters not provided are left unchanged. Most parameters can be
   * changed only for Custom accounts. (These are marked <strong>Custom Only</strong> below.)
   * Parameters marked <strong>Custom and Express</strong> are not supported for Standard
   * accounts.</p>
   * <p>To update your own account, use the <a
   * href="https://dashboard.stripe.com/account">Dashboard</a>. Refer to our <a
   * href="/docs/connect/updating-accounts">Connect</a> documentation to learn more about updating
   * accounts.</p>
   * See_Also: HTTP POST `/v1/accounts/{account}`
   */
  void postAccountsAccount(
      PostAccountsAccountParams params,
      PostAccountsAccountBody requestBody,
      PostAccountsAccountResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/accounts/{account}");
    if (!params.account.isNull)
      requestor.setPathParam("account", params.account);
    requestor.setHeaderParam("Content-Type", "application/x-www-form-urlencoded");
    Security.apply(requestor);
    requestor.makeRequest(requestBody, responseHandler);
  }

  static class DeleteAccountsAccountParams {
    /**
     */
    string account;

    mixin AddBuilder!(typeof(this));

  }

  static class DeleteAccountsAccountResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(DeletedAccount response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponseDefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        if (handleResponse200 is null) throw new Exception("Unhandled response status code 200");
        handleResponse200(deserializeJson!(DeletedAccount)(res.readJson()));
        return;
      }
      if (handleResponseDefault is null) throw new Exception("Unhandled response status code default");
      handleResponseDefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

  }

  /**
   * <p>With <a href="/docs/connect">Connect</a>, you can delete accounts you manage.</p>
   * <p>Accounts created using test-mode keys can be deleted at any time. Standard accounts created
   * using live-mode keys cannot be deleted. Custom or Express accounts created using live-mode keys
   * can only be deleted once all balances are zero.</p>
   * <p>If you want to delete your own account, use the <a
   * href="https://dashboard.stripe.com/account">account information tab in your account
   * settings</a> instead.</p>
   * See_Also: HTTP DELETE `/v1/accounts/{account}`
   */
  void deleteAccountsAccount(
      DeleteAccountsAccountParams params,
      DeleteAccountsAccountResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.DELETE,
        Servers.getServerUrl(),
        "/v1/accounts/{account}");
    if (!params.account.isNull)
      requestor.setPathParam("account", params.account);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class GetAccountsAccountPeopleParams {
    /**
     */
    string account;

    /**
     * A cursor for use in pagination. `ending_before` is an object ID that defines your place in
     * the list. For instance, if you make a list request and receive 100 objects, starting with
     * `obj_bar`, your subsequent call can include `ending_before=obj_bar` in order to fetch the
     * previous page of the list.
     */
    string ending_before;

    /**
     * Specifies which fields in the response should be expanded.
     */
    string[] expand;

    /**
     * A limit on the number of objects to be returned. Limit can range between 1 and 100, and the
     * default is 10.
     */
    Nullable!(int) limit;

    /**
     * Filters on the list of people returned based on the person's relationship to the account's
     * company.
     */
    static class AllPeopleRelationshipSpecs {
      @optional
      Nullable!(bool) executive;

      @optional
      Nullable!(bool) owner;

      @optional
      Nullable!(bool) director;

      @optional
      Nullable!(bool) representative;

      mixin AddBuilder!(typeof(this));

    }

    AllPeopleRelationshipSpecs relationship;

    /**
     * A cursor for use in pagination. `starting_after` is an object ID that defines your place in
     * the list. For instance, if you make a list request and receive 100 objects, ending with
     * `obj_foo`, your subsequent call can include `starting_after=obj_foo` in order to fetch the
     * next page of the list.
     */
    string starting_after;

    mixin AddBuilder!(typeof(this));

  }

  static class GetAccountsAccountPeopleResponseHandler : ResponseHandler {

    static class PersonList {
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
      string object;

      @optional
      Person[] data;

      /**
       * The URL where this list can be accessed.
       */
      @optional
      string url;

      mixin AddBuilder!(typeof(this));

    }

    /**
     * Successful response.
     */
    void delegate(PersonList response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponseDefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        if (handleResponse200 is null) throw new Exception("Unhandled response status code 200");
        handleResponse200(deserializeJson!(PersonList)(res.readJson()));
        return;
      }
      if (handleResponseDefault is null) throw new Exception("Unhandled response status code default");
      handleResponseDefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

  }

  /**
   * <p>Returns a list of people associated with the account’s legal entity. The people are
   * returned sorted by creation date, with the most recent people appearing first.</p>
   * See_Also: HTTP GET `/v1/accounts/{account}/people`
   */
  void getAccountsAccountPeople(
      GetAccountsAccountPeopleParams params,
      GetAccountsAccountPeopleResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.GET,
        Servers.getServerUrl(),
        "/v1/accounts/{account}/people");
    if (!params.account.isNull)
      requestor.setPathParam("account", params.account);
    if (!params.ending_before.isNull)
      requestor.setQueryParam!("deepObject")("ending_before", params.ending_before);
    if (!params.expand.isNull)
      requestor.setQueryParam!("deepObject")("expand", params.expand);
    if (!params.limit.isNull)
      requestor.setQueryParam!("deepObject")("limit", params.limit);
    if (!params.relationship.isNull)
      requestor.setQueryParam!("deepObject")("relationship", params.relationship);
    if (!params.starting_after.isNull)
      requestor.setQueryParam!("deepObject")("starting_after", params.starting_after);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class PostAccountsAccountPeopleParams {
    /**
     */
    string account;

    mixin AddBuilder!(typeof(this));

  }

  static class PostAccountsAccountPeopleBody {
    /**
     * The person's email address.
     */
    @optional
    string email;

    /**
     * The person's last name.
     */
    @optional
    string last_name;

    static class PersonVerificationSpecs {
      static class PersonVerificationDocumentSpecs {
        @optional
        string front;

        @optional
        string back;

        mixin AddBuilder!(typeof(this));

      }

      @optional
      PersonVerificationDocumentSpecs additional_document;

      @optional
      PersonVerificationDocumentSpecs document;

      mixin AddBuilder!(typeof(this));

    }

    /**
     * The person's verification status.
     */
    @optional
    PersonVerificationSpecs verification;

    static class AddressSpecs {
      @optional
      string line1;

      @optional
      string line2;

      @optional
      string country;

      @optional
      string postal_code;

      @optional
      string city;

      @optional
      string state;

      mixin AddBuilder!(typeof(this));

    }

    /**
     * The person's address.
     */
    @optional
    AddressSpecs address;

    static class PersonDocumentsSpecs {
      static class DocumentsParam {
        @optional
        string[] files;

        mixin AddBuilder!(typeof(this));

      }

      @optional
      DocumentsParam passport;

      @optional
      DocumentsParam company_authorization;

      @optional
      DocumentsParam visa;

      mixin AddBuilder!(typeof(this));

    }

    /**
     * Documents that may be submitted to satisfy various informational requests.
     */
    @optional
    PersonDocumentsSpecs documents;

    /**
     * The person's registered address.
     */
    @optional
    AddressSpecs registered_address;

    /**
     * A list of alternate names or aliases that the person is known by.
     */
    @optional
    Json full_name_aliases;

    /**
     * The person's first name.
     */
    @optional
    string first_name;

    /**
     * A [person token](https://stripe.com/docs/connect/account-tokens), used to securely provide
     * details to the person.
     */
    @optional
    string person_token;

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
     * The person's date of birth.
     */
    @optional
    Json dob;

    /**
     * The person's ID number, as appropriate for their country. For example, a social security
     * number in the U.S., social insurance number in Canada, etc. Instead of the number itself, you
     * can also provide a [PII token provided by
     * Stripe.js](https://stripe.com/docs/js/tokens_sources/create_token?type=pii).
     */
    @optional
    string id_number;

    /**
     * The Kanji variation of the person's last name (Japan only).
     */
    @optional
    string last_name_kanji;

    /**
     * Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an
     * object. This can be useful for storing additional information about the object in a
     * structured format. Individual keys can be unset by posting an empty value to them. All keys
     * can be unset by posting an empty value to `metadata`.
     */
    @optional
    Json metadata;

    /**
     * Specifies which fields in the response should be expanded.
     */
    @optional
    string[] expand;

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

    static class RelationshipSpecs {
      @optional
      Nullable!(bool) executive;

      @optional
      Nullable!(bool) owner;

      @optional
      Nullable!(bool) director;

      @optional
      Nullable!(bool) representative;

      @optional
      Json percent_ownership;

      @optional
      string title;

      mixin AddBuilder!(typeof(this));

    }

    /**
     * The relationship that this person has with the account's legal entity.
     */
    @optional
    RelationshipSpecs relationship;

    static class JapanAddressKanaSpecs {
      @optional
      string country;

      @optional
      string state;

      @optional
      string line1;

      @optional
      string town;

      @optional
      string postal_code;

      @optional
      string city;

      @optional
      string line2;

      mixin AddBuilder!(typeof(this));

    }

    /**
     * The Kana variation of the person's address (Japan only).
     */
    @optional
    JapanAddressKanaSpecs address_kana;

    /**
     * The country where the person is a national. Two-letter country code ([ISO 3166-1
     * alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2)), or "XX" if unavailable.
     */
    @optional
    string nationality;

    /**
     * The last four digits of the person's Social Security number (U.S. only).
     */
    @optional
    string ssn_last_4;

    /**
     * The Kanji variation of the person's first name (Japan only).
     */
    @optional
    string first_name_kanji;

    /**
     * The person's secondary ID number, as appropriate for their country, will be used for enhanced
     * verification checks. In Thailand, this would be the laser code found on the back of an ID
     * card. Instead of the number itself, you can also provide a [PII token provided by
     * Stripe.js](https://stripe.com/docs/js/tokens_sources/create_token?type=pii).
     */
    @optional
    string id_number_secondary;

    static class JapanAddressKanjiSpecs {
      @optional
      string country;

      @optional
      string state;

      @optional
      string line1;

      @optional
      string town;

      @optional
      string postal_code;

      @optional
      string city;

      @optional
      string line2;

      mixin AddBuilder!(typeof(this));

    }

    /**
     * The Kanji variation of the person's address (Japan only).
     */
    @optional
    JapanAddressKanjiSpecs address_kanji;

    mixin AddBuilder!(typeof(this));

  }

  static class PostAccountsAccountPeopleResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(Person response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponseDefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        if (handleResponse200 is null) throw new Exception("Unhandled response status code 200");
        handleResponse200(deserializeJson!(Person)(res.readJson()));
        return;
      }
      if (handleResponseDefault is null) throw new Exception("Unhandled response status code default");
      handleResponseDefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

  }

  /**
   * <p>Creates a new person.</p>
   * See_Also: HTTP POST `/v1/accounts/{account}/people`
   */
  void postAccountsAccountPeople(
      PostAccountsAccountPeopleParams params,
      PostAccountsAccountPeopleBody requestBody,
      PostAccountsAccountPeopleResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/accounts/{account}/people");
    if (!params.account.isNull)
      requestor.setPathParam("account", params.account);
    requestor.setHeaderParam("Content-Type", "application/x-www-form-urlencoded");
    Security.apply(requestor);
    requestor.makeRequest(requestBody, responseHandler);
  }

  static class PostAccountsAccountLoginLinksParams {
    /**
     */
    string account;

    mixin AddBuilder!(typeof(this));

  }

  static class PostAccountsAccountLoginLinksBody {
    /**
     * Specifies which fields in the response should be expanded.
     */
    @optional
    string[] expand;

    mixin AddBuilder!(typeof(this));

  }

  static class PostAccountsAccountLoginLinksResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(LoginLink response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponseDefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        if (handleResponse200 is null) throw new Exception("Unhandled response status code 200");
        handleResponse200(deserializeJson!(LoginLink)(res.readJson()));
        return;
      }
      if (handleResponseDefault is null) throw new Exception("Unhandled response status code default");
      handleResponseDefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

  }

  /**
   * <p>Creates a single-use login link for an Express account to access their Stripe dashboard.</p>
   * <p><strong>You may only create login links for <a href="/docs/connect/express-accounts">Express
   * accounts</a> connected to your platform</strong>.</p>
   * See_Also: HTTP POST `/v1/accounts/{account}/login_links`
   */
  void postAccountsAccountLoginLinks(
      PostAccountsAccountLoginLinksParams params,
      PostAccountsAccountLoginLinksBody requestBody,
      PostAccountsAccountLoginLinksResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/accounts/{account}/login_links");
    if (!params.account.isNull)
      requestor.setPathParam("account", params.account);
    requestor.setHeaderParam("Content-Type", "application/x-www-form-urlencoded");
    Security.apply(requestor);
    requestor.makeRequest(requestBody, responseHandler);
  }

  static class GetAccountsAccountPersonsParams {
    /**
     */
    string account;

    /**
     * A cursor for use in pagination. `ending_before` is an object ID that defines your place in
     * the list. For instance, if you make a list request and receive 100 objects, starting with
     * `obj_bar`, your subsequent call can include `ending_before=obj_bar` in order to fetch the
     * previous page of the list.
     */
    string ending_before;

    /**
     * Specifies which fields in the response should be expanded.
     */
    string[] expand;

    /**
     * A limit on the number of objects to be returned. Limit can range between 1 and 100, and the
     * default is 10.
     */
    Nullable!(int) limit;

    /**
     * Filters on the list of people returned based on the person's relationship to the account's
     * company.
     */
    static class AllPeopleRelationshipSpecs {
      @optional
      Nullable!(bool) executive;

      @optional
      Nullable!(bool) owner;

      @optional
      Nullable!(bool) director;

      @optional
      Nullable!(bool) representative;

      mixin AddBuilder!(typeof(this));

    }

    AllPeopleRelationshipSpecs relationship;

    /**
     * A cursor for use in pagination. `starting_after` is an object ID that defines your place in
     * the list. For instance, if you make a list request and receive 100 objects, ending with
     * `obj_foo`, your subsequent call can include `starting_after=obj_foo` in order to fetch the
     * next page of the list.
     */
    string starting_after;

    mixin AddBuilder!(typeof(this));

  }

  static class GetAccountsAccountPersonsResponseHandler : ResponseHandler {

    static class PersonList {
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
      string object;

      @optional
      Person[] data;

      /**
       * The URL where this list can be accessed.
       */
      @optional
      string url;

      mixin AddBuilder!(typeof(this));

    }

    /**
     * Successful response.
     */
    void delegate(PersonList response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponseDefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        if (handleResponse200 is null) throw new Exception("Unhandled response status code 200");
        handleResponse200(deserializeJson!(PersonList)(res.readJson()));
        return;
      }
      if (handleResponseDefault is null) throw new Exception("Unhandled response status code default");
      handleResponseDefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

  }

  /**
   * <p>Returns a list of people associated with the account’s legal entity. The people are
   * returned sorted by creation date, with the most recent people appearing first.</p>
   * See_Also: HTTP GET `/v1/accounts/{account}/persons`
   */
  void getAccountsAccountPersons(
      GetAccountsAccountPersonsParams params,
      GetAccountsAccountPersonsResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.GET,
        Servers.getServerUrl(),
        "/v1/accounts/{account}/persons");
    if (!params.account.isNull)
      requestor.setPathParam("account", params.account);
    if (!params.ending_before.isNull)
      requestor.setQueryParam!("deepObject")("ending_before", params.ending_before);
    if (!params.expand.isNull)
      requestor.setQueryParam!("deepObject")("expand", params.expand);
    if (!params.limit.isNull)
      requestor.setQueryParam!("deepObject")("limit", params.limit);
    if (!params.relationship.isNull)
      requestor.setQueryParam!("deepObject")("relationship", params.relationship);
    if (!params.starting_after.isNull)
      requestor.setQueryParam!("deepObject")("starting_after", params.starting_after);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class PostAccountsAccountPersonsParams {
    /**
     */
    string account;

    mixin AddBuilder!(typeof(this));

  }

  static class PostAccountsAccountPersonsBody {
    /**
     * The person's email address.
     */
    @optional
    string email;

    /**
     * The person's last name.
     */
    @optional
    string last_name;

    static class PersonVerificationSpecs {
      static class PersonVerificationDocumentSpecs {
        @optional
        string front;

        @optional
        string back;

        mixin AddBuilder!(typeof(this));

      }

      @optional
      PersonVerificationDocumentSpecs additional_document;

      @optional
      PersonVerificationDocumentSpecs document;

      mixin AddBuilder!(typeof(this));

    }

    /**
     * The person's verification status.
     */
    @optional
    PersonVerificationSpecs verification;

    static class AddressSpecs {
      @optional
      string line1;

      @optional
      string line2;

      @optional
      string country;

      @optional
      string postal_code;

      @optional
      string city;

      @optional
      string state;

      mixin AddBuilder!(typeof(this));

    }

    /**
     * The person's address.
     */
    @optional
    AddressSpecs address;

    static class PersonDocumentsSpecs {
      static class DocumentsParam {
        @optional
        string[] files;

        mixin AddBuilder!(typeof(this));

      }

      @optional
      DocumentsParam passport;

      @optional
      DocumentsParam company_authorization;

      @optional
      DocumentsParam visa;

      mixin AddBuilder!(typeof(this));

    }

    /**
     * Documents that may be submitted to satisfy various informational requests.
     */
    @optional
    PersonDocumentsSpecs documents;

    /**
     * The person's registered address.
     */
    @optional
    AddressSpecs registered_address;

    /**
     * A list of alternate names or aliases that the person is known by.
     */
    @optional
    Json full_name_aliases;

    /**
     * The person's first name.
     */
    @optional
    string first_name;

    /**
     * A [person token](https://stripe.com/docs/connect/account-tokens), used to securely provide
     * details to the person.
     */
    @optional
    string person_token;

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
     * The person's date of birth.
     */
    @optional
    Json dob;

    /**
     * The person's ID number, as appropriate for their country. For example, a social security
     * number in the U.S., social insurance number in Canada, etc. Instead of the number itself, you
     * can also provide a [PII token provided by
     * Stripe.js](https://stripe.com/docs/js/tokens_sources/create_token?type=pii).
     */
    @optional
    string id_number;

    /**
     * The Kanji variation of the person's last name (Japan only).
     */
    @optional
    string last_name_kanji;

    /**
     * Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an
     * object. This can be useful for storing additional information about the object in a
     * structured format. Individual keys can be unset by posting an empty value to them. All keys
     * can be unset by posting an empty value to `metadata`.
     */
    @optional
    Json metadata;

    /**
     * Specifies which fields in the response should be expanded.
     */
    @optional
    string[] expand;

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

    static class RelationshipSpecs {
      @optional
      Nullable!(bool) executive;

      @optional
      Nullable!(bool) owner;

      @optional
      Nullable!(bool) director;

      @optional
      Nullable!(bool) representative;

      @optional
      Json percent_ownership;

      @optional
      string title;

      mixin AddBuilder!(typeof(this));

    }

    /**
     * The relationship that this person has with the account's legal entity.
     */
    @optional
    RelationshipSpecs relationship;

    static class JapanAddressKanaSpecs {
      @optional
      string country;

      @optional
      string state;

      @optional
      string line1;

      @optional
      string town;

      @optional
      string postal_code;

      @optional
      string city;

      @optional
      string line2;

      mixin AddBuilder!(typeof(this));

    }

    /**
     * The Kana variation of the person's address (Japan only).
     */
    @optional
    JapanAddressKanaSpecs address_kana;

    /**
     * The country where the person is a national. Two-letter country code ([ISO 3166-1
     * alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2)), or "XX" if unavailable.
     */
    @optional
    string nationality;

    /**
     * The last four digits of the person's Social Security number (U.S. only).
     */
    @optional
    string ssn_last_4;

    /**
     * The Kanji variation of the person's first name (Japan only).
     */
    @optional
    string first_name_kanji;

    /**
     * The person's secondary ID number, as appropriate for their country, will be used for enhanced
     * verification checks. In Thailand, this would be the laser code found on the back of an ID
     * card. Instead of the number itself, you can also provide a [PII token provided by
     * Stripe.js](https://stripe.com/docs/js/tokens_sources/create_token?type=pii).
     */
    @optional
    string id_number_secondary;

    static class JapanAddressKanjiSpecs {
      @optional
      string country;

      @optional
      string state;

      @optional
      string line1;

      @optional
      string town;

      @optional
      string postal_code;

      @optional
      string city;

      @optional
      string line2;

      mixin AddBuilder!(typeof(this));

    }

    /**
     * The Kanji variation of the person's address (Japan only).
     */
    @optional
    JapanAddressKanjiSpecs address_kanji;

    mixin AddBuilder!(typeof(this));

  }

  static class PostAccountsAccountPersonsResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(Person response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponseDefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        if (handleResponse200 is null) throw new Exception("Unhandled response status code 200");
        handleResponse200(deserializeJson!(Person)(res.readJson()));
        return;
      }
      if (handleResponseDefault is null) throw new Exception("Unhandled response status code default");
      handleResponseDefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

  }

  /**
   * <p>Creates a new person.</p>
   * See_Also: HTTP POST `/v1/accounts/{account}/persons`
   */
  void postAccountsAccountPersons(
      PostAccountsAccountPersonsParams params,
      PostAccountsAccountPersonsBody requestBody,
      PostAccountsAccountPersonsResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/accounts/{account}/persons");
    if (!params.account.isNull)
      requestor.setPathParam("account", params.account);
    requestor.setHeaderParam("Content-Type", "application/x-www-form-urlencoded");
    Security.apply(requestor);
    requestor.makeRequest(requestBody, responseHandler);
  }

  static class GetAccountsAccountExternalAccountsIdParams {
    /**
     */
    string account;

    /**
     * Specifies which fields in the response should be expanded.
     */
    string[] expand;

    /**
     */
    string id;

    mixin AddBuilder!(typeof(this));

  }

  static class GetAccountsAccountExternalAccountsIdResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(ExternalAccount response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponseDefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        if (handleResponse200 is null) throw new Exception("Unhandled response status code 200");
        handleResponse200(deserializeJson!(ExternalAccount)(res.readJson()));
        return;
      }
      if (handleResponseDefault is null) throw new Exception("Unhandled response status code default");
      handleResponseDefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

  }

  /**
   * <p>Retrieve a specified external account for a given account.</p>
   * See_Also: HTTP GET `/v1/accounts/{account}/external_accounts/{id}`
   */
  void getAccountsAccountExternalAccountsId(
      GetAccountsAccountExternalAccountsIdParams params,
      GetAccountsAccountExternalAccountsIdResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.GET,
        Servers.getServerUrl(),
        "/v1/accounts/{account}/external_accounts/{id}");
    if (!params.account.isNull)
      requestor.setPathParam("account", params.account);
    if (!params.expand.isNull)
      requestor.setQueryParam!("deepObject")("expand", params.expand);
    if (!params.id.isNull)
      requestor.setPathParam("id", params.id);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class PostAccountsAccountExternalAccountsIdParams {
    /**
     */
    string account;

    /**
     */
    string id;

    mixin AddBuilder!(typeof(this));

  }

  static class PostAccountsAccountExternalAccountsIdBody {
    /**
     * State/County/Province/Region.
     */
    @optional
    string address_state;

    /**
     * ZIP or postal code.
     */
    @optional
    string address_zip;

    /**
     * City/District/Suburb/Town/Village.
     */
    @optional
    string address_city;

    /**
     * Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an
     * object. This can be useful for storing additional information about the object in a
     * structured format. Individual keys can be unset by posting an empty value to them. All keys
     * can be unset by posting an empty value to `metadata`.
     */
    @optional
    Json metadata;

    /**
     * Two digit number representing the card’s expiration month.
     */
    @optional
    string exp_month;

    /**
     * Billing address country, if provided when creating card.
     */
    @optional
    string address_country;

    /**
     * Four digit number representing the card’s expiration year.
     */
    @optional
    string exp_year;

    /**
     * Address line 1 (Street address/PO Box/Company name).
     */
    @optional
    string address_line1;

    /**
     * When set to true, this becomes the default external account for its currency.
     */
    @optional
    Nullable!(bool) default_for_currency;

    /**
     * The name of the person or business that owns the bank account.
     */
    @optional
    string account_holder_name;

    /**
     * Specifies which fields in the response should be expanded.
     */
    @optional
    string[] expand;

    /**
     * Cardholder name.
     */
    @optional
    string name;

    /**
     * The type of entity that holds the account. This can be either `individual` or `company`.
     */
    @optional
    string account_holder_type;

    /**
     * Address line 2 (Apartment/Suite/Unit/Building).
     */
    @optional
    string address_line2;

    /**
     * The bank account type. This can only be `checking` or `savings` in most countries. In Japan,
     * this can only be `futsu` or `toza`.
     */
    @optional
    string account_type;

    mixin AddBuilder!(typeof(this));

  }

  static class PostAccountsAccountExternalAccountsIdResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(ExternalAccount response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponseDefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        if (handleResponse200 is null) throw new Exception("Unhandled response status code 200");
        handleResponse200(deserializeJson!(ExternalAccount)(res.readJson()));
        return;
      }
      if (handleResponseDefault is null) throw new Exception("Unhandled response status code default");
      handleResponseDefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

  }

  /**
   * <p>Updates the metadata, account holder name, account holder type of a bank account belonging
   * to a <a href="/docs/connect/custom-accounts">Custom account</a>, and optionally sets it as the
   * default for its currency. Other bank account details are not editable by design.</p>
   * <p>You can re-enable a disabled bank account by performing an update call without providing any
   * arguments or changes.</p>
   * See_Also: HTTP POST `/v1/accounts/{account}/external_accounts/{id}`
   */
  void postAccountsAccountExternalAccountsId(
      PostAccountsAccountExternalAccountsIdParams params,
      PostAccountsAccountExternalAccountsIdBody requestBody,
      PostAccountsAccountExternalAccountsIdResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/accounts/{account}/external_accounts/{id}");
    if (!params.account.isNull)
      requestor.setPathParam("account", params.account);
    if (!params.id.isNull)
      requestor.setPathParam("id", params.id);
    requestor.setHeaderParam("Content-Type", "application/x-www-form-urlencoded");
    Security.apply(requestor);
    requestor.makeRequest(requestBody, responseHandler);
  }

  static class DeleteAccountsAccountExternalAccountsIdParams {
    /**
     */
    string account;

    /**
     */
    string id;

    mixin AddBuilder!(typeof(this));

  }

  static class DeleteAccountsAccountExternalAccountsIdResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(DeletedExternalAccount response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponseDefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        if (handleResponse200 is null) throw new Exception("Unhandled response status code 200");
        handleResponse200(deserializeJson!(DeletedExternalAccount)(res.readJson()));
        return;
      }
      if (handleResponseDefault is null) throw new Exception("Unhandled response status code default");
      handleResponseDefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

  }

  /**
   * <p>Delete a specified external account for a given account.</p>
   * See_Also: HTTP DELETE `/v1/accounts/{account}/external_accounts/{id}`
   */
  void deleteAccountsAccountExternalAccountsId(
      DeleteAccountsAccountExternalAccountsIdParams params,
      DeleteAccountsAccountExternalAccountsIdResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.DELETE,
        Servers.getServerUrl(),
        "/v1/accounts/{account}/external_accounts/{id}");
    if (!params.account.isNull)
      requestor.setPathParam("account", params.account);
    if (!params.id.isNull)
      requestor.setPathParam("id", params.id);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class GetAccountsAccountBankAccountsIdParams {
    /**
     */
    string account;

    /**
     * Specifies which fields in the response should be expanded.
     */
    string[] expand;

    /**
     */
    string id;

    mixin AddBuilder!(typeof(this));

  }

  static class GetAccountsAccountBankAccountsIdResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(ExternalAccount response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponseDefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        if (handleResponse200 is null) throw new Exception("Unhandled response status code 200");
        handleResponse200(deserializeJson!(ExternalAccount)(res.readJson()));
        return;
      }
      if (handleResponseDefault is null) throw new Exception("Unhandled response status code default");
      handleResponseDefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

  }

  /**
   * <p>Retrieve a specified external account for a given account.</p>
   * See_Also: HTTP GET `/v1/accounts/{account}/bank_accounts/{id}`
   */
  void getAccountsAccountBankAccountsId(
      GetAccountsAccountBankAccountsIdParams params,
      GetAccountsAccountBankAccountsIdResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.GET,
        Servers.getServerUrl(),
        "/v1/accounts/{account}/bank_accounts/{id}");
    if (!params.account.isNull)
      requestor.setPathParam("account", params.account);
    if (!params.expand.isNull)
      requestor.setQueryParam!("deepObject")("expand", params.expand);
    if (!params.id.isNull)
      requestor.setPathParam("id", params.id);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class PostAccountsAccountBankAccountsIdParams {
    /**
     */
    string account;

    /**
     */
    string id;

    mixin AddBuilder!(typeof(this));

  }

  static class PostAccountsAccountBankAccountsIdBody {
    /**
     * State/County/Province/Region.
     */
    @optional
    string address_state;

    /**
     * ZIP or postal code.
     */
    @optional
    string address_zip;

    /**
     * City/District/Suburb/Town/Village.
     */
    @optional
    string address_city;

    /**
     * Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an
     * object. This can be useful for storing additional information about the object in a
     * structured format. Individual keys can be unset by posting an empty value to them. All keys
     * can be unset by posting an empty value to `metadata`.
     */
    @optional
    Json metadata;

    /**
     * Two digit number representing the card’s expiration month.
     */
    @optional
    string exp_month;

    /**
     * Billing address country, if provided when creating card.
     */
    @optional
    string address_country;

    /**
     * Four digit number representing the card’s expiration year.
     */
    @optional
    string exp_year;

    /**
     * Address line 1 (Street address/PO Box/Company name).
     */
    @optional
    string address_line1;

    /**
     * When set to true, this becomes the default external account for its currency.
     */
    @optional
    Nullable!(bool) default_for_currency;

    /**
     * The name of the person or business that owns the bank account.
     */
    @optional
    string account_holder_name;

    /**
     * Specifies which fields in the response should be expanded.
     */
    @optional
    string[] expand;

    /**
     * Cardholder name.
     */
    @optional
    string name;

    /**
     * The type of entity that holds the account. This can be either `individual` or `company`.
     */
    @optional
    string account_holder_type;

    /**
     * Address line 2 (Apartment/Suite/Unit/Building).
     */
    @optional
    string address_line2;

    /**
     * The bank account type. This can only be `checking` or `savings` in most countries. In Japan,
     * this can only be `futsu` or `toza`.
     */
    @optional
    string account_type;

    mixin AddBuilder!(typeof(this));

  }

  static class PostAccountsAccountBankAccountsIdResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(ExternalAccount response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponseDefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        if (handleResponse200 is null) throw new Exception("Unhandled response status code 200");
        handleResponse200(deserializeJson!(ExternalAccount)(res.readJson()));
        return;
      }
      if (handleResponseDefault is null) throw new Exception("Unhandled response status code default");
      handleResponseDefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

  }

  /**
   * <p>Updates the metadata, account holder name, account holder type of a bank account belonging
   * to a <a href="/docs/connect/custom-accounts">Custom account</a>, and optionally sets it as the
   * default for its currency. Other bank account details are not editable by design.</p>
   * <p>You can re-enable a disabled bank account by performing an update call without providing any
   * arguments or changes.</p>
   * See_Also: HTTP POST `/v1/accounts/{account}/bank_accounts/{id}`
   */
  void postAccountsAccountBankAccountsId(
      PostAccountsAccountBankAccountsIdParams params,
      PostAccountsAccountBankAccountsIdBody requestBody,
      PostAccountsAccountBankAccountsIdResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/accounts/{account}/bank_accounts/{id}");
    if (!params.account.isNull)
      requestor.setPathParam("account", params.account);
    if (!params.id.isNull)
      requestor.setPathParam("id", params.id);
    requestor.setHeaderParam("Content-Type", "application/x-www-form-urlencoded");
    Security.apply(requestor);
    requestor.makeRequest(requestBody, responseHandler);
  }

  static class DeleteAccountsAccountBankAccountsIdParams {
    /**
     */
    string account;

    /**
     */
    string id;

    mixin AddBuilder!(typeof(this));

  }

  static class DeleteAccountsAccountBankAccountsIdResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(DeletedExternalAccount response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponseDefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        if (handleResponse200 is null) throw new Exception("Unhandled response status code 200");
        handleResponse200(deserializeJson!(DeletedExternalAccount)(res.readJson()));
        return;
      }
      if (handleResponseDefault is null) throw new Exception("Unhandled response status code default");
      handleResponseDefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

  }

  /**
   * <p>Delete a specified external account for a given account.</p>
   * See_Also: HTTP DELETE `/v1/accounts/{account}/bank_accounts/{id}`
   */
  void deleteAccountsAccountBankAccountsId(
      DeleteAccountsAccountBankAccountsIdParams params,
      DeleteAccountsAccountBankAccountsIdResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.DELETE,
        Servers.getServerUrl(),
        "/v1/accounts/{account}/bank_accounts/{id}");
    if (!params.account.isNull)
      requestor.setPathParam("account", params.account);
    if (!params.id.isNull)
      requestor.setPathParam("id", params.id);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class GetAccountsAccountPeoplePersonParams {
    /**
     */
    string account;

    /**
     * Specifies which fields in the response should be expanded.
     */
    string[] expand;

    /**
     */
    string person;

    mixin AddBuilder!(typeof(this));

  }

  static class GetAccountsAccountPeoplePersonResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(Person response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponseDefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        if (handleResponse200 is null) throw new Exception("Unhandled response status code 200");
        handleResponse200(deserializeJson!(Person)(res.readJson()));
        return;
      }
      if (handleResponseDefault is null) throw new Exception("Unhandled response status code default");
      handleResponseDefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

  }

  /**
   * <p>Retrieves an existing person.</p>
   * See_Also: HTTP GET `/v1/accounts/{account}/people/{person}`
   */
  void getAccountsAccountPeoplePerson(
      GetAccountsAccountPeoplePersonParams params,
      GetAccountsAccountPeoplePersonResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.GET,
        Servers.getServerUrl(),
        "/v1/accounts/{account}/people/{person}");
    if (!params.account.isNull)
      requestor.setPathParam("account", params.account);
    if (!params.expand.isNull)
      requestor.setQueryParam!("deepObject")("expand", params.expand);
    if (!params.person.isNull)
      requestor.setPathParam("person", params.person);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class PostAccountsAccountPeoplePersonParams {
    /**
     */
    string account;

    /**
     */
    string person;

    mixin AddBuilder!(typeof(this));

  }

  static class PostAccountsAccountPeoplePersonBody {
    /**
     * The person's email address.
     */
    @optional
    string email;

    /**
     * The person's last name.
     */
    @optional
    string last_name;

    static class PersonVerificationSpecs {
      static class PersonVerificationDocumentSpecs {
        @optional
        string front;

        @optional
        string back;

        mixin AddBuilder!(typeof(this));

      }

      @optional
      PersonVerificationDocumentSpecs additional_document;

      @optional
      PersonVerificationDocumentSpecs document;

      mixin AddBuilder!(typeof(this));

    }

    /**
     * The person's verification status.
     */
    @optional
    PersonVerificationSpecs verification;

    static class AddressSpecs {
      @optional
      string line1;

      @optional
      string line2;

      @optional
      string country;

      @optional
      string postal_code;

      @optional
      string city;

      @optional
      string state;

      mixin AddBuilder!(typeof(this));

    }

    /**
     * The person's address.
     */
    @optional
    AddressSpecs address;

    static class PersonDocumentsSpecs {
      static class DocumentsParam {
        @optional
        string[] files;

        mixin AddBuilder!(typeof(this));

      }

      @optional
      DocumentsParam passport;

      @optional
      DocumentsParam company_authorization;

      @optional
      DocumentsParam visa;

      mixin AddBuilder!(typeof(this));

    }

    /**
     * Documents that may be submitted to satisfy various informational requests.
     */
    @optional
    PersonDocumentsSpecs documents;

    /**
     * The person's registered address.
     */
    @optional
    AddressSpecs registered_address;

    /**
     * A list of alternate names or aliases that the person is known by.
     */
    @optional
    Json full_name_aliases;

    /**
     * The person's first name.
     */
    @optional
    string first_name;

    /**
     * A [person token](https://stripe.com/docs/connect/account-tokens), used to securely provide
     * details to the person.
     */
    @optional
    string person_token;

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
     * The person's date of birth.
     */
    @optional
    Json dob;

    /**
     * The person's ID number, as appropriate for their country. For example, a social security
     * number in the U.S., social insurance number in Canada, etc. Instead of the number itself, you
     * can also provide a [PII token provided by
     * Stripe.js](https://stripe.com/docs/js/tokens_sources/create_token?type=pii).
     */
    @optional
    string id_number;

    /**
     * The Kanji variation of the person's last name (Japan only).
     */
    @optional
    string last_name_kanji;

    /**
     * Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an
     * object. This can be useful for storing additional information about the object in a
     * structured format. Individual keys can be unset by posting an empty value to them. All keys
     * can be unset by posting an empty value to `metadata`.
     */
    @optional
    Json metadata;

    /**
     * Specifies which fields in the response should be expanded.
     */
    @optional
    string[] expand;

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

    static class RelationshipSpecs {
      @optional
      Nullable!(bool) executive;

      @optional
      Nullable!(bool) owner;

      @optional
      Nullable!(bool) director;

      @optional
      Nullable!(bool) representative;

      @optional
      Json percent_ownership;

      @optional
      string title;

      mixin AddBuilder!(typeof(this));

    }

    /**
     * The relationship that this person has with the account's legal entity.
     */
    @optional
    RelationshipSpecs relationship;

    static class JapanAddressKanaSpecs {
      @optional
      string country;

      @optional
      string state;

      @optional
      string line1;

      @optional
      string town;

      @optional
      string postal_code;

      @optional
      string city;

      @optional
      string line2;

      mixin AddBuilder!(typeof(this));

    }

    /**
     * The Kana variation of the person's address (Japan only).
     */
    @optional
    JapanAddressKanaSpecs address_kana;

    /**
     * The country where the person is a national. Two-letter country code ([ISO 3166-1
     * alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2)), or "XX" if unavailable.
     */
    @optional
    string nationality;

    /**
     * The last four digits of the person's Social Security number (U.S. only).
     */
    @optional
    string ssn_last_4;

    /**
     * The Kanji variation of the person's first name (Japan only).
     */
    @optional
    string first_name_kanji;

    /**
     * The person's secondary ID number, as appropriate for their country, will be used for enhanced
     * verification checks. In Thailand, this would be the laser code found on the back of an ID
     * card. Instead of the number itself, you can also provide a [PII token provided by
     * Stripe.js](https://stripe.com/docs/js/tokens_sources/create_token?type=pii).
     */
    @optional
    string id_number_secondary;

    static class JapanAddressKanjiSpecs {
      @optional
      string country;

      @optional
      string state;

      @optional
      string line1;

      @optional
      string town;

      @optional
      string postal_code;

      @optional
      string city;

      @optional
      string line2;

      mixin AddBuilder!(typeof(this));

    }

    /**
     * The Kanji variation of the person's address (Japan only).
     */
    @optional
    JapanAddressKanjiSpecs address_kanji;

    mixin AddBuilder!(typeof(this));

  }

  static class PostAccountsAccountPeoplePersonResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(Person response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponseDefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        if (handleResponse200 is null) throw new Exception("Unhandled response status code 200");
        handleResponse200(deserializeJson!(Person)(res.readJson()));
        return;
      }
      if (handleResponseDefault is null) throw new Exception("Unhandled response status code default");
      handleResponseDefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

  }

  /**
   * <p>Updates an existing person.</p>
   * See_Also: HTTP POST `/v1/accounts/{account}/people/{person}`
   */
  void postAccountsAccountPeoplePerson(
      PostAccountsAccountPeoplePersonParams params,
      PostAccountsAccountPeoplePersonBody requestBody,
      PostAccountsAccountPeoplePersonResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/accounts/{account}/people/{person}");
    if (!params.account.isNull)
      requestor.setPathParam("account", params.account);
    if (!params.person.isNull)
      requestor.setPathParam("person", params.person);
    requestor.setHeaderParam("Content-Type", "application/x-www-form-urlencoded");
    Security.apply(requestor);
    requestor.makeRequest(requestBody, responseHandler);
  }

  static class DeleteAccountsAccountPeoplePersonParams {
    /**
     */
    string account;

    /**
     */
    string person;

    mixin AddBuilder!(typeof(this));

  }

  static class DeleteAccountsAccountPeoplePersonResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(DeletedPerson response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponseDefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        if (handleResponse200 is null) throw new Exception("Unhandled response status code 200");
        handleResponse200(deserializeJson!(DeletedPerson)(res.readJson()));
        return;
      }
      if (handleResponseDefault is null) throw new Exception("Unhandled response status code default");
      handleResponseDefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

  }

  /**
   * <p>Deletes an existing person’s relationship to the account’s legal entity. Any person with
   * a relationship for an account can be deleted through the API, except if the person is the
   * <code>account_opener</code>. If your integration is using the <code>executive</code> parameter,
   * you cannot delete the only verified <code>executive</code> on file.</p>
   * See_Also: HTTP DELETE `/v1/accounts/{account}/people/{person}`
   */
  void deleteAccountsAccountPeoplePerson(
      DeleteAccountsAccountPeoplePersonParams params,
      DeleteAccountsAccountPeoplePersonResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.DELETE,
        Servers.getServerUrl(),
        "/v1/accounts/{account}/people/{person}");
    if (!params.account.isNull)
      requestor.setPathParam("account", params.account);
    if (!params.person.isNull)
      requestor.setPathParam("person", params.person);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class GetAccountsParams {
    /**
     */
    Json created;

    /**
     * A cursor for use in pagination. `ending_before` is an object ID that defines your place in
     * the list. For instance, if you make a list request and receive 100 objects, starting with
     * `obj_bar`, your subsequent call can include `ending_before=obj_bar` in order to fetch the
     * previous page of the list.
     */
    string ending_before;

    /**
     * Specifies which fields in the response should be expanded.
     */
    string[] expand;

    /**
     * A limit on the number of objects to be returned. Limit can range between 1 and 100, and the
     * default is 10.
     */
    Nullable!(int) limit;

    /**
     * A cursor for use in pagination. `starting_after` is an object ID that defines your place in
     * the list. For instance, if you make a list request and receive 100 objects, ending with
     * `obj_foo`, your subsequent call can include `starting_after=obj_foo` in order to fetch the
     * next page of the list.
     */
    string starting_after;

    mixin AddBuilder!(typeof(this));

  }

  static class GetAccountsResponseHandler : ResponseHandler {

    static class AccountList {
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
      string object;

      @optional
      Account[] data;

      /**
       * The URL where this list can be accessed.
       */
      @optional
      string url;

      mixin AddBuilder!(typeof(this));

    }

    /**
     * Successful response.
     */
    void delegate(AccountList response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponseDefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        if (handleResponse200 is null) throw new Exception("Unhandled response status code 200");
        handleResponse200(deserializeJson!(AccountList)(res.readJson()));
        return;
      }
      if (handleResponseDefault is null) throw new Exception("Unhandled response status code default");
      handleResponseDefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

  }

  /**
   * <p>Returns a list of accounts connected to your platform via <a
   * href="/docs/connect">Connect</a>. If you’re not a platform, the list is empty.</p>
   * See_Also: HTTP GET `/v1/accounts`
   */
  void getAccounts(
      GetAccountsParams params,
      GetAccountsResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.GET,
        Servers.getServerUrl(),
        "/v1/accounts");
    if (!params.created.isNull)
      requestor.setQueryParam!("deepObject")("created", params.created);
    if (!params.ending_before.isNull)
      requestor.setQueryParam!("deepObject")("ending_before", params.ending_before);
    if (!params.expand.isNull)
      requestor.setQueryParam!("deepObject")("expand", params.expand);
    if (!params.limit.isNull)
      requestor.setQueryParam!("deepObject")("limit", params.limit);
    if (!params.starting_after.isNull)
      requestor.setQueryParam!("deepObject")("starting_after", params.starting_after);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class PostAccountsBody {
    /**
     * An [account token](https://stripe.com/docs/api#create_account_token), used to securely
     * provide details to the account.
     */
    @optional
    string account_token;

    /**
     * Three-letter ISO currency code representing the default currency for the account. This must
     * be a currency that [Stripe supports in the account's
     * country](https://stripe.com/docs/payouts).
     */
    @optional
    string default_currency;

    /**
     * Either a token, like the ones returned by [Stripe.js](https://stripe.com/docs/js), or a
     * dictionary containing a user's bank account details.
     */
    @optional
    Json bank_account;

    /**
     * The country in which the account holder resides, or in which the business is legally
     * established. This should be an ISO 3166-1 alpha-2 country code. For example, if you are in
     * the United States and the business for which you're creating an account is legally
     * represented in Canada, you would use `CA` as the country for the account being created.
     * Available countries include [Stripe's global markets](https://stripe.com/global) as well as
     * countries where [cross-border payouts](https://stripe.com/docs/connect/cross-border-payouts)
     * are supported.
     */
    @optional
    string country;

    /**
     * A card or bank account to attach to the account for receiving
     * [payouts](https://stripe.com/docs/connect/bank-debit-card-payouts) (you won’t be able to
     * use it for top-ups). You can provide either a token, like the ones returned by
     * [Stripe.js](https://stripe.com/docs/js), or a dictionary, as documented in the
     * `external_account` parameter for [bank
     * account](https://stripe.com/docs/api#account_create_bank_account) creation. <br><br>By
     * default, providing an external account sets it as the new default external account for its
     * currency, and deletes the old default if one exists. To add additional external accounts
     * without replacing the existing default for the currency, use the [bank
     * account](https://stripe.com/docs/api#account_create_bank_account) or [card
     * creation](https://stripe.com/docs/api#account_create_card) APIs.
     */
    @optional
    string external_account;

    /**
     * The email address of the account holder. This is only to make the account easier to identify
     * to you. Stripe only emails Custom accounts with your consent.
     */
    @optional
    string email;

    /**
     * Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an
     * object. This can be useful for storing additional information about the object in a
     * structured format. Individual keys can be unset by posting an empty value to them. All keys
     * can be unset by posting an empty value to `metadata`.
     */
    @optional
    Json metadata;

    static class BusinessProfileSpecs {
      @optional
      string mcc;

      @optional
      string product_description;

      static class AddressSpecs {
        @optional
        string line1;

        @optional
        string line2;

        @optional
        string country;

        @optional
        string postal_code;

        @optional
        string city;

        @optional
        string state;

        mixin AddBuilder!(typeof(this));

      }

      @optional
      AddressSpecs support_address;

      @optional
      Json support_url;

      @optional
      string url;

      @optional
      string name;

      @optional
      string support_email;

      @optional
      string support_phone;

      mixin AddBuilder!(typeof(this));

    }

    /**
     * Business information about the account.
     */
    @optional
    BusinessProfileSpecs business_profile;

    static class CapabilitiesParam {
      static class CapabilityParam {
        @optional
        Nullable!(bool) requested;

        mixin AddBuilder!(typeof(this));

      }

      @optional
      CapabilityParam konbini_payments;

      @optional
      CapabilityParam blik_payments;

      @optional
      CapabilityParam sepa_debit_payments;

      @optional
      CapabilityParam au_becs_debit_payments;

      @optional
      CapabilityParam card_issuing;

      @optional
      CapabilityParam oxxo_payments;

      @optional
      CapabilityParam ideal_payments;

      @optional
      CapabilityParam jcb_payments;

      @optional
      CapabilityParam us_bank_account_ach_payments;

      @optional
      CapabilityParam cartes_bancaires_payments;

      @optional
      CapabilityParam tax_reporting_us_1099_k;

      @optional
      CapabilityParam transfers;

      @optional
      CapabilityParam promptpay_payments;

      @optional
      CapabilityParam grabpay_payments;

      @optional
      CapabilityParam card_payments;

      @optional
      CapabilityParam bancontact_payments;

      @optional
      CapabilityParam sofort_payments;

      @optional
      CapabilityParam treasury;

      @optional
      CapabilityParam p24_payments;

      @optional
      CapabilityParam bacs_debit_payments;

      @optional
      CapabilityParam klarna_payments;

      @optional
      CapabilityParam legacy_payments;

      @optional
      CapabilityParam paynow_payments;

      @optional
      CapabilityParam afterpay_clearpay_payments;

      @optional
      CapabilityParam boleto_payments;

      @optional
      CapabilityParam fpx_payments;

      @optional
      CapabilityParam india_international_payments;

      @optional
      CapabilityParam tax_reporting_us_1099_misc;

      @optional
      CapabilityParam giropay_payments;

      @optional
      CapabilityParam bank_transfer_payments;

      @optional
      CapabilityParam eps_payments;

      @optional
      CapabilityParam affirm_payments;

      @optional
      CapabilityParam link_payments;

      @optional
      CapabilityParam acss_debit_payments;

      mixin AddBuilder!(typeof(this));

    }

    /**
     * Each key of the dictionary represents a capability, and each capability maps to its settings
     * (e.g. whether it has been requested or not). Each capability will be inactive until you have
     * provided its specific requirements and Stripe has verified them. An account may have some of
     * its requested capabilities be active and some be inactive.
     */
    @optional
    CapabilitiesParam capabilities;

    static class CompanySpecs {
      @optional
      string tax_id_registrar;

      @optional
      string structure;

      static class JapanAddressKanaSpecs {
        @optional
        string country;

        @optional
        string state;

        @optional
        string line1;

        @optional
        string town;

        @optional
        string postal_code;

        @optional
        string city;

        @optional
        string line2;

        mixin AddBuilder!(typeof(this));

      }

      @optional
      JapanAddressKanaSpecs address_kana;

      @optional
      Nullable!(bool) directors_provided;

      @optional
      string tax_id;

      @optional
      string registration_number;

      static class VerificationSpecs {
        static class VerificationDocumentSpecs {
          @optional
          string front;

          @optional
          string back;

          mixin AddBuilder!(typeof(this));

        }

        @optional
        VerificationDocumentSpecs document;

        mixin AddBuilder!(typeof(this));

      }

      @optional
      VerificationSpecs verification;

      @optional
      string name;

      @optional
      string phone;

      @optional
      string name_kana;

      static class AddressSpecs {
        @optional
        string line1;

        @optional
        string line2;

        @optional
        string country;

        @optional
        string postal_code;

        @optional
        string city;

        @optional
        string state;

        mixin AddBuilder!(typeof(this));

      }

      @optional
      AddressSpecs address;

      @optional
      Nullable!(bool) executives_provided;

      @optional
      Nullable!(bool) owners_provided;

      static class CompanyOwnershipDeclaration {
        @optional
        string ip;

        @optional
        Nullable!(long) date;

        @optional
        string user_agent;

        mixin AddBuilder!(typeof(this));

      }

      @optional
      CompanyOwnershipDeclaration ownership_declaration;

      @optional
      string vat_id;

      static class JapanAddressKanjiSpecs {
        @optional
        string country;

        @optional
        string state;

        @optional
        string line1;

        @optional
        string town;

        @optional
        string postal_code;

        @optional
        string city;

        @optional
        string line2;

        mixin AddBuilder!(typeof(this));

      }

      @optional
      JapanAddressKanjiSpecs address_kanji;

      @optional
      string name_kanji;

      mixin AddBuilder!(typeof(this));

    }

    /**
     * Information about the company or business. This field is available for any `business_type`.
     */
    @optional
    CompanySpecs company;

    static class SettingsSpecs {
      static class CardIssuingSettingsSpecs {
        static class SettingsTermsOfServiceSpecs {
          @optional
          string ip;

          @optional
          Nullable!(long) date;

          @optional
          string user_agent;

          mixin AddBuilder!(typeof(this));

        }

        @optional
        SettingsTermsOfServiceSpecs tos_acceptance;

        mixin AddBuilder!(typeof(this));

      }

      @optional
      CardIssuingSettingsSpecs card_issuing;

      static class PaymentsSettingsSpecs {
        @optional
        string statement_descriptor_kana;

        @optional
        string statement_descriptor;

        @optional
        string statement_descriptor_kanji;

        mixin AddBuilder!(typeof(this));

      }

      @optional
      PaymentsSettingsSpecs payments;

      static class PayoutSettingsSpecs {
        @optional
        string statement_descriptor;

        @optional
        Nullable!(bool) debit_negative_balances;

        static class TransferScheduleSpecs {
          @optional
          Nullable!(int) monthly_anchor;

          @optional
          Json delay_days;

          @optional
          string weekly_anchor;

          @optional
          string interval;

          mixin AddBuilder!(typeof(this));

        }

        @optional
        TransferScheduleSpecs schedule;

        mixin AddBuilder!(typeof(this));

      }

      @optional
      PayoutSettingsSpecs payouts;

      static class CardPaymentsSettingsSpecs {
        @optional
        Json statement_descriptor_prefix_kanji;

        @optional
        string statement_descriptor_prefix;

        @optional
        Json statement_descriptor_prefix_kana;

        static class DeclineChargeOnSpecs {
          @optional
          Nullable!(bool) cvc_failure;

          @optional
          Nullable!(bool) avs_failure;

          mixin AddBuilder!(typeof(this));

        }

        @optional
        DeclineChargeOnSpecs decline_on;

        mixin AddBuilder!(typeof(this));

      }

      @optional
      CardPaymentsSettingsSpecs card_payments;

      static class TreasurySettingsSpecs {
        static class SettingsTermsOfServiceSpecs {
          @optional
          string ip;

          @optional
          Nullable!(long) date;

          @optional
          string user_agent;

          mixin AddBuilder!(typeof(this));

        }

        @optional
        SettingsTermsOfServiceSpecs tos_acceptance;

        mixin AddBuilder!(typeof(this));

      }

      @optional
      TreasurySettingsSpecs treasury;

      static class BrandingSettingsSpecs {
        @optional
        string icon;

        @optional
        string logo;

        @optional
        string primary_color;

        @optional
        string secondary_color;

        mixin AddBuilder!(typeof(this));

      }

      @optional
      BrandingSettingsSpecs branding;

      mixin AddBuilder!(typeof(this));

    }

    /**
     * Options for customizing how the account functions within Stripe.
     */
    @optional
    SettingsSpecs settings;

    /**
     * Specifies which fields in the response should be expanded.
     */
    @optional
    string[] expand;

    /**
     * The business type.
     */
    @optional
    string business_type;

    static class DocumentsSpecs {
      static class DocumentsParam {
        @optional
        string[] files;

        mixin AddBuilder!(typeof(this));

      }

      @optional
      DocumentsParam bank_account_ownership_verification;

      @optional
      DocumentsParam proof_of_registration;

      @optional
      DocumentsParam company_tax_id_verification;

      @optional
      DocumentsParam company_memorandum_of_association;

      @optional
      DocumentsParam company_registration_verification;

      @optional
      DocumentsParam company_license;

      @optional
      DocumentsParam company_ministerial_decree;

      mixin AddBuilder!(typeof(this));

    }

    /**
     * Documents that may be submitted to satisfy various informational requests.
     */
    @optional
    DocumentsSpecs documents;

    static class IndividualSpecs {
      @optional
      string email;

      static class JapanAddressKanaSpecs {
        @optional
        string country;

        @optional
        string state;

        @optional
        string line1;

        @optional
        string town;

        @optional
        string postal_code;

        @optional
        string city;

        @optional
        string line2;

        mixin AddBuilder!(typeof(this));

      }

      @optional
      JapanAddressKanaSpecs address_kana;

      @optional
      string last_name_kanji;

      static class AddressSpecs {
        @optional
        string line1;

        @optional
        string line2;

        @optional
        string country;

        @optional
        string postal_code;

        @optional
        string city;

        @optional
        string state;

        mixin AddBuilder!(typeof(this));

      }

      @optional
      AddressSpecs registered_address;

      @optional
      Json full_name_aliases;

      @optional
      Json metadata;

      @optional
      string first_name;

      @optional
      string last_name;

      @optional
      string political_exposure;

      @optional
      string first_name_kanji;

      @optional
      string maiden_name;

      @optional
      string phone;

      @optional
      string ssn_last_4;

      @optional
      string last_name_kana;

      @optional
      AddressSpecs address;

      @optional
      string gender;

      static class PersonVerificationSpecs {
        static class PersonVerificationDocumentSpecs {
          @optional
          string front;

          @optional
          string back;

          mixin AddBuilder!(typeof(this));

        }

        @optional
        PersonVerificationDocumentSpecs additional_document;

        @optional
        PersonVerificationDocumentSpecs document;

        mixin AddBuilder!(typeof(this));

      }

      @optional
      PersonVerificationSpecs verification;

      @optional
      Json dob;

      @optional
      string first_name_kana;

      @optional
      string id_number_secondary;

      static class JapanAddressKanjiSpecs {
        @optional
        string country;

        @optional
        string state;

        @optional
        string line1;

        @optional
        string town;

        @optional
        string postal_code;

        @optional
        string city;

        @optional
        string line2;

        mixin AddBuilder!(typeof(this));

      }

      @optional
      JapanAddressKanjiSpecs address_kanji;

      @optional
      string id_number;

      mixin AddBuilder!(typeof(this));

    }

    /**
     * Information about the person represented by the account. This field is null unless
     * `business_type` is set to `individual`.
     */
    @optional
    IndividualSpecs individual;

    static class TosAcceptanceSpecs {
      @optional
      string service_agreement;

      @optional
      string ip;

      @optional
      Nullable!(long) date;

      @optional
      string user_agent;

      mixin AddBuilder!(typeof(this));

    }

    /**
     * Details on the account's acceptance of the [Stripe Services
     * Agreement](https://stripe.com/docs/connect/updating-accounts#tos-acceptance).
     */
    @optional
    TosAcceptanceSpecs tos_acceptance;

    /**
     * The type of Stripe account to create. May be one of `custom`, `express` or `standard`.
     */
    @optional
    string type;

    mixin AddBuilder!(typeof(this));

  }

  static class PostAccountsResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(Account response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponseDefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        if (handleResponse200 is null) throw new Exception("Unhandled response status code 200");
        handleResponse200(deserializeJson!(Account)(res.readJson()));
        return;
      }
      if (handleResponseDefault is null) throw new Exception("Unhandled response status code default");
      handleResponseDefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

  }

  /**
   * <p>With <a href="/docs/connect">Connect</a>, you can create Stripe accounts for your users.
   * To do this, you’ll first need to <a
   * href="https://dashboard.stripe.com/account/applications/settings">register your
   * platform</a>.</p>
   * See_Also: HTTP POST `/v1/accounts`
   */
  void postAccounts(
      PostAccountsBody requestBody,
      PostAccountsResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/accounts");
    requestor.setHeaderParam("Content-Type", "application/x-www-form-urlencoded");
    Security.apply(requestor);
    requestor.makeRequest(requestBody, responseHandler);
  }

  static class GetAccountsAccountCapabilitiesCapabilityParams {
    /**
     */
    string account;

    /**
     */
    string capability;

    /**
     * Specifies which fields in the response should be expanded.
     */
    string[] expand;

    mixin AddBuilder!(typeof(this));

  }

  static class GetAccountsAccountCapabilitiesCapabilityResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(Capability response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponseDefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        if (handleResponse200 is null) throw new Exception("Unhandled response status code 200");
        handleResponse200(deserializeJson!(Capability)(res.readJson()));
        return;
      }
      if (handleResponseDefault is null) throw new Exception("Unhandled response status code default");
      handleResponseDefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

  }

  /**
   * <p>Retrieves information about the specified Account Capability.</p>
   * See_Also: HTTP GET `/v1/accounts/{account}/capabilities/{capability}`
   */
  void getAccountsAccountCapabilitiesCapability(
      GetAccountsAccountCapabilitiesCapabilityParams params,
      GetAccountsAccountCapabilitiesCapabilityResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.GET,
        Servers.getServerUrl(),
        "/v1/accounts/{account}/capabilities/{capability}");
    if (!params.account.isNull)
      requestor.setPathParam("account", params.account);
    if (!params.capability.isNull)
      requestor.setPathParam("capability", params.capability);
    if (!params.expand.isNull)
      requestor.setQueryParam!("deepObject")("expand", params.expand);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class PostAccountsAccountCapabilitiesCapabilityParams {
    /**
     */
    string account;

    /**
     */
    string capability;

    mixin AddBuilder!(typeof(this));

  }

  static class PostAccountsAccountCapabilitiesCapabilityBody {
    /**
     * Specifies which fields in the response should be expanded.
     */
    @optional
    string[] expand;

    /**
     * Passing true requests the capability for the account, if it is not already requested. A
     * requested capability may not immediately become active. Any requirements to activate the
     * capability are returned in the `requirements` arrays.
     */
    @optional
    Nullable!(bool) requested;

    mixin AddBuilder!(typeof(this));

  }

  static class PostAccountsAccountCapabilitiesCapabilityResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(Capability response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponseDefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        if (handleResponse200 is null) throw new Exception("Unhandled response status code 200");
        handleResponse200(deserializeJson!(Capability)(res.readJson()));
        return;
      }
      if (handleResponseDefault is null) throw new Exception("Unhandled response status code default");
      handleResponseDefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

  }

  /**
   * <p>Updates an existing Account Capability.</p>
   * See_Also: HTTP POST `/v1/accounts/{account}/capabilities/{capability}`
   */
  void postAccountsAccountCapabilitiesCapability(
      PostAccountsAccountCapabilitiesCapabilityParams params,
      PostAccountsAccountCapabilitiesCapabilityBody requestBody,
      PostAccountsAccountCapabilitiesCapabilityResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/accounts/{account}/capabilities/{capability}");
    if (!params.account.isNull)
      requestor.setPathParam("account", params.account);
    if (!params.capability.isNull)
      requestor.setPathParam("capability", params.capability);
    requestor.setHeaderParam("Content-Type", "application/x-www-form-urlencoded");
    Security.apply(requestor);
    requestor.makeRequest(requestBody, responseHandler);
  }

  static class PostAccountsAccountRejectParams {
    /**
     */
    string account;

    mixin AddBuilder!(typeof(this));

  }

  static class PostAccountsAccountRejectBody {
    /**
     * The reason for rejecting the account. Can be `fraud`, `terms_of_service`, or `other`.
     */
    @optional
    string reason;

    /**
     * Specifies which fields in the response should be expanded.
     */
    @optional
    string[] expand;

    mixin AddBuilder!(typeof(this));

  }

  static class PostAccountsAccountRejectResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(Account response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponseDefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        if (handleResponse200 is null) throw new Exception("Unhandled response status code 200");
        handleResponse200(deserializeJson!(Account)(res.readJson()));
        return;
      }
      if (handleResponseDefault is null) throw new Exception("Unhandled response status code default");
      handleResponseDefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

  }

  /**
   * <p>With <a href="/docs/connect">Connect</a>, you may flag accounts as suspicious.</p>
   * <p>Test-mode Custom and Express accounts can be rejected at any time. Accounts created using
   * live-mode keys may only be rejected once all balances are zero.</p>
   * See_Also: HTTP POST `/v1/accounts/{account}/reject`
   */
  void postAccountsAccountReject(
      PostAccountsAccountRejectParams params,
      PostAccountsAccountRejectBody requestBody,
      PostAccountsAccountRejectResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/accounts/{account}/reject");
    if (!params.account.isNull)
      requestor.setPathParam("account", params.account);
    requestor.setHeaderParam("Content-Type", "application/x-www-form-urlencoded");
    Security.apply(requestor);
    requestor.makeRequest(requestBody, responseHandler);
  }

  static class GetAccountsAccountPersonsPersonParams {
    /**
     */
    string account;

    /**
     * Specifies which fields in the response should be expanded.
     */
    string[] expand;

    /**
     */
    string person;

    mixin AddBuilder!(typeof(this));

  }

  static class GetAccountsAccountPersonsPersonResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(Person response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponseDefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        if (handleResponse200 is null) throw new Exception("Unhandled response status code 200");
        handleResponse200(deserializeJson!(Person)(res.readJson()));
        return;
      }
      if (handleResponseDefault is null) throw new Exception("Unhandled response status code default");
      handleResponseDefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

  }

  /**
   * <p>Retrieves an existing person.</p>
   * See_Also: HTTP GET `/v1/accounts/{account}/persons/{person}`
   */
  void getAccountsAccountPersonsPerson(
      GetAccountsAccountPersonsPersonParams params,
      GetAccountsAccountPersonsPersonResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.GET,
        Servers.getServerUrl(),
        "/v1/accounts/{account}/persons/{person}");
    if (!params.account.isNull)
      requestor.setPathParam("account", params.account);
    if (!params.expand.isNull)
      requestor.setQueryParam!("deepObject")("expand", params.expand);
    if (!params.person.isNull)
      requestor.setPathParam("person", params.person);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class PostAccountsAccountPersonsPersonParams {
    /**
     */
    string account;

    /**
     */
    string person;

    mixin AddBuilder!(typeof(this));

  }

  static class PostAccountsAccountPersonsPersonBody {
    /**
     * The person's email address.
     */
    @optional
    string email;

    /**
     * The person's last name.
     */
    @optional
    string last_name;

    static class PersonVerificationSpecs {
      static class PersonVerificationDocumentSpecs {
        @optional
        string front;

        @optional
        string back;

        mixin AddBuilder!(typeof(this));

      }

      @optional
      PersonVerificationDocumentSpecs additional_document;

      @optional
      PersonVerificationDocumentSpecs document;

      mixin AddBuilder!(typeof(this));

    }

    /**
     * The person's verification status.
     */
    @optional
    PersonVerificationSpecs verification;

    static class AddressSpecs {
      @optional
      string line1;

      @optional
      string line2;

      @optional
      string country;

      @optional
      string postal_code;

      @optional
      string city;

      @optional
      string state;

      mixin AddBuilder!(typeof(this));

    }

    /**
     * The person's address.
     */
    @optional
    AddressSpecs address;

    static class PersonDocumentsSpecs {
      static class DocumentsParam {
        @optional
        string[] files;

        mixin AddBuilder!(typeof(this));

      }

      @optional
      DocumentsParam passport;

      @optional
      DocumentsParam company_authorization;

      @optional
      DocumentsParam visa;

      mixin AddBuilder!(typeof(this));

    }

    /**
     * Documents that may be submitted to satisfy various informational requests.
     */
    @optional
    PersonDocumentsSpecs documents;

    /**
     * The person's registered address.
     */
    @optional
    AddressSpecs registered_address;

    /**
     * A list of alternate names or aliases that the person is known by.
     */
    @optional
    Json full_name_aliases;

    /**
     * The person's first name.
     */
    @optional
    string first_name;

    /**
     * A [person token](https://stripe.com/docs/connect/account-tokens), used to securely provide
     * details to the person.
     */
    @optional
    string person_token;

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
     * The person's date of birth.
     */
    @optional
    Json dob;

    /**
     * The person's ID number, as appropriate for their country. For example, a social security
     * number in the U.S., social insurance number in Canada, etc. Instead of the number itself, you
     * can also provide a [PII token provided by
     * Stripe.js](https://stripe.com/docs/js/tokens_sources/create_token?type=pii).
     */
    @optional
    string id_number;

    /**
     * The Kanji variation of the person's last name (Japan only).
     */
    @optional
    string last_name_kanji;

    /**
     * Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an
     * object. This can be useful for storing additional information about the object in a
     * structured format. Individual keys can be unset by posting an empty value to them. All keys
     * can be unset by posting an empty value to `metadata`.
     */
    @optional
    Json metadata;

    /**
     * Specifies which fields in the response should be expanded.
     */
    @optional
    string[] expand;

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

    static class RelationshipSpecs {
      @optional
      Nullable!(bool) executive;

      @optional
      Nullable!(bool) owner;

      @optional
      Nullable!(bool) director;

      @optional
      Nullable!(bool) representative;

      @optional
      Json percent_ownership;

      @optional
      string title;

      mixin AddBuilder!(typeof(this));

    }

    /**
     * The relationship that this person has with the account's legal entity.
     */
    @optional
    RelationshipSpecs relationship;

    static class JapanAddressKanaSpecs {
      @optional
      string country;

      @optional
      string state;

      @optional
      string line1;

      @optional
      string town;

      @optional
      string postal_code;

      @optional
      string city;

      @optional
      string line2;

      mixin AddBuilder!(typeof(this));

    }

    /**
     * The Kana variation of the person's address (Japan only).
     */
    @optional
    JapanAddressKanaSpecs address_kana;

    /**
     * The country where the person is a national. Two-letter country code ([ISO 3166-1
     * alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2)), or "XX" if unavailable.
     */
    @optional
    string nationality;

    /**
     * The last four digits of the person's Social Security number (U.S. only).
     */
    @optional
    string ssn_last_4;

    /**
     * The Kanji variation of the person's first name (Japan only).
     */
    @optional
    string first_name_kanji;

    /**
     * The person's secondary ID number, as appropriate for their country, will be used for enhanced
     * verification checks. In Thailand, this would be the laser code found on the back of an ID
     * card. Instead of the number itself, you can also provide a [PII token provided by
     * Stripe.js](https://stripe.com/docs/js/tokens_sources/create_token?type=pii).
     */
    @optional
    string id_number_secondary;

    static class JapanAddressKanjiSpecs {
      @optional
      string country;

      @optional
      string state;

      @optional
      string line1;

      @optional
      string town;

      @optional
      string postal_code;

      @optional
      string city;

      @optional
      string line2;

      mixin AddBuilder!(typeof(this));

    }

    /**
     * The Kanji variation of the person's address (Japan only).
     */
    @optional
    JapanAddressKanjiSpecs address_kanji;

    mixin AddBuilder!(typeof(this));

  }

  static class PostAccountsAccountPersonsPersonResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(Person response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponseDefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        if (handleResponse200 is null) throw new Exception("Unhandled response status code 200");
        handleResponse200(deserializeJson!(Person)(res.readJson()));
        return;
      }
      if (handleResponseDefault is null) throw new Exception("Unhandled response status code default");
      handleResponseDefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

  }

  /**
   * <p>Updates an existing person.</p>
   * See_Also: HTTP POST `/v1/accounts/{account}/persons/{person}`
   */
  void postAccountsAccountPersonsPerson(
      PostAccountsAccountPersonsPersonParams params,
      PostAccountsAccountPersonsPersonBody requestBody,
      PostAccountsAccountPersonsPersonResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/accounts/{account}/persons/{person}");
    if (!params.account.isNull)
      requestor.setPathParam("account", params.account);
    if (!params.person.isNull)
      requestor.setPathParam("person", params.person);
    requestor.setHeaderParam("Content-Type", "application/x-www-form-urlencoded");
    Security.apply(requestor);
    requestor.makeRequest(requestBody, responseHandler);
  }

  static class DeleteAccountsAccountPersonsPersonParams {
    /**
     */
    string account;

    /**
     */
    string person;

    mixin AddBuilder!(typeof(this));

  }

  static class DeleteAccountsAccountPersonsPersonResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(DeletedPerson response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponseDefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        if (handleResponse200 is null) throw new Exception("Unhandled response status code 200");
        handleResponse200(deserializeJson!(DeletedPerson)(res.readJson()));
        return;
      }
      if (handleResponseDefault is null) throw new Exception("Unhandled response status code default");
      handleResponseDefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

  }

  /**
   * <p>Deletes an existing person’s relationship to the account’s legal entity. Any person with
   * a relationship for an account can be deleted through the API, except if the person is the
   * <code>account_opener</code>. If your integration is using the <code>executive</code> parameter,
   * you cannot delete the only verified <code>executive</code> on file.</p>
   * See_Also: HTTP DELETE `/v1/accounts/{account}/persons/{person}`
   */
  void deleteAccountsAccountPersonsPerson(
      DeleteAccountsAccountPersonsPersonParams params,
      DeleteAccountsAccountPersonsPersonResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.DELETE,
        Servers.getServerUrl(),
        "/v1/accounts/{account}/persons/{person}");
    if (!params.account.isNull)
      requestor.setPathParam("account", params.account);
    if (!params.person.isNull)
      requestor.setPathParam("person", params.person);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class PostAccountsAccountBankAccountsParams {
    /**
     */
    string account;

    mixin AddBuilder!(typeof(this));

  }

  static class PostAccountsAccountBankAccountsBody {
    /**
     * Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an
     * object. This can be useful for storing additional information about the object in a
     * structured format. Individual keys can be unset by posting an empty value to them. All keys
     * can be unset by posting an empty value to `metadata`.
     */
    @optional
    string[string] metadata;

    /**
     * Either a token, like the ones returned by [Stripe.js](https://stripe.com/docs/js), or a
     * dictionary containing a user's bank account details.
     */
    @optional
    Json bank_account;

    /**
     * Specifies which fields in the response should be expanded.
     */
    @optional
    string[] expand;

    /**
     * Please refer to full [documentation](https://stripe.com/docs/api) instead.
     */
    @optional
    string external_account;

    /**
     * When set to true, or if this is the first external account added in this currency, this
     * account becomes the default external account for its currency.
     */
    @optional
    Nullable!(bool) default_for_currency;

    mixin AddBuilder!(typeof(this));

  }

  static class PostAccountsAccountBankAccountsResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(ExternalAccount response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponseDefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        if (handleResponse200 is null) throw new Exception("Unhandled response status code 200");
        handleResponse200(deserializeJson!(ExternalAccount)(res.readJson()));
        return;
      }
      if (handleResponseDefault is null) throw new Exception("Unhandled response status code default");
      handleResponseDefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

  }

  /**
   * <p>Create an external account for a given account.</p>
   * See_Also: HTTP POST `/v1/accounts/{account}/bank_accounts`
   */
  void postAccountsAccountBankAccounts(
      PostAccountsAccountBankAccountsParams params,
      PostAccountsAccountBankAccountsBody requestBody,
      PostAccountsAccountBankAccountsResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/accounts/{account}/bank_accounts");
    if (!params.account.isNull)
      requestor.setPathParam("account", params.account);
    requestor.setHeaderParam("Content-Type", "application/x-www-form-urlencoded");
    Security.apply(requestor);
    requestor.makeRequest(requestBody, responseHandler);
  }

  static class GetAccountsAccountExternalAccountsParams {
    /**
     */
    string account;

    /**
     * A cursor for use in pagination. `ending_before` is an object ID that defines your place in
     * the list. For instance, if you make a list request and receive 100 objects, starting with
     * `obj_bar`, your subsequent call can include `ending_before=obj_bar` in order to fetch the
     * previous page of the list.
     */
    string ending_before;

    /**
     * Specifies which fields in the response should be expanded.
     */
    string[] expand;

    /**
     * A limit on the number of objects to be returned. Limit can range between 1 and 100, and the
     * default is 10.
     */
    Nullable!(int) limit;

    /**
     * A cursor for use in pagination. `starting_after` is an object ID that defines your place in
     * the list. For instance, if you make a list request and receive 100 objects, ending with
     * `obj_foo`, your subsequent call can include `starting_after=obj_foo` in order to fetch the
     * next page of the list.
     */
    string starting_after;

    mixin AddBuilder!(typeof(this));

  }

  static class GetAccountsAccountExternalAccountsResponseHandler : ResponseHandler {

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
      string object;

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
      string url;

      mixin AddBuilder!(typeof(this));

    }

    /**
     * Successful response.
     */
    void delegate(ExternalAccountList response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponseDefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        if (handleResponse200 is null) throw new Exception("Unhandled response status code 200");
        handleResponse200(deserializeJson!(ExternalAccountList)(res.readJson()));
        return;
      }
      if (handleResponseDefault is null) throw new Exception("Unhandled response status code default");
      handleResponseDefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

  }

  /**
   * <p>List external accounts for an account.</p>
   * See_Also: HTTP GET `/v1/accounts/{account}/external_accounts`
   */
  void getAccountsAccountExternalAccounts(
      GetAccountsAccountExternalAccountsParams params,
      GetAccountsAccountExternalAccountsResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.GET,
        Servers.getServerUrl(),
        "/v1/accounts/{account}/external_accounts");
    if (!params.account.isNull)
      requestor.setPathParam("account", params.account);
    if (!params.ending_before.isNull)
      requestor.setQueryParam!("deepObject")("ending_before", params.ending_before);
    if (!params.expand.isNull)
      requestor.setQueryParam!("deepObject")("expand", params.expand);
    if (!params.limit.isNull)
      requestor.setQueryParam!("deepObject")("limit", params.limit);
    if (!params.starting_after.isNull)
      requestor.setQueryParam!("deepObject")("starting_after", params.starting_after);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class PostAccountsAccountExternalAccountsParams {
    /**
     */
    string account;

    mixin AddBuilder!(typeof(this));

  }

  static class PostAccountsAccountExternalAccountsBody {
    /**
     * Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an
     * object. This can be useful for storing additional information about the object in a
     * structured format. Individual keys can be unset by posting an empty value to them. All keys
     * can be unset by posting an empty value to `metadata`.
     */
    @optional
    string[string] metadata;

    /**
     * Either a token, like the ones returned by [Stripe.js](https://stripe.com/docs/js), or a
     * dictionary containing a user's bank account details.
     */
    @optional
    Json bank_account;

    /**
     * Specifies which fields in the response should be expanded.
     */
    @optional
    string[] expand;

    /**
     * Please refer to full [documentation](https://stripe.com/docs/api) instead.
     */
    @optional
    string external_account;

    /**
     * When set to true, or if this is the first external account added in this currency, this
     * account becomes the default external account for its currency.
     */
    @optional
    Nullable!(bool) default_for_currency;

    mixin AddBuilder!(typeof(this));

  }

  static class PostAccountsAccountExternalAccountsResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(ExternalAccount response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponseDefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        if (handleResponse200 is null) throw new Exception("Unhandled response status code 200");
        handleResponse200(deserializeJson!(ExternalAccount)(res.readJson()));
        return;
      }
      if (handleResponseDefault is null) throw new Exception("Unhandled response status code default");
      handleResponseDefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

  }

  /**
   * <p>Create an external account for a given account.</p>
   * See_Also: HTTP POST `/v1/accounts/{account}/external_accounts`
   */
  void postAccountsAccountExternalAccounts(
      PostAccountsAccountExternalAccountsParams params,
      PostAccountsAccountExternalAccountsBody requestBody,
      PostAccountsAccountExternalAccountsResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/accounts/{account}/external_accounts");
    if (!params.account.isNull)
      requestor.setPathParam("account", params.account);
    requestor.setHeaderParam("Content-Type", "application/x-www-form-urlencoded");
    Security.apply(requestor);
    requestor.makeRequest(requestBody, responseHandler);
  }

  static class GetAccountsAccountCapabilitiesParams {
    /**
     */
    string account;

    /**
     * Specifies which fields in the response should be expanded.
     */
    string[] expand;

    mixin AddBuilder!(typeof(this));

  }

  static class GetAccountsAccountCapabilitiesResponseHandler : ResponseHandler {

    static class ListAccountCapability {
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
      string object;

      @optional
      Capability[] data;

      /**
       * The URL where this list can be accessed.
       */
      @optional
      string url;

      mixin AddBuilder!(typeof(this));

    }

    /**
     * Successful response.
     */
    void delegate(ListAccountCapability response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponseDefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        if (handleResponse200 is null) throw new Exception("Unhandled response status code 200");
        handleResponse200(deserializeJson!(ListAccountCapability)(res.readJson()));
        return;
      }
      if (handleResponseDefault is null) throw new Exception("Unhandled response status code default");
      handleResponseDefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

  }

  /**
   * <p>Returns a list of capabilities associated with the account. The capabilities are returned
   * sorted by creation date, with the most recent capability appearing first.</p>
   * See_Also: HTTP GET `/v1/accounts/{account}/capabilities`
   */
  void getAccountsAccountCapabilities(
      GetAccountsAccountCapabilitiesParams params,
      GetAccountsAccountCapabilitiesResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.GET,
        Servers.getServerUrl(),
        "/v1/accounts/{account}/capabilities");
    if (!params.account.isNull)
      requestor.setPathParam("account", params.account);
    if (!params.expand.isNull)
      requestor.setQueryParam!("deepObject")("expand", params.expand);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  mixin AddBuilder!(typeof(this));

}

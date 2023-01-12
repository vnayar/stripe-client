// File automatically generated from OpenAPI spec.
module stripe.service.v1_tokens_service;

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

public import stripe.model.error : Error_;
public import stripe.model.token : Token;

/**
 * Service to make REST API calls to paths beginning with: /v1/tokens
 */
class V1TokensService {
  static class GetTokensTokenParams {
    /**
     * Specifies which fields in the response should be expanded.
     */
    string[] expand;

    /**
     */
    string token;

    mixin AddBuilder!(typeof(this));

  }

  static class GetTokensTokenResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(Token response) handleResponse200;

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
        handleResponse200(deserializeJson!(Token)(res.readJson()));
        return;
      }
      if (handleResponseDefault is null) throw new Exception("Unhandled response status code default");
      handleResponseDefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

  }

  /**
   * <p>Retrieves the token with the given ID.</p>
   * See_Also: HTTP GET `/v1/tokens/{token}`
   */
  void getTokensToken(
      GetTokensTokenParams params,
      GetTokensTokenResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.GET,
        Servers.getServerUrl(),
        "/v1/tokens/{token}");
    if (!params.expand.isNull)
      requestor.setQueryParam!("deepObject")("expand", params.expand);
    if (!params.token.isNull)
      requestor.setPathParam("token", params.token);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class PostTokensBody {
    static class PiiTokenSpecs {
      @optional
      string id_number;

      mixin AddBuilder!(typeof(this));

    }

    /**
     * The PII this token will represent.
     */
    @optional
    PiiTokenSpecs pii;

    static class TokenCreateBankAccount {
      @optional
      string country;

      @optional
      string routing_number;

      @optional
      string account_number;

      @optional
      string currency;

      @optional
      string account_holder_name;

      @optional
      string account_holder_type;

      @optional
      string account_type;

      mixin AddBuilder!(typeof(this));

    }

    /**
     * The bank account this token will represent.
     */
    @optional
    TokenCreateBankAccount bank_account;

    /**
     * The customer (owned by the application's account) for which to create a token. This can be
     * used only with an [OAuth access token](https://stripe.com/docs/connect/standard-accounts) or
     * [Stripe-Account header](https://stripe.com/docs/connect/authentication). For more details,
     * see [Cloning Saved Payment
     * Methods](https://stripe.com/docs/connect/cloning-saved-payment-methods).
     */
    @optional
    string customer;

    @optional
    Json card;

    /**
     * Specifies which fields in the response should be expanded.
     */
    @optional
    string[] expand;

    static class CvcParams {
      @optional
      string cvc;

      mixin AddBuilder!(typeof(this));

    }

    /**
     * The updated CVC value this token will represent.
     */
    @optional
    CvcParams cvc_update;

    static class ConnectJsAccountTokenSpecs {
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

      @optional
      IndividualSpecs individual;

      static class ConnectJsAccountTokenCompanySpecs {
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
        Nullable!(bool) ownership_declaration_shown_and_signed;

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

      @optional
      ConnectJsAccountTokenCompanySpecs company;

      @optional
      Nullable!(bool) tos_shown_and_accepted;

      @optional
      string business_type;

      mixin AddBuilder!(typeof(this));

    }

    /**
     * Information for the account this token will represent.
     */
    @optional
    ConnectJsAccountTokenSpecs account;

    static class PersonTokenSpecs {
      @optional
      string email;

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
      string nationality;

      @optional
      string ssn_last_4;

      @optional
      string last_name_kana;

      @optional
      string phone;

      @optional
      AddressSpecs address;

      @optional
      string gender;

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

      @optional
      PersonDocumentsSpecs documents;

      @optional
      Json dob;

      @optional
      string first_name_kana;

      @optional
      string id_number_secondary;

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
     * Information for the person this token will represent.
     */
    @optional
    PersonTokenSpecs person;

    mixin AddBuilder!(typeof(this));

  }

  static class PostTokensResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(Token response) handleResponse200;

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
        handleResponse200(deserializeJson!(Token)(res.readJson()));
        return;
      }
      if (handleResponseDefault is null) throw new Exception("Unhandled response status code default");
      handleResponseDefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

  }

  /**
   * <p>Creates a single-use token that represents a bank account’s details.
   * This token can be used with any API method in place of a bank account dictionary. This token
   * can be used only once, by attaching it to a <a href="#accounts">Custom account</a>.</p>
   * See_Also: HTTP POST `/v1/tokens`
   */
  void postTokens(
      PostTokensBody requestBody,
      PostTokensResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/tokens");
    requestor.setHeaderParam("Content-Type", "application/x-www-form-urlencoded");
    Security.apply(requestor);
    requestor.makeRequest(requestBody, responseHandler);
  }

  mixin AddBuilder!(typeof(this));

}

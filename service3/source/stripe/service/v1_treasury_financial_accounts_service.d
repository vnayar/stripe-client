// File automatically generated from OpenAPI spec.
module stripe.service.v1_treasury_financial_accounts_service;

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
public import stripe.model.treasury.financial_account : TreasuryFinancialAccount;
public import stripe.model.treasury.financial_account_features : TreasuryFinancialAccountFeatures;

/**
 * Service to make REST API calls to paths beginning with: /v1/treasury/financial_accounts
 */
class V1TreasuryFinancialAccountsService {
  static class GetTreasuryFinancialAccountsParams {
    /**
     */
    Json created;

    /**
     * An object ID cursor for use in pagination.
     */
    string ending_before;

    /**
     * Specifies which fields in the response should be expanded.
     */
    string[] expand;

    /**
     * A limit ranging from 1 to 100 (defaults to 10).
     */
    Nullable!(int) limit;

    /**
     * An object ID cursor for use in pagination.
     */
    string starting_after;

    mixin AddBuilder!(typeof(this));

  }

  static class GetTreasuryFinancialAccountsResponseHandler : ResponseHandler {

    static class TreasuryFinancialAccountsResourceFinancialAccountList {
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
      TreasuryFinancialAccount[] data;

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
    void delegate(TreasuryFinancialAccountsResourceFinancialAccountList response) handleResponse200;

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
        handleResponse200(deserializeJson!(TreasuryFinancialAccountsResourceFinancialAccountList)(res.readJson()));
        return;
      }
      if (handleResponseDefault is null) throw new Exception("Unhandled response status code default");
      handleResponseDefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

  }

  /**
   * <p>Returns a list of FinancialAccounts.</p>
   * See_Also: HTTP GET `/v1/treasury/financial_accounts`
   */
  void getTreasuryFinancialAccounts(
      GetTreasuryFinancialAccountsParams params,
      GetTreasuryFinancialAccountsResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.GET,
        Servers.getServerUrl(),
        "/v1/treasury/financial_accounts");
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

  static class PostTreasuryFinancialAccountsBody {
    static class PlatformRestrictions {
      @optional
      string inbound_flows;

      @optional
      string outbound_flows;

      mixin AddBuilder!(typeof(this));

    }

    /**
     * The set of functionalities that the platform can restrict on the FinancialAccount.
     */
    @optional
    PlatformRestrictions platform_restrictions;

    /**
     * Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an
     * object. This can be useful for storing additional information about the object in a
     * structured format. Individual keys can be unset by posting an empty value to them. All keys
     * can be unset by posting an empty value to `metadata`.
     */
    @optional
    string[string] metadata;

    /**
     * Specifies which fields in the response should be expanded.
     */
    @optional
    string[] expand;

    static class FeatureAccess {
      static class OutboundPayments {
        static class Access {
          @optional
          Nullable!(bool) requested;

          mixin AddBuilder!(typeof(this));

        }

        @optional
        Access us_domestic_wire;

        static class AccessWithAchDetails {
          @optional
          Nullable!(bool) requested;

          mixin AddBuilder!(typeof(this));

        }

        @optional
        AccessWithAchDetails ach;

        mixin AddBuilder!(typeof(this));

      }

      @optional
      OutboundPayments outbound_payments;

      static class FinancialAddresses {
        static class Access {
          @optional
          Nullable!(bool) requested;

          mixin AddBuilder!(typeof(this));

        }

        @optional
        Access aba;

        mixin AddBuilder!(typeof(this));

      }

      @optional
      FinancialAddresses financial_addresses;

      static class Access {
        @optional
        Nullable!(bool) requested;

        mixin AddBuilder!(typeof(this));

      }

      @optional
      Access card_issuing;

      @optional
      Access deposit_insurance;

      static class OutboundTransfers {
        static class Access {
          @optional
          Nullable!(bool) requested;

          mixin AddBuilder!(typeof(this));

        }

        @optional
        Access us_domestic_wire;

        static class AccessWithAchDetails {
          @optional
          Nullable!(bool) requested;

          mixin AddBuilder!(typeof(this));

        }

        @optional
        AccessWithAchDetails ach;

        mixin AddBuilder!(typeof(this));

      }

      @optional
      OutboundTransfers outbound_transfers;

      static class InboundTransfers {
        static class AccessWithAchDetails {
          @optional
          Nullable!(bool) requested;

          mixin AddBuilder!(typeof(this));

        }

        @optional
        AccessWithAchDetails ach;

        mixin AddBuilder!(typeof(this));

      }

      @optional
      InboundTransfers inbound_transfers;

      @optional
      Access intra_stripe_flows;

      mixin AddBuilder!(typeof(this));

    }

    /**
     * Encodes whether a FinancialAccount has access to a particular feature. Stripe or the platform
     * can control features via the requested field.
     */
    @optional
    FeatureAccess features;

    /**
     * The currencies the FinancialAccount can hold a balance in.
     */
    @optional
    string[] supported_currencies;

    mixin AddBuilder!(typeof(this));

  }

  static class PostTreasuryFinancialAccountsResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(TreasuryFinancialAccount response) handleResponse200;

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
        handleResponse200(deserializeJson!(TreasuryFinancialAccount)(res.readJson()));
        return;
      }
      if (handleResponseDefault is null) throw new Exception("Unhandled response status code default");
      handleResponseDefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

  }

  /**
   * <p>Creates a new FinancialAccount. For now, each connected account can only have one
   * FinancialAccount.</p>
   * See_Also: HTTP POST `/v1/treasury/financial_accounts`
   */
  void postTreasuryFinancialAccounts(
      PostTreasuryFinancialAccountsBody requestBody,
      PostTreasuryFinancialAccountsResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/treasury/financial_accounts");
    requestor.setHeaderParam("Content-Type", "application/x-www-form-urlencoded");
    Security.apply(requestor);
    requestor.makeRequest(requestBody, responseHandler);
  }

  static class GetTreasuryFinancialAccountsFinancialAccountParams {
    /**
     * Specifies which fields in the response should be expanded.
     */
    string[] expand;

    /**
     */
    string financial_account;

    mixin AddBuilder!(typeof(this));

  }

  static class GetTreasuryFinancialAccountsFinancialAccountResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(TreasuryFinancialAccount response) handleResponse200;

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
        handleResponse200(deserializeJson!(TreasuryFinancialAccount)(res.readJson()));
        return;
      }
      if (handleResponseDefault is null) throw new Exception("Unhandled response status code default");
      handleResponseDefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

  }

  /**
   * <p>Retrieves the details of a FinancialAccount.</p>
   * See_Also: HTTP GET `/v1/treasury/financial_accounts/{financial_account}`
   */
  void getTreasuryFinancialAccountsFinancialAccount(
      GetTreasuryFinancialAccountsFinancialAccountParams params,
      GetTreasuryFinancialAccountsFinancialAccountResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.GET,
        Servers.getServerUrl(),
        "/v1/treasury/financial_accounts/{financial_account}");
    if (!params.expand.isNull)
      requestor.setQueryParam!("deepObject")("expand", params.expand);
    if (!params.financial_account.isNull)
      requestor.setPathParam("financial_account", params.financial_account);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class PostTreasuryFinancialAccountsFinancialAccountParams {
    /**
     */
    string financial_account;

    mixin AddBuilder!(typeof(this));

  }

  static class PostTreasuryFinancialAccountsFinancialAccountBody {
    static class PlatformRestrictions {
      @optional
      string inbound_flows;

      @optional
      string outbound_flows;

      mixin AddBuilder!(typeof(this));

    }

    /**
     * The set of functionalities that the platform can restrict on the FinancialAccount.
     */
    @optional
    PlatformRestrictions platform_restrictions;

    /**
     * Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an
     * object. This can be useful for storing additional information about the object in a
     * structured format. Individual keys can be unset by posting an empty value to them. All keys
     * can be unset by posting an empty value to `metadata`.
     */
    @optional
    string[string] metadata;

    /**
     * Specifies which fields in the response should be expanded.
     */
    @optional
    string[] expand;

    static class FeatureAccess {
      static class OutboundPayments {
        static class Access {
          @optional
          Nullable!(bool) requested;

          mixin AddBuilder!(typeof(this));

        }

        @optional
        Access us_domestic_wire;

        static class AccessWithAchDetails {
          @optional
          Nullable!(bool) requested;

          mixin AddBuilder!(typeof(this));

        }

        @optional
        AccessWithAchDetails ach;

        mixin AddBuilder!(typeof(this));

      }

      @optional
      OutboundPayments outbound_payments;

      static class FinancialAddresses {
        static class Access {
          @optional
          Nullable!(bool) requested;

          mixin AddBuilder!(typeof(this));

        }

        @optional
        Access aba;

        mixin AddBuilder!(typeof(this));

      }

      @optional
      FinancialAddresses financial_addresses;

      static class Access {
        @optional
        Nullable!(bool) requested;

        mixin AddBuilder!(typeof(this));

      }

      @optional
      Access card_issuing;

      @optional
      Access deposit_insurance;

      static class OutboundTransfers {
        static class Access {
          @optional
          Nullable!(bool) requested;

          mixin AddBuilder!(typeof(this));

        }

        @optional
        Access us_domestic_wire;

        static class AccessWithAchDetails {
          @optional
          Nullable!(bool) requested;

          mixin AddBuilder!(typeof(this));

        }

        @optional
        AccessWithAchDetails ach;

        mixin AddBuilder!(typeof(this));

      }

      @optional
      OutboundTransfers outbound_transfers;

      static class InboundTransfers {
        static class AccessWithAchDetails {
          @optional
          Nullable!(bool) requested;

          mixin AddBuilder!(typeof(this));

        }

        @optional
        AccessWithAchDetails ach;

        mixin AddBuilder!(typeof(this));

      }

      @optional
      InboundTransfers inbound_transfers;

      @optional
      Access intra_stripe_flows;

      mixin AddBuilder!(typeof(this));

    }

    /**
     * Encodes whether a FinancialAccount has access to a particular feature, with a status enum and
     * associated `status_details`. Stripe or the platform may control features via the requested
     * field.
     */
    @optional
    FeatureAccess features;

    mixin AddBuilder!(typeof(this));

  }

  static class PostTreasuryFinancialAccountsFinancialAccountResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(TreasuryFinancialAccount response) handleResponse200;

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
        handleResponse200(deserializeJson!(TreasuryFinancialAccount)(res.readJson()));
        return;
      }
      if (handleResponseDefault is null) throw new Exception("Unhandled response status code default");
      handleResponseDefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

  }

  /**
   * <p>Updates the details of a FinancialAccount.</p>
   * See_Also: HTTP POST `/v1/treasury/financial_accounts/{financial_account}`
   */
  void postTreasuryFinancialAccountsFinancialAccount(
      PostTreasuryFinancialAccountsFinancialAccountParams params,
      PostTreasuryFinancialAccountsFinancialAccountBody requestBody,
      PostTreasuryFinancialAccountsFinancialAccountResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/treasury/financial_accounts/{financial_account}");
    if (!params.financial_account.isNull)
      requestor.setPathParam("financial_account", params.financial_account);
    requestor.setHeaderParam("Content-Type", "application/x-www-form-urlencoded");
    Security.apply(requestor);
    requestor.makeRequest(requestBody, responseHandler);
  }

  static class GetTreasuryFinancialAccountsFinancialAccountFeaturesParams {
    /**
     * Specifies which fields in the response should be expanded.
     */
    string[] expand;

    /**
     */
    string financial_account;

    mixin AddBuilder!(typeof(this));

  }

  static class GetTreasuryFinancialAccountsFinancialAccountFeaturesResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(TreasuryFinancialAccountFeatures response) handleResponse200;

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
        handleResponse200(deserializeJson!(TreasuryFinancialAccountFeatures)(res.readJson()));
        return;
      }
      if (handleResponseDefault is null) throw new Exception("Unhandled response status code default");
      handleResponseDefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

  }

  /**
   * <p>Retrieves Features information associated with the FinancialAccount.</p>
   * See_Also: HTTP GET `/v1/treasury/financial_accounts/{financial_account}/features`
   */
  void getTreasuryFinancialAccountsFinancialAccountFeatures(
      GetTreasuryFinancialAccountsFinancialAccountFeaturesParams params,
      GetTreasuryFinancialAccountsFinancialAccountFeaturesResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.GET,
        Servers.getServerUrl(),
        "/v1/treasury/financial_accounts/{financial_account}/features");
    if (!params.expand.isNull)
      requestor.setQueryParam!("deepObject")("expand", params.expand);
    if (!params.financial_account.isNull)
      requestor.setPathParam("financial_account", params.financial_account);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class PostTreasuryFinancialAccountsFinancialAccountFeaturesParams {
    /**
     */
    string financial_account;

    mixin AddBuilder!(typeof(this));

  }

  static class PostTreasuryFinancialAccountsFinancialAccountFeaturesBody {
    static class OutboundPayments {
      static class Access {
        @optional
        Nullable!(bool) requested;

        mixin AddBuilder!(typeof(this));

      }

      @optional
      Access us_domestic_wire;

      static class AccessWithAchDetails {
        @optional
        Nullable!(bool) requested;

        mixin AddBuilder!(typeof(this));

      }

      @optional
      AccessWithAchDetails ach;

      mixin AddBuilder!(typeof(this));

    }

    /**
     * Includes Features related to initiating money movement out of the FinancialAccount to someone
     * else's bucket of money.
     */
    @optional
    OutboundPayments outbound_payments;

    static class FinancialAddresses {
      static class Access {
        @optional
        Nullable!(bool) requested;

        mixin AddBuilder!(typeof(this));

      }

      @optional
      Access aba;

      mixin AddBuilder!(typeof(this));

    }

    /**
     * Contains Features that add FinancialAddresses to the FinancialAccount.
     */
    @optional
    FinancialAddresses financial_addresses;

    static class Access {
      @optional
      Nullable!(bool) requested;

      mixin AddBuilder!(typeof(this));

    }

    /**
     * Encodes the FinancialAccount's ability to be used with the Issuing product, including
     * attaching cards to and drawing funds from the FinancialAccount.
     */
    @optional
    Access card_issuing;

    /**
     * Specifies which fields in the response should be expanded.
     */
    @optional
    string[] expand;

    /**
     * Represents whether this FinancialAccount is eligible for deposit insurance. Various factors
     * determine the insurance amount.
     */
    @optional
    Access deposit_insurance;

    static class OutboundTransfers {
      static class Access {
        @optional
        Nullable!(bool) requested;

        mixin AddBuilder!(typeof(this));

      }

      @optional
      Access us_domestic_wire;

      static class AccessWithAchDetails {
        @optional
        Nullable!(bool) requested;

        mixin AddBuilder!(typeof(this));

      }

      @optional
      AccessWithAchDetails ach;

      mixin AddBuilder!(typeof(this));

    }

    /**
     * Contains a Feature and settings related to moving money out of the FinancialAccount into
     * another Account with the same owner.
     */
    @optional
    OutboundTransfers outbound_transfers;

    static class InboundTransfers {
      static class AccessWithAchDetails {
        @optional
        Nullable!(bool) requested;

        mixin AddBuilder!(typeof(this));

      }

      @optional
      AccessWithAchDetails ach;

      mixin AddBuilder!(typeof(this));

    }

    /**
     * Contains settings related to adding funds to a FinancialAccount from another Account with the
     * same owner.
     */
    @optional
    InboundTransfers inbound_transfers;

    /**
     * Represents the ability for the FinancialAccount to send money to, or receive money from other
     * FinancialAccounts (for example, via OutboundPayment).
     */
    @optional
    Access intra_stripe_flows;

    mixin AddBuilder!(typeof(this));

  }

  static class PostTreasuryFinancialAccountsFinancialAccountFeaturesResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(TreasuryFinancialAccountFeatures response) handleResponse200;

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
        handleResponse200(deserializeJson!(TreasuryFinancialAccountFeatures)(res.readJson()));
        return;
      }
      if (handleResponseDefault is null) throw new Exception("Unhandled response status code default");
      handleResponseDefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

  }

  /**
   * <p>Updates the Features associated with a FinancialAccount.</p>
   * See_Also: HTTP POST `/v1/treasury/financial_accounts/{financial_account}/features`
   */
  void postTreasuryFinancialAccountsFinancialAccountFeatures(
      PostTreasuryFinancialAccountsFinancialAccountFeaturesParams params,
      PostTreasuryFinancialAccountsFinancialAccountFeaturesBody requestBody,
      PostTreasuryFinancialAccountsFinancialAccountFeaturesResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/treasury/financial_accounts/{financial_account}/features");
    if (!params.financial_account.isNull)
      requestor.setPathParam("financial_account", params.financial_account);
    requestor.setHeaderParam("Content-Type", "application/x-www-form-urlencoded");
    Security.apply(requestor);
    requestor.makeRequest(requestBody, responseHandler);
  }

  mixin AddBuilder!(typeof(this));

}

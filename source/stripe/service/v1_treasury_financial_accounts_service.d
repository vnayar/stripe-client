// File automatically generated from OpenAPI spec.
module stripe.service.v1_treasury_financial_accounts_service;

import vibe.http.client : requestHTTP, HTTPClientRequest, HTTPClientResponse;
import vibe.http.common : HTTPMethod;
import vibe.stream.operations : readAllUTF8;
import vibe.data.serialization : optional;
import vibe.data.json : Json, deserializeJson;

import stripe.servers : Servers;
import stripe.security : Security;
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
    Nullable!(Json) created;

    /**
     * An object ID cursor for use in pagination.
     */
    Nullable!(Nullable!(string)) ending_before;

    /**
     * Specifies which fields in the response should be expanded.
     */
    Nullable!(Nullable!(string)[]) expand;

    /**
     * A limit ranging from 1 to 100 (defaults to 10).
     */
    Nullable!(Nullable!(int)) limit;

    /**
     * An object ID cursor for use in pagination.
     */
    Nullable!(Nullable!(string)) starting_after;

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
      Nullable!(string) object;

      @optional
      TreasuryFinancialAccount[] data;

      /**
       * The URL where this list can be accessed.
       */
      @optional
      Nullable!(string) url;

    }

    /**
     * Successful response.
     */
    void delegate(TreasuryFinancialAccountsResourceFinancialAccountList response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponsedefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        handleResponse200(deserializeJson!(TreasuryFinancialAccountsResourceFinancialAccountList)(res.readJson()));
        return;
      }
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

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
      requestor.setQueryParam("created", params.created.get.to!string);
    if (!params.ending_before.isNull)
      requestor.setQueryParam("ending_before", params.ending_before.get.to!string);
    if (!params.expand.isNull)
      requestor.setQueryParam("expand", params.expand.get.to!string);
    if (!params.limit.isNull)
      requestor.setQueryParam("limit", params.limit.get.to!string);
    if (!params.starting_after.isNull)
      requestor.setQueryParam("starting_after", params.starting_after.get.to!string);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class PostTreasuryFinancialAccountsBody {
    static class PlatformRestrictions {
      @optional
      Nullable!(string) inbound_flows;

      @optional
      Nullable!(string) outbound_flows;

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
    Nullable!(string)[string] metadata;

    /**
     * Specifies which fields in the response should be expanded.
     */
    @optional
    Nullable!(string)[] expand;

    static class FeatureAccess {
      static class OutboundPayments {
        static class Access {
          @optional
          Nullable!(bool) requested;

        }

        @optional
        Access us_domestic_wire;

        static class AccessWithAchDetails {
          @optional
          Nullable!(bool) requested;

        }

        @optional
        AccessWithAchDetails ach;

      }

      @optional
      OutboundPayments outbound_payments;

      static class FinancialAddresses {
        static class Access {
          @optional
          Nullable!(bool) requested;

        }

        @optional
        Access aba;

      }

      @optional
      FinancialAddresses financial_addresses;

      static class Access {
        @optional
        Nullable!(bool) requested;

      }

      @optional
      Access card_issuing;

      @optional
      Access deposit_insurance;

      static class OutboundTransfers {
        static class Access {
          @optional
          Nullable!(bool) requested;

        }

        @optional
        Access us_domestic_wire;

        static class AccessWithAchDetails {
          @optional
          Nullable!(bool) requested;

        }

        @optional
        AccessWithAchDetails ach;

      }

      @optional
      OutboundTransfers outbound_transfers;

      static class InboundTransfers {
        static class AccessWithAchDetails {
          @optional
          Nullable!(bool) requested;

        }

        @optional
        AccessWithAchDetails ach;

      }

      @optional
      InboundTransfers inbound_transfers;

      @optional
      Access intra_stripe_flows;

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
    Nullable!(string)[] supported_currencies;

  }

  static class PostTreasuryFinancialAccountsResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(TreasuryFinancialAccount response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponsedefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        handleResponse200(deserializeJson!(TreasuryFinancialAccount)(res.readJson()));
        return;
      }
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

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
    Nullable!(Nullable!(string)[]) expand;

    /**
     */
    Nullable!(Nullable!(string)) financial_account;

  }

  static class GetTreasuryFinancialAccountsFinancialAccountResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(TreasuryFinancialAccount response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponsedefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        handleResponse200(deserializeJson!(TreasuryFinancialAccount)(res.readJson()));
        return;
      }
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

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
      requestor.setQueryParam("expand", params.expand.get.to!string);
    if (!params.financial_account.isNull)
      requestor.setPathParam("financial_account", params.financial_account.get.to!string);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class PostTreasuryFinancialAccountsFinancialAccountParams {
    /**
     */
    Nullable!(Nullable!(string)) financial_account;

  }

  static class PostTreasuryFinancialAccountsFinancialAccountResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(TreasuryFinancialAccount response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponsedefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        handleResponse200(deserializeJson!(TreasuryFinancialAccount)(res.readJson()));
        return;
      }
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   * <p>Updates the details of a FinancialAccount.</p>
   * See_Also: HTTP POST `/v1/treasury/financial_accounts/{financial_account}`
   */
  void postTreasuryFinancialAccountsFinancialAccount(
      PostTreasuryFinancialAccountsFinancialAccountParams params,
      PostTreasuryFinancialAccountsFinancialAccountResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/treasury/financial_accounts/{financial_account}");
    if (!params.financial_account.isNull)
      requestor.setPathParam("financial_account", params.financial_account.get.to!string);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class GetTreasuryFinancialAccountsFinancialAccountFeaturesParams {
    /**
     * Specifies which fields in the response should be expanded.
     */
    Nullable!(Nullable!(string)[]) expand;

    /**
     */
    Nullable!(Nullable!(string)) financial_account;

  }

  static class GetTreasuryFinancialAccountsFinancialAccountFeaturesResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(TreasuryFinancialAccountFeatures response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponsedefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        handleResponse200(deserializeJson!(TreasuryFinancialAccountFeatures)(res.readJson()));
        return;
      }
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

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
      requestor.setQueryParam("expand", params.expand.get.to!string);
    if (!params.financial_account.isNull)
      requestor.setPathParam("financial_account", params.financial_account.get.to!string);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class PostTreasuryFinancialAccountsFinancialAccountFeaturesParams {
    /**
     */
    Nullable!(Nullable!(string)) financial_account;

  }

  static class PostTreasuryFinancialAccountsFinancialAccountFeaturesResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(TreasuryFinancialAccountFeatures response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponsedefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        handleResponse200(deserializeJson!(TreasuryFinancialAccountFeatures)(res.readJson()));
        return;
      }
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   * <p>Updates the Features associated with a FinancialAccount.</p>
   * See_Also: HTTP POST `/v1/treasury/financial_accounts/{financial_account}/features`
   */
  void postTreasuryFinancialAccountsFinancialAccountFeatures(
      PostTreasuryFinancialAccountsFinancialAccountFeaturesParams params,
      PostTreasuryFinancialAccountsFinancialAccountFeaturesResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/treasury/financial_accounts/{financial_account}/features");
    if (!params.financial_account.isNull)
      requestor.setPathParam("financial_account", params.financial_account.get.to!string);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

}

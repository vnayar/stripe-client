// File automatically generated from OpenAPI spec.
module stripe.service.v1_financial_connections_sessions_service;

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
public import stripe.model.financial_connections.session : FinancialConnectionsSession;

/**
 * Service to make REST API calls to paths beginning with: /v1/financial_connections/sessions
 */
class V1FinancialConnectionsSessionsService {
  static class PostFinancialConnectionsSessionsBody {
    static class FiltersParams {
      @optional
      string[] countries;

      mixin AddBuilder!(typeof(this));

    }

    /**
     * Filters to restrict the kinds of accounts to collect.
     */
    @optional
    FiltersParams filters;

    /**
     * Specifies which fields in the response should be expanded.
     */
    @optional
    string[] expand;

    static class AccountholderParams {
      @optional
      string customer;

      @optional
      string type;

      @optional
      string account;

      mixin AddBuilder!(typeof(this));

    }

    /**
     * The account holder to link accounts for.
     */
    @optional
    AccountholderParams account_holder;

    /**
     * List of data features that you would like to request access to.
     * Possible values are `balances`, `transactions`, `ownership`, and `payment_method`.
     */
    @optional
    string[] permissions;

    /**
     * For webview integrations only. Upon completing OAuth login in the native browser, the user
     * will be redirected to this URL to return to your app.
     */
    @optional
    string return_url;

    mixin AddBuilder!(typeof(this));

  }

  static class PostFinancialConnectionsSessionsResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(FinancialConnectionsSession response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponsedefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        if (handleResponse200 is null) throw new Exception("Unhandled response status code 200");
        handleResponse200(deserializeJson!(FinancialConnectionsSession)(res.readJson()));
        return;
      }
      if (handleResponsedefault is null) throw new Exception("Unhandled response status code default");
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

  }

  /**
   * <p>To launch the Financial Connections authorization flow, create a <code>Session</code>. The
   * session’s <code>client_secret</code> can be used to launch the flow using Stripe.js.</p>
   * See_Also: HTTP POST `/v1/financial_connections/sessions`
   */
  void postFinancialConnectionsSessions(
      PostFinancialConnectionsSessionsBody requestBody,
      PostFinancialConnectionsSessionsResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/financial_connections/sessions");
    requestor.setHeaderParam("Content-Type", "application/x-www-form-urlencoded");
    Security.apply(requestor);
    requestor.makeRequest(requestBody, responseHandler);
  }

  static class GetFinancialConnectionsSessionsSessionParams {
    /**
     * Specifies which fields in the response should be expanded.
     */
    string[] expand;

    /**
     */
    string session;

    mixin AddBuilder!(typeof(this));

  }

  static class GetFinancialConnectionsSessionsSessionResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(FinancialConnectionsSession response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponsedefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        if (handleResponse200 is null) throw new Exception("Unhandled response status code 200");
        handleResponse200(deserializeJson!(FinancialConnectionsSession)(res.readJson()));
        return;
      }
      if (handleResponsedefault is null) throw new Exception("Unhandled response status code default");
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

  }

  /**
   * <p>Retrieves the details of a Financial Connections <code>Session</code></p>
   * See_Also: HTTP GET `/v1/financial_connections/sessions/{session}`
   */
  void getFinancialConnectionsSessionsSession(
      GetFinancialConnectionsSessionsSessionParams params,
      GetFinancialConnectionsSessionsSessionResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.GET,
        Servers.getServerUrl(),
        "/v1/financial_connections/sessions/{session}");
    if (!params.expand.isNull)
      requestor.setQueryParam!("deepObject")("expand", params.expand);
    if (!params.session.isNull)
      requestor.setPathParam("session", params.session);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  mixin AddBuilder!(typeof(this));

}

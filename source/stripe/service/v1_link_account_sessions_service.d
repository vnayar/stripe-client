// File automatically generated from OpenAPI spec.
module stripe.service.v1_link_account_sessions_service;

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
public import stripe.model.financial_connections.session : FinancialConnectionsSession;

/**
 * Service to make REST API calls to paths beginning with: /v1/link_account_sessions
 */
class V1LinkAccountSessionsService {
  static class GetLinkAccountSessionsSessionParams {
    /**
     * Specifies which fields in the response should be expanded.
     */
    Nullable!(Nullable!(string)[]) expand;

    /**
     */
    Nullable!(Nullable!(string)) session;

  }

  static class GetLinkAccountSessionsSessionResponseHandler : ResponseHandler {

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
        handleResponse200(deserializeJson!(FinancialConnectionsSession)(res.readJson()));
        return;
      }
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   * <p>Retrieves the details of a Financial Connections <code>Session</code></p>
   * See_Also: HTTP GET `/v1/link_account_sessions/{session}`
   */
  void getLinkAccountSessionsSession(
      GetLinkAccountSessionsSessionParams params,
      GetLinkAccountSessionsSessionResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.GET,
        Servers.getServerUrl(),
        "/v1/link_account_sessions/{session}");
    if (!params.expand.isNull)
      requestor.setQueryParam("expand", params.expand.get.to!string);
    if (!params.session.isNull)
      requestor.setPathParam("session", params.session.get.to!string);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class PostLinkAccountSessionsBody {
    static class FiltersParams {
      @optional
      Nullable!(string)[] countries;

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
    Nullable!(string)[] expand;

    static class AccountholderParams {
      @optional
      Nullable!(string) customer;

      @optional
      Nullable!(string) type;

      @optional
      Nullable!(string) account;

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
    Nullable!(string)[] permissions;

    /**
     * For webview integrations only. Upon completing OAuth login in the native browser, the user
     * will be redirected to this URL to return to your app.
     */
    @optional
    Nullable!(string) return_url;

  }

  static class PostLinkAccountSessionsResponseHandler : ResponseHandler {

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
        handleResponse200(deserializeJson!(FinancialConnectionsSession)(res.readJson()));
        return;
      }
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   * <p>To launch the Financial Connections authorization flow, create a <code>Session</code>. The
   * session’s <code>client_secret</code> can be used to launch the flow using Stripe.js.</p>
   * See_Also: HTTP POST `/v1/link_account_sessions`
   */
  void postLinkAccountSessions(
      PostLinkAccountSessionsBody requestBody,
      PostLinkAccountSessionsResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/link_account_sessions");
    requestor.setHeaderParam("Content-Type", "application/x-www-form-urlencoded");
    Security.apply(requestor);
    requestor.makeRequest(requestBody, responseHandler);
  }

}

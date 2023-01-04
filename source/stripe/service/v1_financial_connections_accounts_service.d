// File automatically generated from OpenAPI spec.
module stripe.service.v1_financial_connections_accounts_service;

import vibe.http.client : requestHTTP, HTTPClientRequest, HTTPClientResponse;
import vibe.http.common : HTTPMethod;
import vibe.stream.operations : readAllUTF8;
import vibe.data.serialization : optional;
import vibe.data.json : Json, deserializeJson;

import stripe.servers : Servers;
import stripe.security : Security;
import openapi_client.util : isNull;
import openapi_client.apirequest : ApiRequest;
import openapi_client.handler : ResponseHandler;

import std.conv : to;
import std.typecons : Nullable;
import std.stdio;

public import stripe.model.error : Error_;
public import stripe.model.financial_connections.account : FinancialConnectionsAccount;
public import stripe.model.financial_connections.account_owner : FinancialConnectionsAccountOwner;

/**
 * Service to make REST API calls to paths beginning with: /v1/financial_connections/accounts
 */
class V1FinancialConnectionsAccountsService {
  static class PostFinancialConnectionsAccountsAccountDisconnectParams {
    /**
     */
    string account;

  }

  static class PostFinancialConnectionsAccountsAccountDisconnectResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(FinancialConnectionsAccount response) handleResponse200;

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
        handleResponse200(deserializeJson!(FinancialConnectionsAccount)(res.readJson()));
        return;
      }
      if (handleResponsedefault is null) throw new Exception("Unhandled response status code default");
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   * <p>Disables your access to a Financial Connections <code>Account</code>. You will no longer be
   * able to access data associated with the account (e.g. balances, transactions).</p>
   * See_Also: HTTP POST `/v1/financial_connections/accounts/{account}/disconnect`
   */
  void postFinancialConnectionsAccountsAccountDisconnect(
      PostFinancialConnectionsAccountsAccountDisconnectParams params,
      PostFinancialConnectionsAccountsAccountDisconnectResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/financial_connections/accounts/{account}/disconnect");
    if (!params.account.isNull)
      requestor.setPathParam("account", params.account);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class PostFinancialConnectionsAccountsAccountRefreshParams {
    /**
     */
    string account;

  }

  static class PostFinancialConnectionsAccountsAccountRefreshBody {
    /**
     * Specifies which fields in the response should be expanded.
     */
    @optional
    string[] expand;

    /**
     * The list of account features that you would like to refresh.
     */
    @optional
    string[] features;

  }

  static class PostFinancialConnectionsAccountsAccountRefreshResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(FinancialConnectionsAccount response) handleResponse200;

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
        handleResponse200(deserializeJson!(FinancialConnectionsAccount)(res.readJson()));
        return;
      }
      if (handleResponsedefault is null) throw new Exception("Unhandled response status code default");
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   * <p>Refreshes the data associated with a Financial Connections <code>Account</code>.</p>
   * See_Also: HTTP POST `/v1/financial_connections/accounts/{account}/refresh`
   */
  void postFinancialConnectionsAccountsAccountRefresh(
      PostFinancialConnectionsAccountsAccountRefreshParams params,
      PostFinancialConnectionsAccountsAccountRefreshBody requestBody,
      PostFinancialConnectionsAccountsAccountRefreshResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/financial_connections/accounts/{account}/refresh");
    if (!params.account.isNull)
      requestor.setPathParam("account", params.account);
    requestor.setHeaderParam("Content-Type", "application/x-www-form-urlencoded");
    Security.apply(requestor);
    requestor.makeRequest(requestBody, responseHandler);
  }

  static class GetFinancialConnectionsAccountsAccountOwnersParams {
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
     * The ID of the ownership object to fetch owners from.
     */
    string ownership;

    /**
     * A cursor for use in pagination. `starting_after` is an object ID that defines your place in
     * the list. For instance, if you make a list request and receive 100 objects, ending with
     * `obj_foo`, your subsequent call can include `starting_after=obj_foo` in order to fetch the
     * next page of the list.
     */
    string starting_after;

  }

  static class GetFinancialConnectionsAccountsAccountOwnersResponseHandler : ResponseHandler {

    static class BankConnectionsResourceOwnerList {
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
       * Details about each object.
       */
      @optional
      FinancialConnectionsAccountOwner[] data;

      /**
       * The URL where this list can be accessed.
       */
      @optional
      string url;

    }

    /**
     * Successful response.
     */
    void delegate(BankConnectionsResourceOwnerList response) handleResponse200;

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
        handleResponse200(deserializeJson!(BankConnectionsResourceOwnerList)(res.readJson()));
        return;
      }
      if (handleResponsedefault is null) throw new Exception("Unhandled response status code default");
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   * <p>Lists all owners for a given <code>Account</code></p>
   * See_Also: HTTP GET `/v1/financial_connections/accounts/{account}/owners`
   */
  void getFinancialConnectionsAccountsAccountOwners(
      GetFinancialConnectionsAccountsAccountOwnersParams params,
      GetFinancialConnectionsAccountsAccountOwnersResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.GET,
        Servers.getServerUrl(),
        "/v1/financial_connections/accounts/{account}/owners");
    if (!params.account.isNull)
      requestor.setPathParam("account", params.account);
    if (!params.ending_before.isNull)
      requestor.setQueryParam!("deepObject")("ending_before", params.ending_before);
    if (!params.expand.isNull)
      requestor.setQueryParam!("deepObject")("expand", params.expand);
    if (!params.limit.isNull)
      requestor.setQueryParam!("deepObject")("limit", params.limit);
    if (!params.ownership.isNull)
      requestor.setQueryParam!("deepObject")("ownership", params.ownership);
    if (!params.starting_after.isNull)
      requestor.setQueryParam!("deepObject")("starting_after", params.starting_after);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class GetFinancialConnectionsAccountsParams {
    /**
     * If present, only return accounts that belong to the specified account holder.
     * `account_holder[customer]` and `account_holder[account]` are mutually exclusive.
     */
    static class AccountholderParams {
      @optional
      string customer;

      @optional
      string account;

    }

    AccountholderParams account_holder;

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
     * If present, only return accounts that were collected as part of the given session.
     */
    string session;

    /**
     * A cursor for use in pagination. `starting_after` is an object ID that defines your place in
     * the list. For instance, if you make a list request and receive 100 objects, ending with
     * `obj_foo`, your subsequent call can include `starting_after=obj_foo` in order to fetch the
     * next page of the list.
     */
    string starting_after;

  }

  static class GetFinancialConnectionsAccountsResponseHandler : ResponseHandler {

    static class BankConnectionsResourceLinkedAccountList {
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
       * Details about each object.
       */
      @optional
      FinancialConnectionsAccount[] data;

      /**
       * The URL where this list can be accessed.
       */
      @optional
      string url;

    }

    /**
     * Successful response.
     */
    void delegate(BankConnectionsResourceLinkedAccountList response) handleResponse200;

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
        handleResponse200(deserializeJson!(BankConnectionsResourceLinkedAccountList)(res.readJson()));
        return;
      }
      if (handleResponsedefault is null) throw new Exception("Unhandled response status code default");
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   * <p>Returns a list of Financial Connections <code>Account</code> objects.</p>
   * See_Also: HTTP GET `/v1/financial_connections/accounts`
   */
  void getFinancialConnectionsAccounts(
      GetFinancialConnectionsAccountsParams params,
      GetFinancialConnectionsAccountsResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.GET,
        Servers.getServerUrl(),
        "/v1/financial_connections/accounts");
    if (!params.account_holder.isNull)
      requestor.setQueryParam!("deepObject")("account_holder", params.account_holder);
    if (!params.ending_before.isNull)
      requestor.setQueryParam!("deepObject")("ending_before", params.ending_before);
    if (!params.expand.isNull)
      requestor.setQueryParam!("deepObject")("expand", params.expand);
    if (!params.limit.isNull)
      requestor.setQueryParam!("deepObject")("limit", params.limit);
    if (!params.session.isNull)
      requestor.setQueryParam!("deepObject")("session", params.session);
    if (!params.starting_after.isNull)
      requestor.setQueryParam!("deepObject")("starting_after", params.starting_after);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class GetFinancialConnectionsAccountsAccountParams {
    /**
     */
    string account;

    /**
     * Specifies which fields in the response should be expanded.
     */
    string[] expand;

  }

  static class GetFinancialConnectionsAccountsAccountResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(FinancialConnectionsAccount response) handleResponse200;

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
        handleResponse200(deserializeJson!(FinancialConnectionsAccount)(res.readJson()));
        return;
      }
      if (handleResponsedefault is null) throw new Exception("Unhandled response status code default");
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   * <p>Retrieves the details of an Financial Connections <code>Account</code>.</p>
   * See_Also: HTTP GET `/v1/financial_connections/accounts/{account}`
   */
  void getFinancialConnectionsAccountsAccount(
      GetFinancialConnectionsAccountsAccountParams params,
      GetFinancialConnectionsAccountsAccountResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.GET,
        Servers.getServerUrl(),
        "/v1/financial_connections/accounts/{account}");
    if (!params.account.isNull)
      requestor.setPathParam("account", params.account);
    if (!params.expand.isNull)
      requestor.setQueryParam!("deepObject")("expand", params.expand);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

}

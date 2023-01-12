// File automatically generated from OpenAPI spec.
module stripe.service.v1_linked_accounts_service;

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
public import stripe.model.financial_connections.account : FinancialConnectionsAccount;
public import stripe.model.financial_connections.account_owner : FinancialConnectionsAccountOwner;

/**
 * Service to make REST API calls to paths beginning with: /v1/linked_accounts
 */
class V1LinkedAccountsService {
  static class GetLinkedAccountsParams {
    /**
     * If present, only return accounts that belong to the specified account holder.
     * `account_holder[customer]` and `account_holder[account]` are mutually exclusive.
     */
    static class AccountholderParams {
      @optional
      string customer;

      @optional
      string account;

      mixin AddBuilder!(typeof(this));

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

    mixin AddBuilder!(typeof(this));

  }

  static class GetLinkedAccountsResponseHandler : ResponseHandler {

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

      mixin AddBuilder!(typeof(this));

    }

    /**
     * Successful response.
     */
    void delegate(BankConnectionsResourceLinkedAccountList response) handleResponse200;

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
        handleResponse200(deserializeJson!(BankConnectionsResourceLinkedAccountList)(res.readJson()));
        return;
      }
      if (handleResponseDefault is null) throw new Exception("Unhandled response status code default");
      handleResponseDefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

  }

  /**
   * <p>Returns a list of Financial Connections <code>Account</code> objects.</p>
   * See_Also: HTTP GET `/v1/linked_accounts`
   */
  void getLinkedAccounts(
      GetLinkedAccountsParams params,
      GetLinkedAccountsResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.GET,
        Servers.getServerUrl(),
        "/v1/linked_accounts");
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

  static class GetLinkedAccountsAccountOwnersParams {
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

    mixin AddBuilder!(typeof(this));

  }

  static class GetLinkedAccountsAccountOwnersResponseHandler : ResponseHandler {

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

      mixin AddBuilder!(typeof(this));

    }

    /**
     * Successful response.
     */
    void delegate(BankConnectionsResourceOwnerList response) handleResponse200;

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
        handleResponse200(deserializeJson!(BankConnectionsResourceOwnerList)(res.readJson()));
        return;
      }
      if (handleResponseDefault is null) throw new Exception("Unhandled response status code default");
      handleResponseDefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

  }

  /**
   * <p>Lists all owners for a given <code>Account</code></p>
   * See_Also: HTTP GET `/v1/linked_accounts/{account}/owners`
   */
  void getLinkedAccountsAccountOwners(
      GetLinkedAccountsAccountOwnersParams params,
      GetLinkedAccountsAccountOwnersResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.GET,
        Servers.getServerUrl(),
        "/v1/linked_accounts/{account}/owners");
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

  static class PostLinkedAccountsAccountRefreshParams {
    /**
     */
    string account;

    mixin AddBuilder!(typeof(this));

  }

  static class PostLinkedAccountsAccountRefreshBody {
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

    mixin AddBuilder!(typeof(this));

  }

  static class PostLinkedAccountsAccountRefreshResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(FinancialConnectionsAccount response) handleResponse200;

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
        handleResponse200(deserializeJson!(FinancialConnectionsAccount)(res.readJson()));
        return;
      }
      if (handleResponseDefault is null) throw new Exception("Unhandled response status code default");
      handleResponseDefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

  }

  /**
   * <p>Refreshes the data associated with a Financial Connections <code>Account</code>.</p>
   * See_Also: HTTP POST `/v1/linked_accounts/{account}/refresh`
   */
  void postLinkedAccountsAccountRefresh(
      PostLinkedAccountsAccountRefreshParams params,
      PostLinkedAccountsAccountRefreshBody requestBody,
      PostLinkedAccountsAccountRefreshResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/linked_accounts/{account}/refresh");
    if (!params.account.isNull)
      requestor.setPathParam("account", params.account);
    requestor.setHeaderParam("Content-Type", "application/x-www-form-urlencoded");
    Security.apply(requestor);
    requestor.makeRequest(requestBody, responseHandler);
  }

  static class GetLinkedAccountsAccountParams {
    /**
     */
    string account;

    /**
     * Specifies which fields in the response should be expanded.
     */
    string[] expand;

    mixin AddBuilder!(typeof(this));

  }

  static class GetLinkedAccountsAccountResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(FinancialConnectionsAccount response) handleResponse200;

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
        handleResponse200(deserializeJson!(FinancialConnectionsAccount)(res.readJson()));
        return;
      }
      if (handleResponseDefault is null) throw new Exception("Unhandled response status code default");
      handleResponseDefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

  }

  /**
   * <p>Retrieves the details of an Financial Connections <code>Account</code>.</p>
   * See_Also: HTTP GET `/v1/linked_accounts/{account}`
   */
  void getLinkedAccountsAccount(
      GetLinkedAccountsAccountParams params,
      GetLinkedAccountsAccountResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.GET,
        Servers.getServerUrl(),
        "/v1/linked_accounts/{account}");
    if (!params.account.isNull)
      requestor.setPathParam("account", params.account);
    if (!params.expand.isNull)
      requestor.setQueryParam!("deepObject")("expand", params.expand);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class PostLinkedAccountsAccountDisconnectParams {
    /**
     */
    string account;

    mixin AddBuilder!(typeof(this));

  }

  static class PostLinkedAccountsAccountDisconnectBody {
    /**
     * Specifies which fields in the response should be expanded.
     */
    @optional
    string[] expand;

    mixin AddBuilder!(typeof(this));

  }

  static class PostLinkedAccountsAccountDisconnectResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(FinancialConnectionsAccount response) handleResponse200;

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
        handleResponse200(deserializeJson!(FinancialConnectionsAccount)(res.readJson()));
        return;
      }
      if (handleResponseDefault is null) throw new Exception("Unhandled response status code default");
      handleResponseDefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

  }

  /**
   * <p>Disables your access to a Financial Connections <code>Account</code>. You will no longer be
   * able to access data associated with the account (e.g. balances, transactions).</p>
   * See_Also: HTTP POST `/v1/linked_accounts/{account}/disconnect`
   */
  void postLinkedAccountsAccountDisconnect(
      PostLinkedAccountsAccountDisconnectParams params,
      PostLinkedAccountsAccountDisconnectBody requestBody,
      PostLinkedAccountsAccountDisconnectResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/linked_accounts/{account}/disconnect");
    if (!params.account.isNull)
      requestor.setPathParam("account", params.account);
    requestor.setHeaderParam("Content-Type", "application/x-www-form-urlencoded");
    Security.apply(requestor);
    requestor.makeRequest(requestBody, responseHandler);
  }

  mixin AddBuilder!(typeof(this));

}

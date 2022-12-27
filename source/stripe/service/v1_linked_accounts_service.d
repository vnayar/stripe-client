// File automatically generated from OpenAPI spec.
module stripe.service.v1_linked_accounts_service;

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
      Nullable!(string) customer;

      @optional
      Nullable!(string) account;

    }

    Nullable!(AccountholderParams) account_holder;

    /**
     * A cursor for use in pagination. `ending_before` is an object ID that defines your place in
     * the list. For instance, if you make a list request and receive 100 objects, starting with
     * `obj_bar`, your subsequent call can include `ending_before=obj_bar` in order to fetch the
     * previous page of the list.
     */
    Nullable!(Nullable!(string)) ending_before;

    /**
     * Specifies which fields in the response should be expanded.
     */
    Nullable!(Nullable!(string)[]) expand;

    /**
     * A limit on the number of objects to be returned. Limit can range between 1 and 100, and the
     * default is 10.
     */
    Nullable!(Nullable!(int)) limit;

    /**
     * If present, only return accounts that were collected as part of the given session.
     */
    Nullable!(Nullable!(string)) session;

    /**
     * A cursor for use in pagination. `starting_after` is an object ID that defines your place in
     * the list. For instance, if you make a list request and receive 100 objects, ending with
     * `obj_foo`, your subsequent call can include `starting_after=obj_foo` in order to fetch the
     * next page of the list.
     */
    Nullable!(Nullable!(string)) starting_after;

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
      Nullable!(string) object;

      /**
       * Details about each object.
       */
      @optional
      FinancialConnectionsAccount[] data;

      /**
       * The URL where this list can be accessed.
       */
      @optional
      Nullable!(string) url;

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
        handleResponse200(deserializeJson!(BankConnectionsResourceLinkedAccountList)(res.readJson()));
        return;
      }
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   */
  void getLinkedAccounts(
      GetLinkedAccountsParams params,
      GetLinkedAccountsResponseHandler responseHandler = null,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.GET,
        Servers.getServerUrl(),
        "/v1/linked_accounts");
    if (!params.account_holder.isNull)
      requestor.setQueryParam("account_holder", params.account_holder.get.to!string);
    if (!params.ending_before.isNull)
      requestor.setQueryParam("ending_before", params.ending_before.get.to!string);
    if (!params.expand.isNull)
      requestor.setQueryParam("expand", params.expand.get.to!string);
    if (!params.limit.isNull)
      requestor.setQueryParam("limit", params.limit.get.to!string);
    if (!params.session.isNull)
      requestor.setQueryParam("session", params.session.get.to!string);
    if (!params.starting_after.isNull)
      requestor.setQueryParam("starting_after", params.starting_after.get.to!string);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class GetLinkedAccountsAccountOwnersParams {
    /**
     */
    Nullable!(Nullable!(string)) account;

    /**
     * A cursor for use in pagination. `ending_before` is an object ID that defines your place in
     * the list. For instance, if you make a list request and receive 100 objects, starting with
     * `obj_bar`, your subsequent call can include `ending_before=obj_bar` in order to fetch the
     * previous page of the list.
     */
    Nullable!(Nullable!(string)) ending_before;

    /**
     * Specifies which fields in the response should be expanded.
     */
    Nullable!(Nullable!(string)[]) expand;

    /**
     * A limit on the number of objects to be returned. Limit can range between 1 and 100, and the
     * default is 10.
     */
    Nullable!(Nullable!(int)) limit;

    /**
     * The ID of the ownership object to fetch owners from.
     */
    Nullable!(Nullable!(string)) ownership;

    /**
     * A cursor for use in pagination. `starting_after` is an object ID that defines your place in
     * the list. For instance, if you make a list request and receive 100 objects, ending with
     * `obj_foo`, your subsequent call can include `starting_after=obj_foo` in order to fetch the
     * next page of the list.
     */
    Nullable!(Nullable!(string)) starting_after;

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
      Nullable!(string) object;

      /**
       * Details about each object.
       */
      @optional
      FinancialConnectionsAccountOwner[] data;

      /**
       * The URL where this list can be accessed.
       */
      @optional
      Nullable!(string) url;

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
        handleResponse200(deserializeJson!(BankConnectionsResourceOwnerList)(res.readJson()));
        return;
      }
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   */
  void getLinkedAccountsAccountOwners(
      GetLinkedAccountsAccountOwnersParams params,
      GetLinkedAccountsAccountOwnersResponseHandler responseHandler = null,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.GET,
        Servers.getServerUrl(),
        "/v1/linked_accounts/{account}/owners");
    if (!params.account.isNull)
      requestor.setPathParam("account", params.account.get.to!string);
    if (!params.ending_before.isNull)
      requestor.setQueryParam("ending_before", params.ending_before.get.to!string);
    if (!params.expand.isNull)
      requestor.setQueryParam("expand", params.expand.get.to!string);
    if (!params.limit.isNull)
      requestor.setQueryParam("limit", params.limit.get.to!string);
    if (!params.ownership.isNull)
      requestor.setQueryParam("ownership", params.ownership.get.to!string);
    if (!params.starting_after.isNull)
      requestor.setQueryParam("starting_after", params.starting_after.get.to!string);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class PostLinkedAccountsAccountRefreshParams {
    /**
     */
    Nullable!(Nullable!(string)) account;

  }

  static class PostLinkedAccountsAccountRefreshBody {
    /**
     * Specifies which fields in the response should be expanded.
     */
    @optional
    Nullable!(string)[] expand;

    /**
     * The list of account features that you would like to refresh.
     */
    @optional
    Nullable!(string)[] features;

  }

  static class PostLinkedAccountsAccountRefreshResponseHandler : ResponseHandler {

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
        handleResponse200(deserializeJson!(FinancialConnectionsAccount)(res.readJson()));
        return;
      }
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   */
  void postLinkedAccountsAccountRefresh(
      PostLinkedAccountsAccountRefreshParams params,
      PostLinkedAccountsAccountRefreshBody requestBody,
      PostLinkedAccountsAccountRefreshResponseHandler responseHandler = null,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/linked_accounts/{account}/refresh");
    if (!params.account.isNull)
      requestor.setPathParam("account", params.account.get.to!string);
    Security.apply(requestor);
    requestor.makeRequest(requestBody, responseHandler);
  }

  static class GetLinkedAccountsAccountParams {
    /**
     */
    Nullable!(Nullable!(string)) account;

    /**
     * Specifies which fields in the response should be expanded.
     */
    Nullable!(Nullable!(string)[]) expand;

  }

  static class GetLinkedAccountsAccountResponseHandler : ResponseHandler {

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
        handleResponse200(deserializeJson!(FinancialConnectionsAccount)(res.readJson()));
        return;
      }
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   */
  void getLinkedAccountsAccount(
      GetLinkedAccountsAccountParams params,
      GetLinkedAccountsAccountResponseHandler responseHandler = null,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.GET,
        Servers.getServerUrl(),
        "/v1/linked_accounts/{account}");
    if (!params.account.isNull)
      requestor.setPathParam("account", params.account.get.to!string);
    if (!params.expand.isNull)
      requestor.setQueryParam("expand", params.expand.get.to!string);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class PostLinkedAccountsAccountDisconnectParams {
    /**
     */
    Nullable!(Nullable!(string)) account;

  }

  static class PostLinkedAccountsAccountDisconnectResponseHandler : ResponseHandler {

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
        handleResponse200(deserializeJson!(FinancialConnectionsAccount)(res.readJson()));
        return;
      }
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   */
  void postLinkedAccountsAccountDisconnect(
      PostLinkedAccountsAccountDisconnectParams params,
      PostLinkedAccountsAccountDisconnectResponseHandler responseHandler = null,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/linked_accounts/{account}/disconnect");
    if (!params.account.isNull)
      requestor.setPathParam("account", params.account.get.to!string);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

}

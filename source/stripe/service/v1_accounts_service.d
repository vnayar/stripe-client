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
    void delegate(Error_ response) handleResponsedefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        if (handleResponse200 is null) throw new Exception("Unhandled response status code 200");
        handleResponse200(deserializeJson!(Account)(res.readJson()));
        return;
      }
      if (handleResponsedefault is null) throw new Exception("Unhandled response status code default");
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
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

  static class PostAccountsAccountResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(Account response) handleResponse200;

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
        handleResponse200(deserializeJson!(Account)(res.readJson()));
        return;
      }
      if (handleResponsedefault is null) throw new Exception("Unhandled response status code default");
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
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
      PostAccountsAccountResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/accounts/{account}");
    if (!params.account.isNull)
      requestor.setPathParam("account", params.account);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
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
    void delegate(Error_ response) handleResponsedefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        if (handleResponse200 is null) throw new Exception("Unhandled response status code 200");
        handleResponse200(deserializeJson!(DeletedAccount)(res.readJson()));
        return;
      }
      if (handleResponsedefault is null) throw new Exception("Unhandled response status code default");
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
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
    void delegate(Error_ response) handleResponsedefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        if (handleResponse200 is null) throw new Exception("Unhandled response status code 200");
        handleResponse200(deserializeJson!(PersonList)(res.readJson()));
        return;
      }
      if (handleResponsedefault is null) throw new Exception("Unhandled response status code default");
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
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

  static class PostAccountsAccountPeopleResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(Person response) handleResponse200;

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
        handleResponse200(deserializeJson!(Person)(res.readJson()));
        return;
      }
      if (handleResponsedefault is null) throw new Exception("Unhandled response status code default");
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

  }

  /**
   * <p>Creates a new person.</p>
   * See_Also: HTTP POST `/v1/accounts/{account}/people`
   */
  void postAccountsAccountPeople(
      PostAccountsAccountPeopleParams params,
      PostAccountsAccountPeopleResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/accounts/{account}/people");
    if (!params.account.isNull)
      requestor.setPathParam("account", params.account);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class PostAccountsAccountLoginLinksParams {
    /**
     */
    string account;

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
    void delegate(Error_ response) handleResponsedefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        if (handleResponse200 is null) throw new Exception("Unhandled response status code 200");
        handleResponse200(deserializeJson!(LoginLink)(res.readJson()));
        return;
      }
      if (handleResponsedefault is null) throw new Exception("Unhandled response status code default");
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
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
      PostAccountsAccountLoginLinksResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/accounts/{account}/login_links");
    if (!params.account.isNull)
      requestor.setPathParam("account", params.account);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
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
    void delegate(Error_ response) handleResponsedefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        if (handleResponse200 is null) throw new Exception("Unhandled response status code 200");
        handleResponse200(deserializeJson!(PersonList)(res.readJson()));
        return;
      }
      if (handleResponsedefault is null) throw new Exception("Unhandled response status code default");
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
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

  static class PostAccountsAccountPersonsResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(Person response) handleResponse200;

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
        handleResponse200(deserializeJson!(Person)(res.readJson()));
        return;
      }
      if (handleResponsedefault is null) throw new Exception("Unhandled response status code default");
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

  }

  /**
   * <p>Creates a new person.</p>
   * See_Also: HTTP POST `/v1/accounts/{account}/persons`
   */
  void postAccountsAccountPersons(
      PostAccountsAccountPersonsParams params,
      PostAccountsAccountPersonsResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/accounts/{account}/persons");
    if (!params.account.isNull)
      requestor.setPathParam("account", params.account);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
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
    void delegate(Error_ response) handleResponsedefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        if (handleResponse200 is null) throw new Exception("Unhandled response status code 200");
        handleResponse200(deserializeJson!(ExternalAccount)(res.readJson()));
        return;
      }
      if (handleResponsedefault is null) throw new Exception("Unhandled response status code default");
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
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

  static class PostAccountsAccountExternalAccountsIdResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(ExternalAccount response) handleResponse200;

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
        handleResponse200(deserializeJson!(ExternalAccount)(res.readJson()));
        return;
      }
      if (handleResponsedefault is null) throw new Exception("Unhandled response status code default");
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
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
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
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
    void delegate(Error_ response) handleResponsedefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        if (handleResponse200 is null) throw new Exception("Unhandled response status code 200");
        handleResponse200(deserializeJson!(DeletedExternalAccount)(res.readJson()));
        return;
      }
      if (handleResponsedefault is null) throw new Exception("Unhandled response status code default");
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
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
    void delegate(Error_ response) handleResponsedefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        if (handleResponse200 is null) throw new Exception("Unhandled response status code 200");
        handleResponse200(deserializeJson!(ExternalAccount)(res.readJson()));
        return;
      }
      if (handleResponsedefault is null) throw new Exception("Unhandled response status code default");
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
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

  static class PostAccountsAccountBankAccountsIdResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(ExternalAccount response) handleResponse200;

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
        handleResponse200(deserializeJson!(ExternalAccount)(res.readJson()));
        return;
      }
      if (handleResponsedefault is null) throw new Exception("Unhandled response status code default");
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
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
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
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
    void delegate(Error_ response) handleResponsedefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        if (handleResponse200 is null) throw new Exception("Unhandled response status code 200");
        handleResponse200(deserializeJson!(DeletedExternalAccount)(res.readJson()));
        return;
      }
      if (handleResponsedefault is null) throw new Exception("Unhandled response status code default");
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
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
    void delegate(Error_ response) handleResponsedefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        if (handleResponse200 is null) throw new Exception("Unhandled response status code 200");
        handleResponse200(deserializeJson!(Person)(res.readJson()));
        return;
      }
      if (handleResponsedefault is null) throw new Exception("Unhandled response status code default");
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
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

  static class PostAccountsAccountPeoplePersonResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(Person response) handleResponse200;

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
        handleResponse200(deserializeJson!(Person)(res.readJson()));
        return;
      }
      if (handleResponsedefault is null) throw new Exception("Unhandled response status code default");
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

  }

  /**
   * <p>Updates an existing person.</p>
   * See_Also: HTTP POST `/v1/accounts/{account}/people/{person}`
   */
  void postAccountsAccountPeoplePerson(
      PostAccountsAccountPeoplePersonParams params,
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
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
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
    void delegate(Error_ response) handleResponsedefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        if (handleResponse200 is null) throw new Exception("Unhandled response status code 200");
        handleResponse200(deserializeJson!(DeletedPerson)(res.readJson()));
        return;
      }
      if (handleResponsedefault is null) throw new Exception("Unhandled response status code default");
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
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
    void delegate(Error_ response) handleResponsedefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        if (handleResponse200 is null) throw new Exception("Unhandled response status code 200");
        handleResponse200(deserializeJson!(AccountList)(res.readJson()));
        return;
      }
      if (handleResponsedefault is null) throw new Exception("Unhandled response status code default");
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
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

  static class PostAccountsResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(Account response) handleResponse200;

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
        handleResponse200(deserializeJson!(Account)(res.readJson()));
        return;
      }
      if (handleResponsedefault is null) throw new Exception("Unhandled response status code default");
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
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
      PostAccountsResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/accounts");
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
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
    void delegate(Error_ response) handleResponsedefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        if (handleResponse200 is null) throw new Exception("Unhandled response status code 200");
        handleResponse200(deserializeJson!(Capability)(res.readJson()));
        return;
      }
      if (handleResponsedefault is null) throw new Exception("Unhandled response status code default");
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
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

  static class PostAccountsAccountCapabilitiesCapabilityResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(Capability response) handleResponse200;

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
        handleResponse200(deserializeJson!(Capability)(res.readJson()));
        return;
      }
      if (handleResponsedefault is null) throw new Exception("Unhandled response status code default");
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

  }

  /**
   * <p>Updates an existing Account Capability.</p>
   * See_Also: HTTP POST `/v1/accounts/{account}/capabilities/{capability}`
   */
  void postAccountsAccountCapabilitiesCapability(
      PostAccountsAccountCapabilitiesCapabilityParams params,
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
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
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
    void delegate(Error_ response) handleResponsedefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        if (handleResponse200 is null) throw new Exception("Unhandled response status code 200");
        handleResponse200(deserializeJson!(Account)(res.readJson()));
        return;
      }
      if (handleResponsedefault is null) throw new Exception("Unhandled response status code default");
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
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
    void delegate(Error_ response) handleResponsedefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        if (handleResponse200 is null) throw new Exception("Unhandled response status code 200");
        handleResponse200(deserializeJson!(Person)(res.readJson()));
        return;
      }
      if (handleResponsedefault is null) throw new Exception("Unhandled response status code default");
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
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

  static class PostAccountsAccountPersonsPersonResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(Person response) handleResponse200;

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
        handleResponse200(deserializeJson!(Person)(res.readJson()));
        return;
      }
      if (handleResponsedefault is null) throw new Exception("Unhandled response status code default");
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

  }

  /**
   * <p>Updates an existing person.</p>
   * See_Also: HTTP POST `/v1/accounts/{account}/persons/{person}`
   */
  void postAccountsAccountPersonsPerson(
      PostAccountsAccountPersonsPersonParams params,
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
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
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
    void delegate(Error_ response) handleResponsedefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        if (handleResponse200 is null) throw new Exception("Unhandled response status code 200");
        handleResponse200(deserializeJson!(DeletedPerson)(res.readJson()));
        return;
      }
      if (handleResponsedefault is null) throw new Exception("Unhandled response status code default");
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
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

  static class PostAccountsAccountBankAccountsResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(ExternalAccount response) handleResponse200;

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
        handleResponse200(deserializeJson!(ExternalAccount)(res.readJson()));
        return;
      }
      if (handleResponsedefault is null) throw new Exception("Unhandled response status code default");
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

  }

  /**
   * <p>Create an external account for a given account.</p>
   * See_Also: HTTP POST `/v1/accounts/{account}/bank_accounts`
   */
  void postAccountsAccountBankAccounts(
      PostAccountsAccountBankAccountsParams params,
      PostAccountsAccountBankAccountsResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/accounts/{account}/bank_accounts");
    if (!params.account.isNull)
      requestor.setPathParam("account", params.account);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
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
    void delegate(Error_ response) handleResponsedefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        if (handleResponse200 is null) throw new Exception("Unhandled response status code 200");
        handleResponse200(deserializeJson!(ExternalAccountList)(res.readJson()));
        return;
      }
      if (handleResponsedefault is null) throw new Exception("Unhandled response status code default");
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
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

  static class PostAccountsAccountExternalAccountsResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(ExternalAccount response) handleResponse200;

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
        handleResponse200(deserializeJson!(ExternalAccount)(res.readJson()));
        return;
      }
      if (handleResponsedefault is null) throw new Exception("Unhandled response status code default");
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

  }

  /**
   * <p>Create an external account for a given account.</p>
   * See_Also: HTTP POST `/v1/accounts/{account}/external_accounts`
   */
  void postAccountsAccountExternalAccounts(
      PostAccountsAccountExternalAccountsParams params,
      PostAccountsAccountExternalAccountsResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/accounts/{account}/external_accounts");
    if (!params.account.isNull)
      requestor.setPathParam("account", params.account);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
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
    void delegate(Error_ response) handleResponsedefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        if (handleResponse200 is null) throw new Exception("Unhandled response status code 200");
        handleResponse200(deserializeJson!(ListAccountCapability)(res.readJson()));
        return;
      }
      if (handleResponsedefault is null) throw new Exception("Unhandled response status code default");
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
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

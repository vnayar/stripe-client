// File automatically generated from OpenAPI spec.
module stripe.service.v1_accounts_service;

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
    Nullable!(Nullable!(string)) account;

    /**
     * Specifies which fields in the response should be expanded.
     */
    Nullable!(Nullable!(string)[]) expand;

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
        handleResponse200(deserializeJson!(Account)(res.readJson()));
        return;
      }
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   */
  void getAccountsAccount(
      GetAccountsAccountParams params,
      GetAccountsAccountResponseHandler responseHandler = null,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.GET,
        Servers.getServerUrl(),
        "/v1/accounts/{account}");
    if (!params.account.isNull)
      requestor.setPathParam("account", params.account.get.to!string);
    if (!params.expand.isNull)
      requestor.setQueryParam("expand", params.expand.get.to!string);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class PostAccountsAccountParams {
    /**
     */
    Nullable!(Nullable!(string)) account;

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
        handleResponse200(deserializeJson!(Account)(res.readJson()));
        return;
      }
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   */
  void postAccountsAccount(
      PostAccountsAccountParams params,
      PostAccountsAccountResponseHandler responseHandler = null,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/accounts/{account}");
    if (!params.account.isNull)
      requestor.setPathParam("account", params.account.get.to!string);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class DeleteAccountsAccountParams {
    /**
     */
    Nullable!(Nullable!(string)) account;

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
        handleResponse200(deserializeJson!(DeletedAccount)(res.readJson()));
        return;
      }
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   */
  void deleteAccountsAccount(
      DeleteAccountsAccountParams params,
      DeleteAccountsAccountResponseHandler responseHandler = null,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.DELETE,
        Servers.getServerUrl(),
        "/v1/accounts/{account}");
    if (!params.account.isNull)
      requestor.setPathParam("account", params.account.get.to!string);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class GetAccountsAccountPeopleParams {
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

    }

    Nullable!(AllPeopleRelationshipSpecs) relationship;

    /**
     * A cursor for use in pagination. `starting_after` is an object ID that defines your place in
     * the list. For instance, if you make a list request and receive 100 objects, ending with
     * `obj_foo`, your subsequent call can include `starting_after=obj_foo` in order to fetch the
     * next page of the list.
     */
    Nullable!(Nullable!(string)) starting_after;

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
      Nullable!(string) object;

      @optional
      Person[] data;

      /**
       * The URL where this list can be accessed.
       */
      @optional
      Nullable!(string) url;

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
        handleResponse200(deserializeJson!(PersonList)(res.readJson()));
        return;
      }
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   */
  void getAccountsAccountPeople(
      GetAccountsAccountPeopleParams params,
      GetAccountsAccountPeopleResponseHandler responseHandler = null,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.GET,
        Servers.getServerUrl(),
        "/v1/accounts/{account}/people");
    if (!params.account.isNull)
      requestor.setPathParam("account", params.account.get.to!string);
    if (!params.ending_before.isNull)
      requestor.setQueryParam("ending_before", params.ending_before.get.to!string);
    if (!params.expand.isNull)
      requestor.setQueryParam("expand", params.expand.get.to!string);
    if (!params.limit.isNull)
      requestor.setQueryParam("limit", params.limit.get.to!string);
    if (!params.relationship.isNull)
      requestor.setQueryParam("relationship", params.relationship.get.to!string);
    if (!params.starting_after.isNull)
      requestor.setQueryParam("starting_after", params.starting_after.get.to!string);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class PostAccountsAccountPeopleParams {
    /**
     */
    Nullable!(Nullable!(string)) account;

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
        handleResponse200(deserializeJson!(Person)(res.readJson()));
        return;
      }
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   */
  void postAccountsAccountPeople(
      PostAccountsAccountPeopleParams params,
      PostAccountsAccountPeopleResponseHandler responseHandler = null,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/accounts/{account}/people");
    if (!params.account.isNull)
      requestor.setPathParam("account", params.account.get.to!string);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class PostAccountsAccountLoginLinksParams {
    /**
     */
    Nullable!(Nullable!(string)) account;

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
        handleResponse200(deserializeJson!(LoginLink)(res.readJson()));
        return;
      }
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   */
  void postAccountsAccountLoginLinks(
      PostAccountsAccountLoginLinksParams params,
      PostAccountsAccountLoginLinksResponseHandler responseHandler = null,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/accounts/{account}/login_links");
    if (!params.account.isNull)
      requestor.setPathParam("account", params.account.get.to!string);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class GetAccountsAccountPersonsParams {
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

    }

    Nullable!(AllPeopleRelationshipSpecs) relationship;

    /**
     * A cursor for use in pagination. `starting_after` is an object ID that defines your place in
     * the list. For instance, if you make a list request and receive 100 objects, ending with
     * `obj_foo`, your subsequent call can include `starting_after=obj_foo` in order to fetch the
     * next page of the list.
     */
    Nullable!(Nullable!(string)) starting_after;

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
      Nullable!(string) object;

      @optional
      Person[] data;

      /**
       * The URL where this list can be accessed.
       */
      @optional
      Nullable!(string) url;

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
        handleResponse200(deserializeJson!(PersonList)(res.readJson()));
        return;
      }
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   */
  void getAccountsAccountPersons(
      GetAccountsAccountPersonsParams params,
      GetAccountsAccountPersonsResponseHandler responseHandler = null,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.GET,
        Servers.getServerUrl(),
        "/v1/accounts/{account}/persons");
    if (!params.account.isNull)
      requestor.setPathParam("account", params.account.get.to!string);
    if (!params.ending_before.isNull)
      requestor.setQueryParam("ending_before", params.ending_before.get.to!string);
    if (!params.expand.isNull)
      requestor.setQueryParam("expand", params.expand.get.to!string);
    if (!params.limit.isNull)
      requestor.setQueryParam("limit", params.limit.get.to!string);
    if (!params.relationship.isNull)
      requestor.setQueryParam("relationship", params.relationship.get.to!string);
    if (!params.starting_after.isNull)
      requestor.setQueryParam("starting_after", params.starting_after.get.to!string);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class PostAccountsAccountPersonsParams {
    /**
     */
    Nullable!(Nullable!(string)) account;

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
        handleResponse200(deserializeJson!(Person)(res.readJson()));
        return;
      }
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   */
  void postAccountsAccountPersons(
      PostAccountsAccountPersonsParams params,
      PostAccountsAccountPersonsResponseHandler responseHandler = null,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/accounts/{account}/persons");
    if (!params.account.isNull)
      requestor.setPathParam("account", params.account.get.to!string);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class GetAccountsAccountExternalAccountsIdParams {
    /**
     */
    Nullable!(Nullable!(string)) account;

    /**
     * Specifies which fields in the response should be expanded.
     */
    Nullable!(Nullable!(string)[]) expand;

    /**
     */
    Nullable!(Nullable!(string)) id;

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
        handleResponse200(deserializeJson!(ExternalAccount)(res.readJson()));
        return;
      }
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   */
  void getAccountsAccountExternalAccountsId(
      GetAccountsAccountExternalAccountsIdParams params,
      GetAccountsAccountExternalAccountsIdResponseHandler responseHandler = null,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.GET,
        Servers.getServerUrl(),
        "/v1/accounts/{account}/external_accounts/{id}");
    if (!params.account.isNull)
      requestor.setPathParam("account", params.account.get.to!string);
    if (!params.expand.isNull)
      requestor.setQueryParam("expand", params.expand.get.to!string);
    if (!params.id.isNull)
      requestor.setPathParam("id", params.id.get.to!string);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class PostAccountsAccountExternalAccountsIdParams {
    /**
     */
    Nullable!(Nullable!(string)) account;

    /**
     */
    Nullable!(Nullable!(string)) id;

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
        handleResponse200(deserializeJson!(ExternalAccount)(res.readJson()));
        return;
      }
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   */
  void postAccountsAccountExternalAccountsId(
      PostAccountsAccountExternalAccountsIdParams params,
      PostAccountsAccountExternalAccountsIdResponseHandler responseHandler = null,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/accounts/{account}/external_accounts/{id}");
    if (!params.account.isNull)
      requestor.setPathParam("account", params.account.get.to!string);
    if (!params.id.isNull)
      requestor.setPathParam("id", params.id.get.to!string);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class DeleteAccountsAccountExternalAccountsIdParams {
    /**
     */
    Nullable!(Nullable!(string)) account;

    /**
     */
    Nullable!(Nullable!(string)) id;

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
        handleResponse200(deserializeJson!(DeletedExternalAccount)(res.readJson()));
        return;
      }
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   */
  void deleteAccountsAccountExternalAccountsId(
      DeleteAccountsAccountExternalAccountsIdParams params,
      DeleteAccountsAccountExternalAccountsIdResponseHandler responseHandler = null,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.DELETE,
        Servers.getServerUrl(),
        "/v1/accounts/{account}/external_accounts/{id}");
    if (!params.account.isNull)
      requestor.setPathParam("account", params.account.get.to!string);
    if (!params.id.isNull)
      requestor.setPathParam("id", params.id.get.to!string);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class GetAccountsAccountBankAccountsIdParams {
    /**
     */
    Nullable!(Nullable!(string)) account;

    /**
     * Specifies which fields in the response should be expanded.
     */
    Nullable!(Nullable!(string)[]) expand;

    /**
     */
    Nullable!(Nullable!(string)) id;

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
        handleResponse200(deserializeJson!(ExternalAccount)(res.readJson()));
        return;
      }
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   */
  void getAccountsAccountBankAccountsId(
      GetAccountsAccountBankAccountsIdParams params,
      GetAccountsAccountBankAccountsIdResponseHandler responseHandler = null,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.GET,
        Servers.getServerUrl(),
        "/v1/accounts/{account}/bank_accounts/{id}");
    if (!params.account.isNull)
      requestor.setPathParam("account", params.account.get.to!string);
    if (!params.expand.isNull)
      requestor.setQueryParam("expand", params.expand.get.to!string);
    if (!params.id.isNull)
      requestor.setPathParam("id", params.id.get.to!string);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class PostAccountsAccountBankAccountsIdParams {
    /**
     */
    Nullable!(Nullable!(string)) account;

    /**
     */
    Nullable!(Nullable!(string)) id;

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
        handleResponse200(deserializeJson!(ExternalAccount)(res.readJson()));
        return;
      }
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   */
  void postAccountsAccountBankAccountsId(
      PostAccountsAccountBankAccountsIdParams params,
      PostAccountsAccountBankAccountsIdResponseHandler responseHandler = null,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/accounts/{account}/bank_accounts/{id}");
    if (!params.account.isNull)
      requestor.setPathParam("account", params.account.get.to!string);
    if (!params.id.isNull)
      requestor.setPathParam("id", params.id.get.to!string);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class DeleteAccountsAccountBankAccountsIdParams {
    /**
     */
    Nullable!(Nullable!(string)) account;

    /**
     */
    Nullable!(Nullable!(string)) id;

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
        handleResponse200(deserializeJson!(DeletedExternalAccount)(res.readJson()));
        return;
      }
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   */
  void deleteAccountsAccountBankAccountsId(
      DeleteAccountsAccountBankAccountsIdParams params,
      DeleteAccountsAccountBankAccountsIdResponseHandler responseHandler = null,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.DELETE,
        Servers.getServerUrl(),
        "/v1/accounts/{account}/bank_accounts/{id}");
    if (!params.account.isNull)
      requestor.setPathParam("account", params.account.get.to!string);
    if (!params.id.isNull)
      requestor.setPathParam("id", params.id.get.to!string);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class GetAccountsAccountPeoplePersonParams {
    /**
     */
    Nullable!(Nullable!(string)) account;

    /**
     * Specifies which fields in the response should be expanded.
     */
    Nullable!(Nullable!(string)[]) expand;

    /**
     */
    Nullable!(Nullable!(string)) person;

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
        handleResponse200(deserializeJson!(Person)(res.readJson()));
        return;
      }
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   */
  void getAccountsAccountPeoplePerson(
      GetAccountsAccountPeoplePersonParams params,
      GetAccountsAccountPeoplePersonResponseHandler responseHandler = null,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.GET,
        Servers.getServerUrl(),
        "/v1/accounts/{account}/people/{person}");
    if (!params.account.isNull)
      requestor.setPathParam("account", params.account.get.to!string);
    if (!params.expand.isNull)
      requestor.setQueryParam("expand", params.expand.get.to!string);
    if (!params.person.isNull)
      requestor.setPathParam("person", params.person.get.to!string);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class PostAccountsAccountPeoplePersonParams {
    /**
     */
    Nullable!(Nullable!(string)) account;

    /**
     */
    Nullable!(Nullable!(string)) person;

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
        handleResponse200(deserializeJson!(Person)(res.readJson()));
        return;
      }
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   */
  void postAccountsAccountPeoplePerson(
      PostAccountsAccountPeoplePersonParams params,
      PostAccountsAccountPeoplePersonResponseHandler responseHandler = null,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/accounts/{account}/people/{person}");
    if (!params.account.isNull)
      requestor.setPathParam("account", params.account.get.to!string);
    if (!params.person.isNull)
      requestor.setPathParam("person", params.person.get.to!string);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class DeleteAccountsAccountPeoplePersonParams {
    /**
     */
    Nullable!(Nullable!(string)) account;

    /**
     */
    Nullable!(Nullable!(string)) person;

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
        handleResponse200(deserializeJson!(DeletedPerson)(res.readJson()));
        return;
      }
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   */
  void deleteAccountsAccountPeoplePerson(
      DeleteAccountsAccountPeoplePersonParams params,
      DeleteAccountsAccountPeoplePersonResponseHandler responseHandler = null,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.DELETE,
        Servers.getServerUrl(),
        "/v1/accounts/{account}/people/{person}");
    if (!params.account.isNull)
      requestor.setPathParam("account", params.account.get.to!string);
    if (!params.person.isNull)
      requestor.setPathParam("person", params.person.get.to!string);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class GetAccountsParams {
    /**
     */
    Nullable!(Json) created;

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
     * A cursor for use in pagination. `starting_after` is an object ID that defines your place in
     * the list. For instance, if you make a list request and receive 100 objects, ending with
     * `obj_foo`, your subsequent call can include `starting_after=obj_foo` in order to fetch the
     * next page of the list.
     */
    Nullable!(Nullable!(string)) starting_after;

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
      Nullable!(string) object;

      @optional
      Account[] data;

      /**
       * The URL where this list can be accessed.
       */
      @optional
      Nullable!(string) url;

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
        handleResponse200(deserializeJson!(AccountList)(res.readJson()));
        return;
      }
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   */
  void getAccounts(
      GetAccountsParams params,
      GetAccountsResponseHandler responseHandler = null,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.GET,
        Servers.getServerUrl(),
        "/v1/accounts");
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
        handleResponse200(deserializeJson!(Account)(res.readJson()));
        return;
      }
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   */
  void postAccounts(
      PostAccountsResponseHandler responseHandler = null,
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
    Nullable!(Nullable!(string)) account;

    /**
     */
    Nullable!(Nullable!(string)) capability;

    /**
     * Specifies which fields in the response should be expanded.
     */
    Nullable!(Nullable!(string)[]) expand;

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
        handleResponse200(deserializeJson!(Capability)(res.readJson()));
        return;
      }
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   */
  void getAccountsAccountCapabilitiesCapability(
      GetAccountsAccountCapabilitiesCapabilityParams params,
      GetAccountsAccountCapabilitiesCapabilityResponseHandler responseHandler = null,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.GET,
        Servers.getServerUrl(),
        "/v1/accounts/{account}/capabilities/{capability}");
    if (!params.account.isNull)
      requestor.setPathParam("account", params.account.get.to!string);
    if (!params.capability.isNull)
      requestor.setPathParam("capability", params.capability.get.to!string);
    if (!params.expand.isNull)
      requestor.setQueryParam("expand", params.expand.get.to!string);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class PostAccountsAccountCapabilitiesCapabilityParams {
    /**
     */
    Nullable!(Nullable!(string)) account;

    /**
     */
    Nullable!(Nullable!(string)) capability;

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
        handleResponse200(deserializeJson!(Capability)(res.readJson()));
        return;
      }
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   */
  void postAccountsAccountCapabilitiesCapability(
      PostAccountsAccountCapabilitiesCapabilityParams params,
      PostAccountsAccountCapabilitiesCapabilityResponseHandler responseHandler = null,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/accounts/{account}/capabilities/{capability}");
    if (!params.account.isNull)
      requestor.setPathParam("account", params.account.get.to!string);
    if (!params.capability.isNull)
      requestor.setPathParam("capability", params.capability.get.to!string);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class PostAccountsAccountRejectParams {
    /**
     */
    Nullable!(Nullable!(string)) account;

  }

  static class PostAccountsAccountRejectBody {
    /**
     * The reason for rejecting the account. Can be `fraud`, `terms_of_service`, or `other`.
     */
    @optional
    Nullable!(string) reason;

    /**
     * Specifies which fields in the response should be expanded.
     */
    @optional
    Nullable!(string)[] expand;

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
        handleResponse200(deserializeJson!(Account)(res.readJson()));
        return;
      }
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   */
  void postAccountsAccountReject(
      PostAccountsAccountRejectParams params,
      PostAccountsAccountRejectBody requestBody,
      PostAccountsAccountRejectResponseHandler responseHandler = null,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/accounts/{account}/reject");
    if (!params.account.isNull)
      requestor.setPathParam("account", params.account.get.to!string);
    Security.apply(requestor);
    requestor.makeRequest(requestBody, responseHandler);
  }

  static class GetAccountsAccountPersonsPersonParams {
    /**
     */
    Nullable!(Nullable!(string)) account;

    /**
     * Specifies which fields in the response should be expanded.
     */
    Nullable!(Nullable!(string)[]) expand;

    /**
     */
    Nullable!(Nullable!(string)) person;

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
        handleResponse200(deserializeJson!(Person)(res.readJson()));
        return;
      }
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   */
  void getAccountsAccountPersonsPerson(
      GetAccountsAccountPersonsPersonParams params,
      GetAccountsAccountPersonsPersonResponseHandler responseHandler = null,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.GET,
        Servers.getServerUrl(),
        "/v1/accounts/{account}/persons/{person}");
    if (!params.account.isNull)
      requestor.setPathParam("account", params.account.get.to!string);
    if (!params.expand.isNull)
      requestor.setQueryParam("expand", params.expand.get.to!string);
    if (!params.person.isNull)
      requestor.setPathParam("person", params.person.get.to!string);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class PostAccountsAccountPersonsPersonParams {
    /**
     */
    Nullable!(Nullable!(string)) account;

    /**
     */
    Nullable!(Nullable!(string)) person;

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
        handleResponse200(deserializeJson!(Person)(res.readJson()));
        return;
      }
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   */
  void postAccountsAccountPersonsPerson(
      PostAccountsAccountPersonsPersonParams params,
      PostAccountsAccountPersonsPersonResponseHandler responseHandler = null,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/accounts/{account}/persons/{person}");
    if (!params.account.isNull)
      requestor.setPathParam("account", params.account.get.to!string);
    if (!params.person.isNull)
      requestor.setPathParam("person", params.person.get.to!string);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class DeleteAccountsAccountPersonsPersonParams {
    /**
     */
    Nullable!(Nullable!(string)) account;

    /**
     */
    Nullable!(Nullable!(string)) person;

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
        handleResponse200(deserializeJson!(DeletedPerson)(res.readJson()));
        return;
      }
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   */
  void deleteAccountsAccountPersonsPerson(
      DeleteAccountsAccountPersonsPersonParams params,
      DeleteAccountsAccountPersonsPersonResponseHandler responseHandler = null,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.DELETE,
        Servers.getServerUrl(),
        "/v1/accounts/{account}/persons/{person}");
    if (!params.account.isNull)
      requestor.setPathParam("account", params.account.get.to!string);
    if (!params.person.isNull)
      requestor.setPathParam("person", params.person.get.to!string);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class PostAccountsAccountBankAccountsParams {
    /**
     */
    Nullable!(Nullable!(string)) account;

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
        handleResponse200(deserializeJson!(ExternalAccount)(res.readJson()));
        return;
      }
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   */
  void postAccountsAccountBankAccounts(
      PostAccountsAccountBankAccountsParams params,
      PostAccountsAccountBankAccountsResponseHandler responseHandler = null,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/accounts/{account}/bank_accounts");
    if (!params.account.isNull)
      requestor.setPathParam("account", params.account.get.to!string);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class GetAccountsAccountExternalAccountsParams {
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
     * A cursor for use in pagination. `starting_after` is an object ID that defines your place in
     * the list. For instance, if you make a list request and receive 100 objects, ending with
     * `obj_foo`, your subsequent call can include `starting_after=obj_foo` in order to fetch the
     * next page of the list.
     */
    Nullable!(Nullable!(string)) starting_after;

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
      Nullable!(string) object;

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
      Nullable!(string) url;

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
        handleResponse200(deserializeJson!(ExternalAccountList)(res.readJson()));
        return;
      }
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   */
  void getAccountsAccountExternalAccounts(
      GetAccountsAccountExternalAccountsParams params,
      GetAccountsAccountExternalAccountsResponseHandler responseHandler = null,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.GET,
        Servers.getServerUrl(),
        "/v1/accounts/{account}/external_accounts");
    if (!params.account.isNull)
      requestor.setPathParam("account", params.account.get.to!string);
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

  static class PostAccountsAccountExternalAccountsParams {
    /**
     */
    Nullable!(Nullable!(string)) account;

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
        handleResponse200(deserializeJson!(ExternalAccount)(res.readJson()));
        return;
      }
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   */
  void postAccountsAccountExternalAccounts(
      PostAccountsAccountExternalAccountsParams params,
      PostAccountsAccountExternalAccountsResponseHandler responseHandler = null,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/accounts/{account}/external_accounts");
    if (!params.account.isNull)
      requestor.setPathParam("account", params.account.get.to!string);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class GetAccountsAccountCapabilitiesParams {
    /**
     */
    Nullable!(Nullable!(string)) account;

    /**
     * Specifies which fields in the response should be expanded.
     */
    Nullable!(Nullable!(string)[]) expand;

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
      Nullable!(string) object;

      @optional
      Capability[] data;

      /**
       * The URL where this list can be accessed.
       */
      @optional
      Nullable!(string) url;

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
        handleResponse200(deserializeJson!(ListAccountCapability)(res.readJson()));
        return;
      }
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   */
  void getAccountsAccountCapabilities(
      GetAccountsAccountCapabilitiesParams params,
      GetAccountsAccountCapabilitiesResponseHandler responseHandler = null,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.GET,
        Servers.getServerUrl(),
        "/v1/accounts/{account}/capabilities");
    if (!params.account.isNull)
      requestor.setPathParam("account", params.account.get.to!string);
    if (!params.expand.isNull)
      requestor.setQueryParam("expand", params.expand.get.to!string);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

}

// File automatically generated from OpenAPI spec.
module stripe.service.v1_issuing_authorizations_service;

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
public import stripe.model.issuing.authorization : IssuingAuthorization;
/**
 * Service to make REST API calls to paths beginning with: /v1/issuing/authorizations
 */
class V1IssuingAuthorizationsService {
  static class GetIssuingAuthorizationsAuthorizationParams {
    /**
     */
    Nullable!(Nullable!(string)) authorization;

    /**
     * Specifies which fields in the response should be expanded.
     */
    Nullable!(Nullable!(string)[]) expand;

  }

  static class GetIssuingAuthorizationsAuthorizationResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(IssuingAuthorization response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponsedefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        handleResponse200(deserializeJson!(IssuingAuthorization)(res.readJson()));
        return;
      }
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   */
  void getIssuingAuthorizationsAuthorization(
      GetIssuingAuthorizationsAuthorizationParams params,
      GetIssuingAuthorizationsAuthorizationResponseHandler responseHandler = null,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.GET,
        Servers.getServerUrl(),
        "/v1/issuing/authorizations/{authorization}");
    if (!params.authorization.isNull)
      requestor.setPathParam("authorization", params.authorization.get.to!string);
    if (!params.expand.isNull)
      requestor.setQueryParam("expand", params.expand.get.to!string);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class PostIssuingAuthorizationsAuthorizationParams {
    /**
     */
    Nullable!(Nullable!(string)) authorization;

  }

  static class PostIssuingAuthorizationsAuthorizationResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(IssuingAuthorization response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponsedefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        handleResponse200(deserializeJson!(IssuingAuthorization)(res.readJson()));
        return;
      }
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   */
  void postIssuingAuthorizationsAuthorization(
      PostIssuingAuthorizationsAuthorizationParams params,
      PostIssuingAuthorizationsAuthorizationResponseHandler responseHandler = null,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/issuing/authorizations/{authorization}");
    if (!params.authorization.isNull)
      requestor.setPathParam("authorization", params.authorization.get.to!string);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class PostIssuingAuthorizationsAuthorizationDeclineParams {
    /**
     */
    Nullable!(Nullable!(string)) authorization;

  }

  static class PostIssuingAuthorizationsAuthorizationDeclineResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(IssuingAuthorization response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponsedefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        handleResponse200(deserializeJson!(IssuingAuthorization)(res.readJson()));
        return;
      }
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   */
  void postIssuingAuthorizationsAuthorizationDecline(
      PostIssuingAuthorizationsAuthorizationDeclineParams params,
      PostIssuingAuthorizationsAuthorizationDeclineResponseHandler responseHandler = null,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/issuing/authorizations/{authorization}/decline");
    if (!params.authorization.isNull)
      requestor.setPathParam("authorization", params.authorization.get.to!string);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class PostIssuingAuthorizationsAuthorizationApproveParams {
    /**
     */
    Nullable!(Nullable!(string)) authorization;

  }

  static class PostIssuingAuthorizationsAuthorizationApproveResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(IssuingAuthorization response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponsedefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        handleResponse200(deserializeJson!(IssuingAuthorization)(res.readJson()));
        return;
      }
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   */
  void postIssuingAuthorizationsAuthorizationApprove(
      PostIssuingAuthorizationsAuthorizationApproveParams params,
      PostIssuingAuthorizationsAuthorizationApproveResponseHandler responseHandler = null,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/issuing/authorizations/{authorization}/approve");
    if (!params.authorization.isNull)
      requestor.setPathParam("authorization", params.authorization.get.to!string);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class GetIssuingAuthorizationsParams {
    /**
     * Only return authorizations that belong to the given card.
     */
    Nullable!(Nullable!(string)) card;

    /**
     * Only return authorizations that belong to the given cardholder.
     */
    Nullable!(Nullable!(string)) cardholder;

    /**
     * Only return authorizations that were created during the given date interval.
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

    /**
     * Only return authorizations with the given status. One of `pending`, `closed`, or `reversed`.
     */
    Nullable!(Nullable!(string)) status;

  }

  static class GetIssuingAuthorizationsResponseHandler : ResponseHandler {

    static class IssuingAuthorizationList {
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
      IssuingAuthorization[] data;

      /**
       * The URL where this list can be accessed.
       */
      @optional
      Nullable!(string) url;

    }

    /**
     * Successful response.
     */
    void delegate(IssuingAuthorizationList response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponsedefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        handleResponse200(deserializeJson!(IssuingAuthorizationList)(res.readJson()));
        return;
      }
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   */
  void getIssuingAuthorizations(
      GetIssuingAuthorizationsParams params,
      GetIssuingAuthorizationsResponseHandler responseHandler = null,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.GET,
        Servers.getServerUrl(),
        "/v1/issuing/authorizations");
    if (!params.card.isNull)
      requestor.setQueryParam("card", params.card.get.to!string);
    if (!params.cardholder.isNull)
      requestor.setQueryParam("cardholder", params.cardholder.get.to!string);
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
    if (!params.status.isNull)
      requestor.setQueryParam("status", params.status.get.to!string);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

}

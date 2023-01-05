// File automatically generated from OpenAPI spec.
module stripe.service.v1_issuing_authorizations_service;

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
public import stripe.model.issuing.authorization : IssuingAuthorization;

/**
 * Service to make REST API calls to paths beginning with: /v1/issuing/authorizations
 */
class V1IssuingAuthorizationsService {
  static class GetIssuingAuthorizationsAuthorizationParams {
    /**
     */
    string authorization;

    /**
     * Specifies which fields in the response should be expanded.
     */
    string[] expand;

    mixin AddBuilder!(typeof(this));

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
        if (handleResponse200 is null) throw new Exception("Unhandled response status code 200");
        handleResponse200(deserializeJson!(IssuingAuthorization)(res.readJson()));
        return;
      }
      if (handleResponsedefault is null) throw new Exception("Unhandled response status code default");
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

  }

  /**
   * <p>Retrieves an Issuing <code>Authorization</code> object.</p>
   * See_Also: HTTP GET `/v1/issuing/authorizations/{authorization}`
   */
  void getIssuingAuthorizationsAuthorization(
      GetIssuingAuthorizationsAuthorizationParams params,
      GetIssuingAuthorizationsAuthorizationResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.GET,
        Servers.getServerUrl(),
        "/v1/issuing/authorizations/{authorization}");
    if (!params.authorization.isNull)
      requestor.setPathParam("authorization", params.authorization);
    if (!params.expand.isNull)
      requestor.setQueryParam!("deepObject")("expand", params.expand);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class PostIssuingAuthorizationsAuthorizationParams {
    /**
     */
    string authorization;

    mixin AddBuilder!(typeof(this));

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
        if (handleResponse200 is null) throw new Exception("Unhandled response status code 200");
        handleResponse200(deserializeJson!(IssuingAuthorization)(res.readJson()));
        return;
      }
      if (handleResponsedefault is null) throw new Exception("Unhandled response status code default");
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

  }

  /**
   * <p>Updates the specified Issuing <code>Authorization</code> object by setting the values of the
   * parameters passed. Any parameters not provided will be left unchanged.</p>
   * See_Also: HTTP POST `/v1/issuing/authorizations/{authorization}`
   */
  void postIssuingAuthorizationsAuthorization(
      PostIssuingAuthorizationsAuthorizationParams params,
      PostIssuingAuthorizationsAuthorizationResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/issuing/authorizations/{authorization}");
    if (!params.authorization.isNull)
      requestor.setPathParam("authorization", params.authorization);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class PostIssuingAuthorizationsAuthorizationDeclineParams {
    /**
     */
    string authorization;

    mixin AddBuilder!(typeof(this));

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
        if (handleResponse200 is null) throw new Exception("Unhandled response status code 200");
        handleResponse200(deserializeJson!(IssuingAuthorization)(res.readJson()));
        return;
      }
      if (handleResponsedefault is null) throw new Exception("Unhandled response status code default");
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

  }

  /**
   * <p>Declines a pending Issuing <code>Authorization</code> object. This request should be made
   * within the timeout window of the <a href="/docs/issuing/controls/real-time-authorizations">real
   * time authorization</a> flow.
   * You can also respond directly to the webhook request to decline an authorization (preferred).
   * More details can be found <a
   * href="https://site-admin.stripe.com/docs/issuing/controls/real-time-authorizations#authorizatio
   * n-handling">here</a>.</p>
   * See_Also: HTTP POST `/v1/issuing/authorizations/{authorization}/decline`
   */
  void postIssuingAuthorizationsAuthorizationDecline(
      PostIssuingAuthorizationsAuthorizationDeclineParams params,
      PostIssuingAuthorizationsAuthorizationDeclineResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/issuing/authorizations/{authorization}/decline");
    if (!params.authorization.isNull)
      requestor.setPathParam("authorization", params.authorization);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class PostIssuingAuthorizationsAuthorizationApproveParams {
    /**
     */
    string authorization;

    mixin AddBuilder!(typeof(this));

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
        if (handleResponse200 is null) throw new Exception("Unhandled response status code 200");
        handleResponse200(deserializeJson!(IssuingAuthorization)(res.readJson()));
        return;
      }
      if (handleResponsedefault is null) throw new Exception("Unhandled response status code default");
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

  }

  /**
   * <p>Approves a pending Issuing <code>Authorization</code> object. This request should be made
   * within the timeout window of the <a
   * href="/docs/issuing/controls/real-time-authorizations">real-time authorization</a> flow. 
   * You can also respond directly to the webhook request to approve an authorization (preferred).
   * More details can be found <a
   * href="https://site-admin.stripe.com/docs/issuing/controls/real-time-authorizations#authorizatio
   * n-handling">here</a>.</p>
   * See_Also: HTTP POST `/v1/issuing/authorizations/{authorization}/approve`
   */
  void postIssuingAuthorizationsAuthorizationApprove(
      PostIssuingAuthorizationsAuthorizationApproveParams params,
      PostIssuingAuthorizationsAuthorizationApproveResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/issuing/authorizations/{authorization}/approve");
    if (!params.authorization.isNull)
      requestor.setPathParam("authorization", params.authorization);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class GetIssuingAuthorizationsParams {
    /**
     * Only return authorizations that belong to the given card.
     */
    string card;

    /**
     * Only return authorizations that belong to the given cardholder.
     */
    string cardholder;

    /**
     * Only return authorizations that were created during the given date interval.
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

    /**
     * Only return authorizations with the given status. One of `pending`, `closed`, or `reversed`.
     */
    string status;

    mixin AddBuilder!(typeof(this));

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
      string object;

      @optional
      IssuingAuthorization[] data;

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
        if (handleResponse200 is null) throw new Exception("Unhandled response status code 200");
        handleResponse200(deserializeJson!(IssuingAuthorizationList)(res.readJson()));
        return;
      }
      if (handleResponsedefault is null) throw new Exception("Unhandled response status code default");
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

  }

  /**
   * <p>Returns a list of Issuing <code>Authorization</code> objects. The objects are sorted in
   * descending order by creation date, with the most recently created object appearing first.</p>
   * See_Also: HTTP GET `/v1/issuing/authorizations`
   */
  void getIssuingAuthorizations(
      GetIssuingAuthorizationsParams params,
      GetIssuingAuthorizationsResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.GET,
        Servers.getServerUrl(),
        "/v1/issuing/authorizations");
    if (!params.card.isNull)
      requestor.setQueryParam!("deepObject")("card", params.card);
    if (!params.cardholder.isNull)
      requestor.setQueryParam!("deepObject")("cardholder", params.cardholder);
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
    if (!params.status.isNull)
      requestor.setQueryParam!("deepObject")("status", params.status);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  mixin AddBuilder!(typeof(this));

}

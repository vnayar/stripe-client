// File automatically generated from OpenAPI spec.
module stripe.service.v1_identity_verification_sessions_service;

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
public import stripe.model.identity.verification_session : IdentityVerificationSession;
/**
 * Service to make REST API calls to paths beginning with: /v1/identity/verification_sessions
 */
class V1IdentityVerificationSessionsService {
  static class PostIdentityVerificationSessionsSessionCancelParams {
    /**
     */
    Nullable!(Nullable!(string)) session;

  }

  static class PostIdentityVerificationSessionsSessionCancelResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(IdentityVerificationSession response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponsedefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        handleResponse200(deserializeJson!(IdentityVerificationSession)(res.readJson()));
        return;
      }
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   */
  void postIdentityVerificationSessionsSessionCancel(
      PostIdentityVerificationSessionsSessionCancelParams params,
      PostIdentityVerificationSessionsSessionCancelResponseHandler responseHandler = null,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/identity/verification_sessions/{session}/cancel");
    if (!params.session.isNull)
      requestor.setPathParam("session", params.session.get.to!string);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class PostIdentityVerificationSessionsSessionRedactParams {
    /**
     */
    Nullable!(Nullable!(string)) session;

  }

  static class PostIdentityVerificationSessionsSessionRedactResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(IdentityVerificationSession response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponsedefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        handleResponse200(deserializeJson!(IdentityVerificationSession)(res.readJson()));
        return;
      }
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   */
  void postIdentityVerificationSessionsSessionRedact(
      PostIdentityVerificationSessionsSessionRedactParams params,
      PostIdentityVerificationSessionsSessionRedactResponseHandler responseHandler = null,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/identity/verification_sessions/{session}/redact");
    if (!params.session.isNull)
      requestor.setPathParam("session", params.session.get.to!string);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class GetIdentityVerificationSessionsSessionParams {
    /**
     * Specifies which fields in the response should be expanded.
     */
    Nullable!(Nullable!(string)[]) expand;

    /**
     */
    Nullable!(Nullable!(string)) session;

  }

  static class GetIdentityVerificationSessionsSessionResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(IdentityVerificationSession response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponsedefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        handleResponse200(deserializeJson!(IdentityVerificationSession)(res.readJson()));
        return;
      }
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   */
  void getIdentityVerificationSessionsSession(
      GetIdentityVerificationSessionsSessionParams params,
      GetIdentityVerificationSessionsSessionResponseHandler responseHandler = null,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.GET,
        Servers.getServerUrl(),
        "/v1/identity/verification_sessions/{session}");
    if (!params.expand.isNull)
      requestor.setQueryParam("expand", params.expand.get.to!string);
    if (!params.session.isNull)
      requestor.setPathParam("session", params.session.get.to!string);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class PostIdentityVerificationSessionsSessionParams {
    /**
     */
    Nullable!(Nullable!(string)) session;

  }

  static class PostIdentityVerificationSessionsSessionResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(IdentityVerificationSession response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponsedefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        handleResponse200(deserializeJson!(IdentityVerificationSession)(res.readJson()));
        return;
      }
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   */
  void postIdentityVerificationSessionsSession(
      PostIdentityVerificationSessionsSessionParams params,
      PostIdentityVerificationSessionsSessionResponseHandler responseHandler = null,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/identity/verification_sessions/{session}");
    if (!params.session.isNull)
      requestor.setPathParam("session", params.session.get.to!string);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class GetIdentityVerificationSessionsParams {
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

    /**
     * Only return VerificationSessions with this status. [Learn more about the lifecycle of
     * sessions](https://stripe.com/docs/identity/how-sessions-work).
     */
    Nullable!(Nullable!(string)) status;

  }

  static class GetIdentityVerificationSessionsResponseHandler : ResponseHandler {

    static class GelatoVerificationSessionList {
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
      IdentityVerificationSession[] data;

      /**
       * The URL where this list can be accessed.
       */
      @optional
      Nullable!(string) url;

    }

    /**
     * Successful response.
     */
    void delegate(GelatoVerificationSessionList response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponsedefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        handleResponse200(deserializeJson!(GelatoVerificationSessionList)(res.readJson()));
        return;
      }
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   */
  void getIdentityVerificationSessions(
      GetIdentityVerificationSessionsParams params,
      GetIdentityVerificationSessionsResponseHandler responseHandler = null,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.GET,
        Servers.getServerUrl(),
        "/v1/identity/verification_sessions");
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

  static class PostIdentityVerificationSessionsBody {
    /**
     * The type of [verification check](https://stripe.com/docs/identity/verification-checks) to be
     * performed.
     */
    @optional
    Nullable!(string) type;

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

    static class SessionOptionsParam {
      @optional
      Json document;

    }

    /**
     * A set of options for the session’s verification checks.
     */
    @optional
    SessionOptionsParam options;

    /**
     * The URL that the user will be redirected to upon completing the verification flow.
     */
    @optional
    Nullable!(string) return_url;

  }

  static class PostIdentityVerificationSessionsResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(IdentityVerificationSession response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponsedefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        handleResponse200(deserializeJson!(IdentityVerificationSession)(res.readJson()));
        return;
      }
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   */
  void postIdentityVerificationSessions(
      PostIdentityVerificationSessionsBody requestBody,
      PostIdentityVerificationSessionsResponseHandler responseHandler = null,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/identity/verification_sessions");
    Security.apply(requestor);
    requestor.makeRequest(requestBody, responseHandler);
  }

}

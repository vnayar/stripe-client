// File automatically generated from OpenAPI spec.
module stripe.service.v1_identity_verification_sessions_service;

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
public import stripe.model.identity.verification_session : IdentityVerificationSession;

/**
 * Service to make REST API calls to paths beginning with: /v1/identity/verification_sessions
 */
class V1IdentityVerificationSessionsService {
  static class PostIdentityVerificationSessionsSessionCancelParams {
    /**
     */
    string session;

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
        if (handleResponse200 is null) throw new Exception("Unhandled response status code 200");
        handleResponse200(deserializeJson!(IdentityVerificationSession)(res.readJson()));
        return;
      }
      if (handleResponsedefault is null) throw new Exception("Unhandled response status code default");
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   * <p>A VerificationSession object can be canceled when it is in <code>requires_input</code> <a
   * href="/docs/identity/how-sessions-work">status</a>.</p>
   * <p>Once canceled, future submission attempts are disabled. This cannot be undone. <a
   * href="/docs/identity/verification-sessions#cancel">Learn more</a>.</p>
   * See_Also: HTTP POST `/v1/identity/verification_sessions/{session}/cancel`
   */
  void postIdentityVerificationSessionsSessionCancel(
      PostIdentityVerificationSessionsSessionCancelParams params,
      PostIdentityVerificationSessionsSessionCancelResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/identity/verification_sessions/{session}/cancel");
    if (!params.session.isNull)
      requestor.setPathParam("session", params.session);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class PostIdentityVerificationSessionsSessionRedactParams {
    /**
     */
    string session;

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
        if (handleResponse200 is null) throw new Exception("Unhandled response status code 200");
        handleResponse200(deserializeJson!(IdentityVerificationSession)(res.readJson()));
        return;
      }
      if (handleResponsedefault is null) throw new Exception("Unhandled response status code default");
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   * <p>Redact a VerificationSession to remove all collected information from Stripe. This will
   * redact
   * the VerificationSession and all objects related to it, including VerificationReports, Events,
   * request logs, etc.</p>
   * <p>A VerificationSession object can be redacted when it is in <code>requires_input</code> or
   * <code>verified</code>
   * <a href="/docs/identity/how-sessions-work">status</a>. Redacting a VerificationSession in
   * <code>requires_action</code>
   * state will automatically cancel it.</p>
   * <p>The redaction process may take up to four days. When the redaction process is in progress,
   * the
   * VerificationSession’s <code>redaction.status</code> field will be set to
   * <code>processing</code>; when the process is
   * finished, it will change to <code>redacted</code> and an
   * <code>identity.verification_session.redacted</code> event
   * will be emitted.</p>
   * <p>Redaction is irreversible. Redacted objects are still accessible in the Stripe API, but all
   * the
   * fields that contain personal data will be replaced by the string <code>[redacted]</code> or a
   * similar
   * placeholder. The <code>metadata</code> field will also be erased. Redacted objects cannot be
   * updated or
   * used for any purpose.</p>
   * <p><a href="/docs/identity/verification-sessions#redact">Learn more</a>.</p>
   * See_Also: HTTP POST `/v1/identity/verification_sessions/{session}/redact`
   */
  void postIdentityVerificationSessionsSessionRedact(
      PostIdentityVerificationSessionsSessionRedactParams params,
      PostIdentityVerificationSessionsSessionRedactResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/identity/verification_sessions/{session}/redact");
    if (!params.session.isNull)
      requestor.setPathParam("session", params.session);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class GetIdentityVerificationSessionsSessionParams {
    /**
     * Specifies which fields in the response should be expanded.
     */
    string[] expand;

    /**
     */
    string session;

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
        if (handleResponse200 is null) throw new Exception("Unhandled response status code 200");
        handleResponse200(deserializeJson!(IdentityVerificationSession)(res.readJson()));
        return;
      }
      if (handleResponsedefault is null) throw new Exception("Unhandled response status code default");
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   * <p>Retrieves the details of a VerificationSession that was previously created.</p>
   * <p>When the session status is <code>requires_input</code>, you can use this method to retrieve
   * a valid
   * <code>client_secret</code> or <code>url</code> to allow re-submission.</p>
   * See_Also: HTTP GET `/v1/identity/verification_sessions/{session}`
   */
  void getIdentityVerificationSessionsSession(
      GetIdentityVerificationSessionsSessionParams params,
      GetIdentityVerificationSessionsSessionResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.GET,
        Servers.getServerUrl(),
        "/v1/identity/verification_sessions/{session}");
    if (!params.expand.isNull)
      requestor.setQueryParam!("deepObject")("expand", params.expand);
    if (!params.session.isNull)
      requestor.setPathParam("session", params.session);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class PostIdentityVerificationSessionsSessionParams {
    /**
     */
    string session;

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
        if (handleResponse200 is null) throw new Exception("Unhandled response status code 200");
        handleResponse200(deserializeJson!(IdentityVerificationSession)(res.readJson()));
        return;
      }
      if (handleResponsedefault is null) throw new Exception("Unhandled response status code default");
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   * <p>Updates a VerificationSession object.</p>
   * <p>When the session status is <code>requires_input</code>, you can use this method to update
   * the
   * verification check and options.</p>
   * See_Also: HTTP POST `/v1/identity/verification_sessions/{session}`
   */
  void postIdentityVerificationSessionsSession(
      PostIdentityVerificationSessionsSessionParams params,
      PostIdentityVerificationSessionsSessionResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/identity/verification_sessions/{session}");
    if (!params.session.isNull)
      requestor.setPathParam("session", params.session);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class GetIdentityVerificationSessionsParams {
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

    /**
     * Only return VerificationSessions with this status. [Learn more about the lifecycle of
     * sessions](https://stripe.com/docs/identity/how-sessions-work).
     */
    string status;

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
      string object;

      @optional
      IdentityVerificationSession[] data;

      /**
       * The URL where this list can be accessed.
       */
      @optional
      string url;

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
        if (handleResponse200 is null) throw new Exception("Unhandled response status code 200");
        handleResponse200(deserializeJson!(GelatoVerificationSessionList)(res.readJson()));
        return;
      }
      if (handleResponsedefault is null) throw new Exception("Unhandled response status code default");
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   * <p>Returns a list of VerificationSessions</p>
   * See_Also: HTTP GET `/v1/identity/verification_sessions`
   */
  void getIdentityVerificationSessions(
      GetIdentityVerificationSessionsParams params,
      GetIdentityVerificationSessionsResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.GET,
        Servers.getServerUrl(),
        "/v1/identity/verification_sessions");
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

  static class PostIdentityVerificationSessionsBody {
    /**
     * The type of [verification check](https://stripe.com/docs/identity/verification-checks) to be
     * performed.
     */
    @optional
    string type;

    /**
     * Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an
     * object. This can be useful for storing additional information about the object in a
     * structured format. Individual keys can be unset by posting an empty value to them. All keys
     * can be unset by posting an empty value to `metadata`.
     */
    @optional
    string[string] metadata;

    /**
     * Specifies which fields in the response should be expanded.
     */
    @optional
    string[] expand;

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
    string return_url;

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
        if (handleResponse200 is null) throw new Exception("Unhandled response status code 200");
        handleResponse200(deserializeJson!(IdentityVerificationSession)(res.readJson()));
        return;
      }
      if (handleResponsedefault is null) throw new Exception("Unhandled response status code default");
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   * <p>Creates a VerificationSession object.</p>
   * <p>After the VerificationSession is created, display a verification modal using the session
   * <code>client_secret</code> or send your users to the session’s <code>url</code>.</p>
   * <p>If your API key is in test mode, verification checks won’t actually process, though
   * everything else will occur as if in live mode.</p>
   * <p>Related guide: <a href="/docs/identity/verify-identity-documents">Verify your users’
   * identity documents</a>.</p>
   * See_Also: HTTP POST `/v1/identity/verification_sessions`
   */
  void postIdentityVerificationSessions(
      PostIdentityVerificationSessionsBody requestBody,
      PostIdentityVerificationSessionsResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/identity/verification_sessions");
    requestor.setHeaderParam("Content-Type", "application/x-www-form-urlencoded");
    Security.apply(requestor);
    requestor.makeRequest(requestBody, responseHandler);
  }

}

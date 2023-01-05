// File automatically generated from OpenAPI spec.
module stripe.service.v1_apps_secrets_service;

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

public import stripe.model.apps.secret : AppsSecret;
public import stripe.model.error : Error_;

/**
 * Service to make REST API calls to paths beginning with: /v1/apps/secrets
 */
class V1AppsSecretsService {
  static class GetAppsSecretsParams {
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
     * Specifies the scoping of the secret. Requests originating from UI extensions can only access
     * account-scoped secrets or secrets scoped to their own user.
     */
    static class ScopeParam {
      @optional
      string type;

      @optional
      string user;

      mixin AddBuilder!(typeof(this));

    }

    ScopeParam scope_;

    /**
     * A cursor for use in pagination. `starting_after` is an object ID that defines your place in
     * the list. For instance, if you make a list request and receive 100 objects, ending with
     * `obj_foo`, your subsequent call can include `starting_after=obj_foo` in order to fetch the
     * next page of the list.
     */
    string starting_after;

    mixin AddBuilder!(typeof(this));

  }

  static class GetAppsSecretsResponseHandler : ResponseHandler {

    static class SecretServiceResourceSecretList {
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
      AppsSecret[] data;

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
    void delegate(SecretServiceResourceSecretList response) handleResponse200;

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
        handleResponse200(deserializeJson!(SecretServiceResourceSecretList)(res.readJson()));
        return;
      }
      if (handleResponsedefault is null) throw new Exception("Unhandled response status code default");
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

  }

  /**
   * <p>List all secrets stored on the given scope.</p>
   * See_Also: HTTP GET `/v1/apps/secrets`
   */
  void getAppsSecrets(
      GetAppsSecretsParams params,
      GetAppsSecretsResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.GET,
        Servers.getServerUrl(),
        "/v1/apps/secrets");
    if (!params.ending_before.isNull)
      requestor.setQueryParam!("deepObject")("ending_before", params.ending_before);
    if (!params.expand.isNull)
      requestor.setQueryParam!("deepObject")("expand", params.expand);
    if (!params.limit.isNull)
      requestor.setQueryParam!("deepObject")("limit", params.limit);
    if (!params.scope_.isNull)
      requestor.setQueryParam!("deepObject")("scope", params.scope_);
    if (!params.starting_after.isNull)
      requestor.setQueryParam!("deepObject")("starting_after", params.starting_after);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class PostAppsSecretsBody {
    /**
     * The plaintext secret value to be stored.
     */
    @optional
    string payload;

    static class ScopeParam {
      @optional
      string type;

      @optional
      string user;

      mixin AddBuilder!(typeof(this));

    }

    /**
     * Specifies the scoping of the secret. Requests originating from UI extensions can only access
     * account-scoped secrets or secrets scoped to their own user.
     */
    @optional
    ScopeParam scope_;

    /**
     * Specifies which fields in the response should be expanded.
     */
    @optional
    string[] expand;

    /**
     * The Unix timestamp for the expiry time of the secret, after which the secret deletes.
     */
    @optional
    Nullable!(long) expires_at;

    /**
     * A name for the secret that's unique within the scope.
     */
    @optional
    string name;

    mixin AddBuilder!(typeof(this));

  }

  static class PostAppsSecretsResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(AppsSecret response) handleResponse200;

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
        handleResponse200(deserializeJson!(AppsSecret)(res.readJson()));
        return;
      }
      if (handleResponsedefault is null) throw new Exception("Unhandled response status code default");
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

  }

  /**
   * <p>Create or replace a secret in the secret store.</p>
   * See_Also: HTTP POST `/v1/apps/secrets`
   */
  void postAppsSecrets(
      PostAppsSecretsBody requestBody,
      PostAppsSecretsResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/apps/secrets");
    requestor.setHeaderParam("Content-Type", "application/x-www-form-urlencoded");
    Security.apply(requestor);
    requestor.makeRequest(requestBody, responseHandler);
  }

  mixin AddBuilder!(typeof(this));

}

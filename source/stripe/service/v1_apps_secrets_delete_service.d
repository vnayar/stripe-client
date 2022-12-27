// File automatically generated from OpenAPI spec.
module stripe.service.v1_apps_secrets_delete_service;

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

public import stripe.model.apps.secret : AppsSecret;
public import stripe.model.error : Error_;
/**
 * Service to make REST API calls to paths beginning with: /v1/apps/secrets/delete
 */
class V1AppsSecretsDeleteService {
  static class PostAppsSecretsDeleteBody {
    static class ScopeParam {
      @optional
      Nullable!(string) type;

      @optional
      Nullable!(string) user;

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
    Nullable!(string)[] expand;

    /**
     * A name for the secret that's unique within the scope.
     */
    @optional
    Nullable!(string) name;

  }

  static class PostAppsSecretsDeleteResponseHandler : ResponseHandler {

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
        handleResponse200(deserializeJson!(AppsSecret)(res.readJson()));
        return;
      }
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   */
  void postAppsSecretsDelete(
      PostAppsSecretsDeleteBody requestBody,
      PostAppsSecretsDeleteResponseHandler responseHandler = null,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/apps/secrets/delete");
    Security.apply(requestor);
    requestor.makeRequest(requestBody, responseHandler);
  }

}

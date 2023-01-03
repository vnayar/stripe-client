// File automatically generated from OpenAPI spec.
module stripe.service.v1_apps_secrets_find_service;

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
 * Service to make REST API calls to paths beginning with: /v1/apps/secrets/find
 */
class V1AppsSecretsFindService {
  static class GetAppsSecretsFindParams {
    /**
     * Specifies which fields in the response should be expanded.
     */
    Nullable!(Nullable!(string)[]) expand;

    /**
     * A name for the secret that's unique within the scope.
     */
    Nullable!(Nullable!(string)) name;

    /**
     * Specifies the scoping of the secret. Requests originating from UI extensions can only access
     * account-scoped secrets or secrets scoped to their own user.
     */
    static class ScopeParam {
      @optional
      Nullable!(string) type;

      @optional
      Nullable!(string) user;

    }

    Nullable!(ScopeParam) scope_;

  }

  static class GetAppsSecretsFindResponseHandler : ResponseHandler {

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
   * <p>Finds a secret in the secret store by name and scope.</p>
   * See_Also: HTTP GET `/v1/apps/secrets/find`
   */
  void getAppsSecretsFind(
      GetAppsSecretsFindParams params,
      GetAppsSecretsFindResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.GET,
        Servers.getServerUrl(),
        "/v1/apps/secrets/find");
    if (!params.expand.isNull)
      requestor.setQueryParam("expand", params.expand.get.to!string);
    if (!params.name.isNull)
      requestor.setQueryParam("name", params.name.get.to!string);
    if (!params.scope_.isNull)
      requestor.setQueryParam("scope", params.scope_.get.to!string);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

}

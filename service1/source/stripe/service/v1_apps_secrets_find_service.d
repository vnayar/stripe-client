// File automatically generated from OpenAPI spec.
module stripe.service.v1_apps_secrets_find_service;

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
 * Service to make REST API calls to paths beginning with: /v1/apps/secrets/find
 */
class V1AppsSecretsFindService {
  static class GetAppsSecretsFindParams {
    /**
     * Specifies which fields in the response should be expanded.
     */
    string[] expand;

    /**
     * A name for the secret that's unique within the scope.
     */
    string name;

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

    mixin AddBuilder!(typeof(this));

  }

  static class GetAppsSecretsFindResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(AppsSecret response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponseDefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        if (handleResponse200 is null) throw new Exception("Unhandled response status code 200");
        handleResponse200(deserializeJson!(AppsSecret)(res.readJson()));
        return;
      }
      if (handleResponseDefault is null) throw new Exception("Unhandled response status code default");
      handleResponseDefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

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
      requestor.setQueryParam!("deepObject")("expand", params.expand);
    if (!params.name.isNull)
      requestor.setQueryParam!("deepObject")("name", params.name);
    if (!params.scope_.isNull)
      requestor.setQueryParam!("deepObject")("scope", params.scope_);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  mixin AddBuilder!(typeof(this));

}

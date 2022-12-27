// File automatically generated from OpenAPI spec.
module stripe.service.v1_ephemeral_keys_service;

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

public import stripe.model.ephemeral_key : EphemeralKey;
public import stripe.model.error : Error_;
/**
 * Service to make REST API calls to paths beginning with: /v1/ephemeral_keys
 */
class V1EphemeralKeysService {
  static class PostEphemeralKeysResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(EphemeralKey response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponsedefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        handleResponse200(deserializeJson!(EphemeralKey)(res.readJson()));
        return;
      }
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   */
  void postEphemeralKeys(
      PostEphemeralKeysResponseHandler responseHandler = null,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/ephemeral_keys");
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class DeleteEphemeralKeysKeyParams {
    /**
     */
    Nullable!(Nullable!(string)) key;

  }

  static class DeleteEphemeralKeysKeyResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(EphemeralKey response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponsedefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        handleResponse200(deserializeJson!(EphemeralKey)(res.readJson()));
        return;
      }
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   */
  void deleteEphemeralKeysKey(
      DeleteEphemeralKeysKeyParams params,
      DeleteEphemeralKeysKeyResponseHandler responseHandler = null,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.DELETE,
        Servers.getServerUrl(),
        "/v1/ephemeral_keys/{key}");
    if (!params.key.isNull)
      requestor.setPathParam("key", params.key.get.to!string);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

}

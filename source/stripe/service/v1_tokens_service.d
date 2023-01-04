// File automatically generated from OpenAPI spec.
module stripe.service.v1_tokens_service;

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
public import stripe.model.token : Token;

/**
 * Service to make REST API calls to paths beginning with: /v1/tokens
 */
class V1TokensService {
  static class GetTokensTokenParams {
    /**
     * Specifies which fields in the response should be expanded.
     */
    string[] expand;

    /**
     */
    string token;

  }

  static class GetTokensTokenResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(Token response) handleResponse200;

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
        handleResponse200(deserializeJson!(Token)(res.readJson()));
        return;
      }
      if (handleResponsedefault is null) throw new Exception("Unhandled response status code default");
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   * <p>Retrieves the token with the given ID.</p>
   * See_Also: HTTP GET `/v1/tokens/{token}`
   */
  void getTokensToken(
      GetTokensTokenParams params,
      GetTokensTokenResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.GET,
        Servers.getServerUrl(),
        "/v1/tokens/{token}");
    if (!params.expand.isNull)
      requestor.setQueryParam!("deepObject")("expand", params.expand);
    if (!params.token.isNull)
      requestor.setPathParam("token", params.token);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class PostTokensResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(Token response) handleResponse200;

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
        handleResponse200(deserializeJson!(Token)(res.readJson()));
        return;
      }
      if (handleResponsedefault is null) throw new Exception("Unhandled response status code default");
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   * <p>Creates a single-use token that represents a bank account’s details.
   * This token can be used with any API method in place of a bank account dictionary. This token
   * can be used only once, by attaching it to a <a href="#accounts">Custom account</a>.</p>
   * See_Also: HTTP POST `/v1/tokens`
   */
  void postTokens(
      PostTokensResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/tokens");
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

}

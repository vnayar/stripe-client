// File automatically generated from OpenAPI spec.
module stripe.service.v1_terminal_connection_tokens_service;

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
public import stripe.model.terminal.connection_token : TerminalConnectionToken;
/**
 * Service to make REST API calls to paths beginning with: /v1/terminal/connection_tokens
 */
class V1TerminalConnectionTokensService {
  static class PostTerminalConnectionTokensResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(TerminalConnectionToken response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponsedefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        handleResponse200(deserializeJson!(TerminalConnectionToken)(res.readJson()));
        return;
      }
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   */
  void postTerminalConnectionTokens(
      PostTerminalConnectionTokensResponseHandler responseHandler = null,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/terminal/connection_tokens");
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

}
// File automatically generated from OpenAPI spec.
module stripe.service.v1_terminal_connection_tokens_service;

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
public import stripe.model.terminal.connection_token : TerminalConnectionToken;

/**
 * Service to make REST API calls to paths beginning with: /v1/terminal/connection_tokens
 */
class V1TerminalConnectionTokensService {
  static class PostTerminalConnectionTokensBody {
    /**
     * The id of the location that this connection token is scoped to. If specified the connection
     * token will only be usable with readers assigned to that location, otherwise the connection
     * token will be usable with all readers. Note that location scoping only applies to
     * internet-connected readers. For more details, see [the docs on scoping connection
     * tokens](https://stripe.com/docs/terminal/fleet/locations#connection-tokens).
     */
    @optional
    string location;

    /**
     * Specifies which fields in the response should be expanded.
     */
    @optional
    string[] expand;

    mixin AddBuilder!(typeof(this));

  }

  static class PostTerminalConnectionTokensResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(TerminalConnectionToken response) handleResponse200;

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
        handleResponse200(deserializeJson!(TerminalConnectionToken)(res.readJson()));
        return;
      }
      if (handleResponseDefault is null) throw new Exception("Unhandled response status code default");
      handleResponseDefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

  }

  /**
   * <p>To connect to a reader the Stripe Terminal SDK needs to retrieve a short-lived connection
   * token from Stripe, proxied through your server. On your backend, add an endpoint that creates
   * and returns a connection token.</p>
   * See_Also: HTTP POST `/v1/terminal/connection_tokens`
   */
  void postTerminalConnectionTokens(
      PostTerminalConnectionTokensBody requestBody,
      PostTerminalConnectionTokensResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/terminal/connection_tokens");
    requestor.setHeaderParam("Content-Type", "application/x-www-form-urlencoded");
    Security.apply(requestor);
    requestor.makeRequest(requestBody, responseHandler);
  }

  mixin AddBuilder!(typeof(this));

}

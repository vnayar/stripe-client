// File automatically generated from OpenAPI spec.
module stripe.service.v1_balance_service;

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

public import stripe.model.balance : Balance;
public import stripe.model.error : Error_;

/**
 * Service to make REST API calls to paths beginning with: /v1/balance
 */
class V1BalanceService {
  static class GetBalanceParams {
    /**
     * Specifies which fields in the response should be expanded.
     */
    Nullable!(Nullable!(string)[]) expand;

  }

  static class GetBalanceResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(Balance response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponsedefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        handleResponse200(deserializeJson!(Balance)(res.readJson()));
        return;
      }
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   * <p>Retrieves the current account balance, based on the authentication that was used to make the
   * request.
   *  For a sample request, see <a
   * href="/docs/connect/account-balances#accounting-for-negative-balances">Accounting for negative
   * balances</a>.</p>
   * See_Also: HTTP GET `/v1/balance`
   */
  void getBalance(
      GetBalanceParams params,
      GetBalanceResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.GET,
        Servers.getServerUrl(),
        "/v1/balance");
    if (!params.expand.isNull)
      requestor.setQueryParam("expand", params.expand.get.to!string);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

}

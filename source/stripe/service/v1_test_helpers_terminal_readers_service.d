// File automatically generated from OpenAPI spec.
module stripe.service.v1_test_helpers_terminal_readers_service;

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
public import stripe.model.terminal.reader : TerminalReader;

/**
 * Service to make REST API calls to paths beginning with: /v1/test_helpers/terminal/readers
 */
class V1TestHelpersTerminalReadersService {
  static class PostTestHelpersTerminalReadersReaderPresentPaymentMethodParams {
    /**
     */
    string reader;

    mixin AddBuilder!(typeof(this));

  }

  static class PostTestHelpersTerminalReadersReaderPresentPaymentMethodResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(TerminalReader response) handleResponse200;

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
        handleResponse200(deserializeJson!(TerminalReader)(res.readJson()));
        return;
      }
      if (handleResponsedefault is null) throw new Exception("Unhandled response status code default");
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

  }

  /**
   * <p>Presents a payment method on a simulated reader. Can be used to simulate accepting a
   * payment, saving a card or refunding a transaction.</p>
   * See_Also: HTTP POST `/v1/test_helpers/terminal/readers/{reader}/present_payment_method`
   */
  void postTestHelpersTerminalReadersReaderPresentPaymentMethod(
      PostTestHelpersTerminalReadersReaderPresentPaymentMethodParams params,
      PostTestHelpersTerminalReadersReaderPresentPaymentMethodResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/test_helpers/terminal/readers/{reader}/present_payment_method");
    if (!params.reader.isNull)
      requestor.setPathParam("reader", params.reader);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  mixin AddBuilder!(typeof(this));

}

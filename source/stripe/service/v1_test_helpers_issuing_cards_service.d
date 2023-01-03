// File automatically generated from OpenAPI spec.
module stripe.service.v1_test_helpers_issuing_cards_service;

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
public import stripe.model.issuing.card : IssuingCard;

/**
 * Service to make REST API calls to paths beginning with: /v1/test_helpers/issuing/cards
 */
class V1TestHelpersIssuingCardsService {
  static class PostTestHelpersIssuingCardsCardShippingDeliverParams {
    /**
     */
    Nullable!(Nullable!(string)) card;

  }

  static class PostTestHelpersIssuingCardsCardShippingDeliverResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(IssuingCard response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponsedefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        handleResponse200(deserializeJson!(IssuingCard)(res.readJson()));
        return;
      }
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   * <p>Updates the shipping status of the specified Issuing <code>Card</code> object to
   * <code>delivered</code>.</p>
   * See_Also: HTTP POST `/v1/test_helpers/issuing/cards/{card}/shipping/deliver`
   */
  void postTestHelpersIssuingCardsCardShippingDeliver(
      PostTestHelpersIssuingCardsCardShippingDeliverParams params,
      PostTestHelpersIssuingCardsCardShippingDeliverResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/test_helpers/issuing/cards/{card}/shipping/deliver");
    if (!params.card.isNull)
      requestor.setPathParam("card", params.card.get.to!string);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class PostTestHelpersIssuingCardsCardShippingReturnParams {
    /**
     */
    Nullable!(Nullable!(string)) card;

  }

  static class PostTestHelpersIssuingCardsCardShippingReturnResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(IssuingCard response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponsedefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        handleResponse200(deserializeJson!(IssuingCard)(res.readJson()));
        return;
      }
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   * <p>Updates the shipping status of the specified Issuing <code>Card</code> object to
   * <code>returned</code>.</p>
   * See_Also: HTTP POST `/v1/test_helpers/issuing/cards/{card}/shipping/return`
   */
  void postTestHelpersIssuingCardsCardShippingReturn(
      PostTestHelpersIssuingCardsCardShippingReturnParams params,
      PostTestHelpersIssuingCardsCardShippingReturnResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/test_helpers/issuing/cards/{card}/shipping/return");
    if (!params.card.isNull)
      requestor.setPathParam("card", params.card.get.to!string);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class PostTestHelpersIssuingCardsCardShippingFailParams {
    /**
     */
    Nullable!(Nullable!(string)) card;

  }

  static class PostTestHelpersIssuingCardsCardShippingFailResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(IssuingCard response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponsedefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        handleResponse200(deserializeJson!(IssuingCard)(res.readJson()));
        return;
      }
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   * <p>Updates the shipping status of the specified Issuing <code>Card</code> object to
   * <code>failure</code>.</p>
   * See_Also: HTTP POST `/v1/test_helpers/issuing/cards/{card}/shipping/fail`
   */
  void postTestHelpersIssuingCardsCardShippingFail(
      PostTestHelpersIssuingCardsCardShippingFailParams params,
      PostTestHelpersIssuingCardsCardShippingFailResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/test_helpers/issuing/cards/{card}/shipping/fail");
    if (!params.card.isNull)
      requestor.setPathParam("card", params.card.get.to!string);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class PostTestHelpersIssuingCardsCardShippingShipParams {
    /**
     */
    Nullable!(Nullable!(string)) card;

  }

  static class PostTestHelpersIssuingCardsCardShippingShipResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(IssuingCard response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponsedefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        handleResponse200(deserializeJson!(IssuingCard)(res.readJson()));
        return;
      }
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   * <p>Updates the shipping status of the specified Issuing <code>Card</code> object to
   * <code>shipped</code>.</p>
   * See_Also: HTTP POST `/v1/test_helpers/issuing/cards/{card}/shipping/ship`
   */
  void postTestHelpersIssuingCardsCardShippingShip(
      PostTestHelpersIssuingCardsCardShippingShipParams params,
      PostTestHelpersIssuingCardsCardShippingShipResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/test_helpers/issuing/cards/{card}/shipping/ship");
    if (!params.card.isNull)
      requestor.setPathParam("card", params.card.get.to!string);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

}

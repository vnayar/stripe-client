// File automatically generated from OpenAPI spec.
module stripe.service.v1_test_helpers_treasury_inbound_transfers_service;

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
public import stripe.model.treasury.inbound_transfer : TreasuryInboundTransfer;
/**
 * Service to make REST API calls to paths beginning with: /v1/test_helpers/treasury/inbound_transfers
 */
class V1TestHelpersTreasuryInboundTransfersService {
  static class PostTestHelpersTreasuryInboundTransfersIdReturnParams {
    /**
     */
    Nullable!(Nullable!(string)) id;

  }

  static class PostTestHelpersTreasuryInboundTransfersIdReturnResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(TreasuryInboundTransfer response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponsedefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        handleResponse200(deserializeJson!(TreasuryInboundTransfer)(res.readJson()));
        return;
      }
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   */
  void postTestHelpersTreasuryInboundTransfersIdReturn(
      PostTestHelpersTreasuryInboundTransfersIdReturnParams params,
      PostTestHelpersTreasuryInboundTransfersIdReturnResponseHandler responseHandler = null,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/test_helpers/treasury/inbound_transfers/{id}/return");
    if (!params.id.isNull)
      requestor.setPathParam("id", params.id.get.to!string);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class PostTestHelpersTreasuryInboundTransfersIdSucceedParams {
    /**
     */
    Nullable!(Nullable!(string)) id;

  }

  static class PostTestHelpersTreasuryInboundTransfersIdSucceedResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(TreasuryInboundTransfer response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponsedefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        handleResponse200(deserializeJson!(TreasuryInboundTransfer)(res.readJson()));
        return;
      }
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   */
  void postTestHelpersTreasuryInboundTransfersIdSucceed(
      PostTestHelpersTreasuryInboundTransfersIdSucceedParams params,
      PostTestHelpersTreasuryInboundTransfersIdSucceedResponseHandler responseHandler = null,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/test_helpers/treasury/inbound_transfers/{id}/succeed");
    if (!params.id.isNull)
      requestor.setPathParam("id", params.id.get.to!string);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class PostTestHelpersTreasuryInboundTransfersIdFailParams {
    /**
     */
    Nullable!(Nullable!(string)) id;

  }

  static class PostTestHelpersTreasuryInboundTransfersIdFailResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(TreasuryInboundTransfer response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponsedefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        handleResponse200(deserializeJson!(TreasuryInboundTransfer)(res.readJson()));
        return;
      }
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   */
  void postTestHelpersTreasuryInboundTransfersIdFail(
      PostTestHelpersTreasuryInboundTransfersIdFailParams params,
      PostTestHelpersTreasuryInboundTransfersIdFailResponseHandler responseHandler = null,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/test_helpers/treasury/inbound_transfers/{id}/fail");
    if (!params.id.isNull)
      requestor.setPathParam("id", params.id.get.to!string);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

}
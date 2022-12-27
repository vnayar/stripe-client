// File automatically generated from OpenAPI spec.
module stripe.service.v1_test_helpers_treasury_outbound_transfers_service;

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
public import stripe.model.treasury.outbound_transfer : TreasuryOutboundTransfer;
/**
 * Service to make REST API calls to paths beginning with: /v1/test_helpers/treasury/outbound_transfers
 */
class V1TestHelpersTreasuryOutboundTransfersService {
  static class PostTestHelpersTreasuryOutboundTransfersOutboundTransferReturnParams {
    /**
     */
    Nullable!(Nullable!(string)) outbound_transfer;

  }

  static class PostTestHelpersTreasuryOutboundTransfersOutboundTransferReturnResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(TreasuryOutboundTransfer response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponsedefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        handleResponse200(deserializeJson!(TreasuryOutboundTransfer)(res.readJson()));
        return;
      }
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   */
  void postTestHelpersTreasuryOutboundTransfersOutboundTransferReturn(
      PostTestHelpersTreasuryOutboundTransfersOutboundTransferReturnParams params,
      PostTestHelpersTreasuryOutboundTransfersOutboundTransferReturnResponseHandler responseHandler = null,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/test_helpers/treasury/outbound_transfers/{outbound_transfer}/return");
    if (!params.outbound_transfer.isNull)
      requestor.setPathParam("outbound_transfer", params.outbound_transfer.get.to!string);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class PostTestHelpersTreasuryOutboundTransfersOutboundTransferFailParams {
    /**
     */
    Nullable!(Nullable!(string)) outbound_transfer;

  }

  static class PostTestHelpersTreasuryOutboundTransfersOutboundTransferFailResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(TreasuryOutboundTransfer response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponsedefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        handleResponse200(deserializeJson!(TreasuryOutboundTransfer)(res.readJson()));
        return;
      }
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   */
  void postTestHelpersTreasuryOutboundTransfersOutboundTransferFail(
      PostTestHelpersTreasuryOutboundTransfersOutboundTransferFailParams params,
      PostTestHelpersTreasuryOutboundTransfersOutboundTransferFailResponseHandler responseHandler = null,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/test_helpers/treasury/outbound_transfers/{outbound_transfer}/fail");
    if (!params.outbound_transfer.isNull)
      requestor.setPathParam("outbound_transfer", params.outbound_transfer.get.to!string);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class PostTestHelpersTreasuryOutboundTransfersOutboundTransferPostParams {
    /**
     */
    Nullable!(Nullable!(string)) outbound_transfer;

  }

  static class PostTestHelpersTreasuryOutboundTransfersOutboundTransferPostResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(TreasuryOutboundTransfer response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponsedefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        handleResponse200(deserializeJson!(TreasuryOutboundTransfer)(res.readJson()));
        return;
      }
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   */
  void postTestHelpersTreasuryOutboundTransfersOutboundTransferPost(
      PostTestHelpersTreasuryOutboundTransfersOutboundTransferPostParams params,
      PostTestHelpersTreasuryOutboundTransfersOutboundTransferPostResponseHandler responseHandler = null,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/test_helpers/treasury/outbound_transfers/{outbound_transfer}/post");
    if (!params.outbound_transfer.isNull)
      requestor.setPathParam("outbound_transfer", params.outbound_transfer.get.to!string);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

}

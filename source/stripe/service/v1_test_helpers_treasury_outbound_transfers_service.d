// File automatically generated from OpenAPI spec.
module stripe.service.v1_test_helpers_treasury_outbound_transfers_service;

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
public import stripe.model.treasury.outbound_transfer : TreasuryOutboundTransfer;

/**
 * Service to make REST API calls to paths beginning with: /v1/test_helpers/treasury/outbound_transfers
 */
class V1TestHelpersTreasuryOutboundTransfersService {
  static class PostTestHelpersTreasuryOutboundTransfersOutboundTransferReturnParams {
    /**
     */
    string outbound_transfer;

    mixin AddBuilder!(typeof(this));

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
        if (handleResponse200 is null) throw new Exception("Unhandled response status code 200");
        handleResponse200(deserializeJson!(TreasuryOutboundTransfer)(res.readJson()));
        return;
      }
      if (handleResponsedefault is null) throw new Exception("Unhandled response status code default");
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

  }

  /**
   * <p>Transitions a test mode created OutboundTransfer to the <code>returned</code> status. The
   * OutboundTransfer must already be in the <code>processing</code> state.</p>
   * See_Also: HTTP POST `/v1/test_helpers/treasury/outbound_transfers/{outbound_transfer}/return`
   */
  void postTestHelpersTreasuryOutboundTransfersOutboundTransferReturn(
      PostTestHelpersTreasuryOutboundTransfersOutboundTransferReturnParams params,
      PostTestHelpersTreasuryOutboundTransfersOutboundTransferReturnResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/test_helpers/treasury/outbound_transfers/{outbound_transfer}/return");
    if (!params.outbound_transfer.isNull)
      requestor.setPathParam("outbound_transfer", params.outbound_transfer);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class PostTestHelpersTreasuryOutboundTransfersOutboundTransferFailParams {
    /**
     */
    string outbound_transfer;

    mixin AddBuilder!(typeof(this));

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
        if (handleResponse200 is null) throw new Exception("Unhandled response status code 200");
        handleResponse200(deserializeJson!(TreasuryOutboundTransfer)(res.readJson()));
        return;
      }
      if (handleResponsedefault is null) throw new Exception("Unhandled response status code default");
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

  }

  /**
   * <p>Transitions a test mode created OutboundTransfer to the <code>failed</code> status. The
   * OutboundTransfer must already be in the <code>processing</code> state.</p>
   * See_Also: HTTP POST `/v1/test_helpers/treasury/outbound_transfers/{outbound_transfer}/fail`
   */
  void postTestHelpersTreasuryOutboundTransfersOutboundTransferFail(
      PostTestHelpersTreasuryOutboundTransfersOutboundTransferFailParams params,
      PostTestHelpersTreasuryOutboundTransfersOutboundTransferFailResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/test_helpers/treasury/outbound_transfers/{outbound_transfer}/fail");
    if (!params.outbound_transfer.isNull)
      requestor.setPathParam("outbound_transfer", params.outbound_transfer);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class PostTestHelpersTreasuryOutboundTransfersOutboundTransferPostParams {
    /**
     */
    string outbound_transfer;

    mixin AddBuilder!(typeof(this));

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
        if (handleResponse200 is null) throw new Exception("Unhandled response status code 200");
        handleResponse200(deserializeJson!(TreasuryOutboundTransfer)(res.readJson()));
        return;
      }
      if (handleResponsedefault is null) throw new Exception("Unhandled response status code default");
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

  }

  /**
   * <p>Transitions a test mode created OutboundTransfer to the <code>posted</code> status. The
   * OutboundTransfer must already be in the <code>processing</code> state.</p>
   * See_Also: HTTP POST `/v1/test_helpers/treasury/outbound_transfers/{outbound_transfer}/post`
   */
  void postTestHelpersTreasuryOutboundTransfersOutboundTransferPost(
      PostTestHelpersTreasuryOutboundTransfersOutboundTransferPostParams params,
      PostTestHelpersTreasuryOutboundTransfersOutboundTransferPostResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/test_helpers/treasury/outbound_transfers/{outbound_transfer}/post");
    if (!params.outbound_transfer.isNull)
      requestor.setPathParam("outbound_transfer", params.outbound_transfer);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  mixin AddBuilder!(typeof(this));

}

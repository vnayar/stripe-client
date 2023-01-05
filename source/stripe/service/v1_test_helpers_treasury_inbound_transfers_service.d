// File automatically generated from OpenAPI spec.
module stripe.service.v1_test_helpers_treasury_inbound_transfers_service;

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
public import stripe.model.treasury.inbound_transfer : TreasuryInboundTransfer;

/**
 * Service to make REST API calls to paths beginning with: /v1/test_helpers/treasury/inbound_transfers
 */
class V1TestHelpersTreasuryInboundTransfersService {
  static class PostTestHelpersTreasuryInboundTransfersIdReturnParams {
    /**
     */
    string id;

    mixin AddBuilder!(typeof(this));

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
        if (handleResponse200 is null) throw new Exception("Unhandled response status code 200");
        handleResponse200(deserializeJson!(TreasuryInboundTransfer)(res.readJson()));
        return;
      }
      if (handleResponsedefault is null) throw new Exception("Unhandled response status code default");
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

  }

  /**
   * <p>Marks the test mode InboundTransfer object as returned and links the InboundTransfer to a
   * ReceivedDebit. The InboundTransfer must already be in the <code>succeeded</code> state.</p>
   * See_Also: HTTP POST `/v1/test_helpers/treasury/inbound_transfers/{id}/return`
   */
  void postTestHelpersTreasuryInboundTransfersIdReturn(
      PostTestHelpersTreasuryInboundTransfersIdReturnParams params,
      PostTestHelpersTreasuryInboundTransfersIdReturnResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/test_helpers/treasury/inbound_transfers/{id}/return");
    if (!params.id.isNull)
      requestor.setPathParam("id", params.id);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class PostTestHelpersTreasuryInboundTransfersIdSucceedParams {
    /**
     */
    string id;

    mixin AddBuilder!(typeof(this));

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
        if (handleResponse200 is null) throw new Exception("Unhandled response status code 200");
        handleResponse200(deserializeJson!(TreasuryInboundTransfer)(res.readJson()));
        return;
      }
      if (handleResponsedefault is null) throw new Exception("Unhandled response status code default");
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

  }

  /**
   * <p>Transitions a test mode created InboundTransfer to the <code>succeeded</code> status. The
   * InboundTransfer must already be in the <code>processing</code> state.</p>
   * See_Also: HTTP POST `/v1/test_helpers/treasury/inbound_transfers/{id}/succeed`
   */
  void postTestHelpersTreasuryInboundTransfersIdSucceed(
      PostTestHelpersTreasuryInboundTransfersIdSucceedParams params,
      PostTestHelpersTreasuryInboundTransfersIdSucceedResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/test_helpers/treasury/inbound_transfers/{id}/succeed");
    if (!params.id.isNull)
      requestor.setPathParam("id", params.id);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class PostTestHelpersTreasuryInboundTransfersIdFailParams {
    /**
     */
    string id;

    mixin AddBuilder!(typeof(this));

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
        if (handleResponse200 is null) throw new Exception("Unhandled response status code 200");
        handleResponse200(deserializeJson!(TreasuryInboundTransfer)(res.readJson()));
        return;
      }
      if (handleResponsedefault is null) throw new Exception("Unhandled response status code default");
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

  }

  /**
   * <p>Transitions a test mode created InboundTransfer to the <code>failed</code> status. The
   * InboundTransfer must already be in the <code>processing</code> state.</p>
   * See_Also: HTTP POST `/v1/test_helpers/treasury/inbound_transfers/{id}/fail`
   */
  void postTestHelpersTreasuryInboundTransfersIdFail(
      PostTestHelpersTreasuryInboundTransfersIdFailParams params,
      PostTestHelpersTreasuryInboundTransfersIdFailResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/test_helpers/treasury/inbound_transfers/{id}/fail");
    if (!params.id.isNull)
      requestor.setPathParam("id", params.id);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  mixin AddBuilder!(typeof(this));

}

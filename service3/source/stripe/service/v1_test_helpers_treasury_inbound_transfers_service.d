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

  static class PostTestHelpersTreasuryInboundTransfersIdReturnBody {
    /**
     * Specifies which fields in the response should be expanded.
     */
    @optional
    string[] expand;

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
    void delegate(Error_ response) handleResponseDefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        if (handleResponse200 is null) throw new Exception("Unhandled response status code 200");
        handleResponse200(deserializeJson!(TreasuryInboundTransfer)(res.readJson()));
        return;
      }
      if (handleResponseDefault is null) throw new Exception("Unhandled response status code default");
      handleResponseDefault(deserializeJson!(Error_)(res.readJson()));
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
      PostTestHelpersTreasuryInboundTransfersIdReturnBody requestBody,
      PostTestHelpersTreasuryInboundTransfersIdReturnResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/test_helpers/treasury/inbound_transfers/{id}/return");
    if (!params.id.isNull)
      requestor.setPathParam("id", params.id);
    requestor.setHeaderParam("Content-Type", "application/x-www-form-urlencoded");
    Security.apply(requestor);
    requestor.makeRequest(requestBody, responseHandler);
  }

  static class PostTestHelpersTreasuryInboundTransfersIdSucceedParams {
    /**
     */
    string id;

    mixin AddBuilder!(typeof(this));

  }

  static class PostTestHelpersTreasuryInboundTransfersIdSucceedBody {
    /**
     * Specifies which fields in the response should be expanded.
     */
    @optional
    string[] expand;

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
    void delegate(Error_ response) handleResponseDefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        if (handleResponse200 is null) throw new Exception("Unhandled response status code 200");
        handleResponse200(deserializeJson!(TreasuryInboundTransfer)(res.readJson()));
        return;
      }
      if (handleResponseDefault is null) throw new Exception("Unhandled response status code default");
      handleResponseDefault(deserializeJson!(Error_)(res.readJson()));
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
      PostTestHelpersTreasuryInboundTransfersIdSucceedBody requestBody,
      PostTestHelpersTreasuryInboundTransfersIdSucceedResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/test_helpers/treasury/inbound_transfers/{id}/succeed");
    if (!params.id.isNull)
      requestor.setPathParam("id", params.id);
    requestor.setHeaderParam("Content-Type", "application/x-www-form-urlencoded");
    Security.apply(requestor);
    requestor.makeRequest(requestBody, responseHandler);
  }

  static class PostTestHelpersTreasuryInboundTransfersIdFailParams {
    /**
     */
    string id;

    mixin AddBuilder!(typeof(this));

  }

  static class PostTestHelpersTreasuryInboundTransfersIdFailBody {
    /**
     * Specifies which fields in the response should be expanded.
     */
    @optional
    string[] expand;

    static class FailureDetailsParams {
      @optional
      string code;

      mixin AddBuilder!(typeof(this));

    }

    /**
     * Details about a failed InboundTransfer.
     */
    @optional
    FailureDetailsParams failure_details;

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
    void delegate(Error_ response) handleResponseDefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        if (handleResponse200 is null) throw new Exception("Unhandled response status code 200");
        handleResponse200(deserializeJson!(TreasuryInboundTransfer)(res.readJson()));
        return;
      }
      if (handleResponseDefault is null) throw new Exception("Unhandled response status code default");
      handleResponseDefault(deserializeJson!(Error_)(res.readJson()));
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
      PostTestHelpersTreasuryInboundTransfersIdFailBody requestBody,
      PostTestHelpersTreasuryInboundTransfersIdFailResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/test_helpers/treasury/inbound_transfers/{id}/fail");
    if (!params.id.isNull)
      requestor.setPathParam("id", params.id);
    requestor.setHeaderParam("Content-Type", "application/x-www-form-urlencoded");
    Security.apply(requestor);
    requestor.makeRequest(requestBody, responseHandler);
  }

  mixin AddBuilder!(typeof(this));

}

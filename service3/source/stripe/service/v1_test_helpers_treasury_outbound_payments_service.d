// File automatically generated from OpenAPI spec.
module stripe.service.v1_test_helpers_treasury_outbound_payments_service;

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
public import stripe.model.treasury.outbound_payment : TreasuryOutboundPayment;

/**
 * Service to make REST API calls to paths beginning with: /v1/test_helpers/treasury/outbound_payments
 */
class V1TestHelpersTreasuryOutboundPaymentsService {
  static class PostTestHelpersTreasuryOutboundPaymentsIdReturnParams {
    /**
     */
    string id;

    mixin AddBuilder!(typeof(this));

  }

  static class PostTestHelpersTreasuryOutboundPaymentsIdReturnBody {
    static class ReturnedDetailsParams {
      @optional
      string code;

      mixin AddBuilder!(typeof(this));

    }

    /**
     * Optional hash to set the the return code.
     */
    @optional
    ReturnedDetailsParams returned_details;

    /**
     * Specifies which fields in the response should be expanded.
     */
    @optional
    string[] expand;

    mixin AddBuilder!(typeof(this));

  }

  static class PostTestHelpersTreasuryOutboundPaymentsIdReturnResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(TreasuryOutboundPayment response) handleResponse200;

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
        handleResponse200(deserializeJson!(TreasuryOutboundPayment)(res.readJson()));
        return;
      }
      if (handleResponseDefault is null) throw new Exception("Unhandled response status code default");
      handleResponseDefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

  }

  /**
   * <p>Transitions a test mode created OutboundPayment to the <code>returned</code> status. The
   * OutboundPayment must already be in the <code>processing</code> state.</p>
   * See_Also: HTTP POST `/v1/test_helpers/treasury/outbound_payments/{id}/return`
   */
  void postTestHelpersTreasuryOutboundPaymentsIdReturn(
      PostTestHelpersTreasuryOutboundPaymentsIdReturnParams params,
      PostTestHelpersTreasuryOutboundPaymentsIdReturnBody requestBody,
      PostTestHelpersTreasuryOutboundPaymentsIdReturnResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/test_helpers/treasury/outbound_payments/{id}/return");
    if (!params.id.isNull)
      requestor.setPathParam("id", params.id);
    requestor.setHeaderParam("Content-Type", "application/x-www-form-urlencoded");
    Security.apply(requestor);
    requestor.makeRequest(requestBody, responseHandler);
  }

  static class PostTestHelpersTreasuryOutboundPaymentsIdPostParams {
    /**
     */
    string id;

    mixin AddBuilder!(typeof(this));

  }

  static class PostTestHelpersTreasuryOutboundPaymentsIdPostBody {
    /**
     * Specifies which fields in the response should be expanded.
     */
    @optional
    string[] expand;

    mixin AddBuilder!(typeof(this));

  }

  static class PostTestHelpersTreasuryOutboundPaymentsIdPostResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(TreasuryOutboundPayment response) handleResponse200;

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
        handleResponse200(deserializeJson!(TreasuryOutboundPayment)(res.readJson()));
        return;
      }
      if (handleResponseDefault is null) throw new Exception("Unhandled response status code default");
      handleResponseDefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

  }

  /**
   * <p>Transitions a test mode created OutboundPayment to the <code>posted</code> status. The
   * OutboundPayment must already be in the <code>processing</code> state.</p>
   * See_Also: HTTP POST `/v1/test_helpers/treasury/outbound_payments/{id}/post`
   */
  void postTestHelpersTreasuryOutboundPaymentsIdPost(
      PostTestHelpersTreasuryOutboundPaymentsIdPostParams params,
      PostTestHelpersTreasuryOutboundPaymentsIdPostBody requestBody,
      PostTestHelpersTreasuryOutboundPaymentsIdPostResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/test_helpers/treasury/outbound_payments/{id}/post");
    if (!params.id.isNull)
      requestor.setPathParam("id", params.id);
    requestor.setHeaderParam("Content-Type", "application/x-www-form-urlencoded");
    Security.apply(requestor);
    requestor.makeRequest(requestBody, responseHandler);
  }

  static class PostTestHelpersTreasuryOutboundPaymentsIdFailParams {
    /**
     */
    string id;

    mixin AddBuilder!(typeof(this));

  }

  static class PostTestHelpersTreasuryOutboundPaymentsIdFailBody {
    /**
     * Specifies which fields in the response should be expanded.
     */
    @optional
    string[] expand;

    mixin AddBuilder!(typeof(this));

  }

  static class PostTestHelpersTreasuryOutboundPaymentsIdFailResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(TreasuryOutboundPayment response) handleResponse200;

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
        handleResponse200(deserializeJson!(TreasuryOutboundPayment)(res.readJson()));
        return;
      }
      if (handleResponseDefault is null) throw new Exception("Unhandled response status code default");
      handleResponseDefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

  }

  /**
   * <p>Transitions a test mode created OutboundPayment to the <code>failed</code> status. The
   * OutboundPayment must already be in the <code>processing</code> state.</p>
   * See_Also: HTTP POST `/v1/test_helpers/treasury/outbound_payments/{id}/fail`
   */
  void postTestHelpersTreasuryOutboundPaymentsIdFail(
      PostTestHelpersTreasuryOutboundPaymentsIdFailParams params,
      PostTestHelpersTreasuryOutboundPaymentsIdFailBody requestBody,
      PostTestHelpersTreasuryOutboundPaymentsIdFailResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/test_helpers/treasury/outbound_payments/{id}/fail");
    if (!params.id.isNull)
      requestor.setPathParam("id", params.id);
    requestor.setHeaderParam("Content-Type", "application/x-www-form-urlencoded");
    Security.apply(requestor);
    requestor.makeRequest(requestBody, responseHandler);
  }

  mixin AddBuilder!(typeof(this));

}

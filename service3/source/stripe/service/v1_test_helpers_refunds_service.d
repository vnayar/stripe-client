// File automatically generated from OpenAPI spec.
module stripe.service.v1_test_helpers_refunds_service;

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
public import stripe.model.refund : Refund;

/**
 * Service to make REST API calls to paths beginning with: /v1/test_helpers/refunds
 */
class V1TestHelpersRefundsService {
  static class PostTestHelpersRefundsRefundExpireParams {
    /**
     */
    string refund;

    mixin AddBuilder!(typeof(this));

  }

  static class PostTestHelpersRefundsRefundExpireBody {
    /**
     * Specifies which fields in the response should be expanded.
     */
    @optional
    string[] expand;

    mixin AddBuilder!(typeof(this));

  }

  static class PostTestHelpersRefundsRefundExpireResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(Refund response) handleResponse200;

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
        handleResponse200(deserializeJson!(Refund)(res.readJson()));
        return;
      }
      if (handleResponseDefault is null) throw new Exception("Unhandled response status code default");
      handleResponseDefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

  }

  /**
   * <p>Expire a refund with a status of <code>requires_action</code>.</p>
   * See_Also: HTTP POST `/v1/test_helpers/refunds/{refund}/expire`
   */
  void postTestHelpersRefundsRefundExpire(
      PostTestHelpersRefundsRefundExpireParams params,
      PostTestHelpersRefundsRefundExpireBody requestBody,
      PostTestHelpersRefundsRefundExpireResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/test_helpers/refunds/{refund}/expire");
    if (!params.refund.isNull)
      requestor.setPathParam("refund", params.refund);
    requestor.setHeaderParam("Content-Type", "application/x-www-form-urlencoded");
    Security.apply(requestor);
    requestor.makeRequest(requestBody, responseHandler);
  }

  mixin AddBuilder!(typeof(this));

}

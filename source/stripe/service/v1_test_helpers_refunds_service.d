// File automatically generated from OpenAPI spec.
module stripe.service.v1_test_helpers_refunds_service;

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
public import stripe.model.refund : Refund;
/**
 * Service to make REST API calls to paths beginning with: /v1/test_helpers/refunds
 */
class V1TestHelpersRefundsService {
  static class PostTestHelpersRefundsRefundExpireParams {
    /**
     */
    Nullable!(Nullable!(string)) refund;

  }

  static class PostTestHelpersRefundsRefundExpireResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(Refund response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponsedefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        handleResponse200(deserializeJson!(Refund)(res.readJson()));
        return;
      }
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   */
  void postTestHelpersRefundsRefundExpire(
      PostTestHelpersRefundsRefundExpireParams params,
      PostTestHelpersRefundsRefundExpireResponseHandler responseHandler = null,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/test_helpers/refunds/{refund}/expire");
    if (!params.refund.isNull)
      requestor.setPathParam("refund", params.refund.get.to!string);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

}

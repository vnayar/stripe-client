// File automatically generated from OpenAPI spec.
module stripe.service.v1_refunds_service;

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
 * Service to make REST API calls to paths beginning with: /v1/refunds
 */
class V1RefundsService {
  static class GetRefundsRefundParams {
    /**
     * Specifies which fields in the response should be expanded.
     */
    string[] expand;

    /**
     */
    string refund;

    mixin AddBuilder!(typeof(this));

  }

  static class GetRefundsRefundResponseHandler : ResponseHandler {

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
   * <p>Retrieves the details of an existing refund.</p>
   * See_Also: HTTP GET `/v1/refunds/{refund}`
   */
  void getRefundsRefund(
      GetRefundsRefundParams params,
      GetRefundsRefundResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.GET,
        Servers.getServerUrl(),
        "/v1/refunds/{refund}");
    if (!params.expand.isNull)
      requestor.setQueryParam!("deepObject")("expand", params.expand);
    if (!params.refund.isNull)
      requestor.setPathParam("refund", params.refund);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class PostRefundsRefundParams {
    /**
     */
    string refund;

    mixin AddBuilder!(typeof(this));

  }

  static class PostRefundsRefundBody {
    /**
     * Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an
     * object. This can be useful for storing additional information about the object in a
     * structured format. Individual keys can be unset by posting an empty value to them. All keys
     * can be unset by posting an empty value to `metadata`.
     */
    @optional
    Json metadata;

    /**
     * Specifies which fields in the response should be expanded.
     */
    @optional
    string[] expand;

    mixin AddBuilder!(typeof(this));

  }

  static class PostRefundsRefundResponseHandler : ResponseHandler {

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
   * <p>Updates the specified refund by setting the values of the parameters passed. Any parameters
   * not provided will be left unchanged.</p>
   * <p>This request only accepts <code>metadata</code> as an argument.</p>
   * See_Also: HTTP POST `/v1/refunds/{refund}`
   */
  void postRefundsRefund(
      PostRefundsRefundParams params,
      PostRefundsRefundBody requestBody,
      PostRefundsRefundResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/refunds/{refund}");
    if (!params.refund.isNull)
      requestor.setPathParam("refund", params.refund);
    requestor.setHeaderParam("Content-Type", "application/x-www-form-urlencoded");
    Security.apply(requestor);
    requestor.makeRequest(requestBody, responseHandler);
  }

  static class PostRefundsRefundCancelParams {
    /**
     */
    string refund;

    mixin AddBuilder!(typeof(this));

  }

  static class PostRefundsRefundCancelBody {
    /**
     * Specifies which fields in the response should be expanded.
     */
    @optional
    string[] expand;

    mixin AddBuilder!(typeof(this));

  }

  static class PostRefundsRefundCancelResponseHandler : ResponseHandler {

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
   * <p>Cancels a refund with a status of <code>requires_action</code>.</p>
   * <p>Refunds in other states cannot be canceled, and only refunds for payment methods that
   * require customer action will enter the <code>requires_action</code> state.</p>
   * See_Also: HTTP POST `/v1/refunds/{refund}/cancel`
   */
  void postRefundsRefundCancel(
      PostRefundsRefundCancelParams params,
      PostRefundsRefundCancelBody requestBody,
      PostRefundsRefundCancelResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/refunds/{refund}/cancel");
    if (!params.refund.isNull)
      requestor.setPathParam("refund", params.refund);
    requestor.setHeaderParam("Content-Type", "application/x-www-form-urlencoded");
    Security.apply(requestor);
    requestor.makeRequest(requestBody, responseHandler);
  }

  static class GetRefundsParams {
    /**
     * Only return refunds for the charge specified by this charge ID.
     */
    string charge;

    /**
     */
    Json created;

    /**
     * A cursor for use in pagination. `ending_before` is an object ID that defines your place in
     * the list. For instance, if you make a list request and receive 100 objects, starting with
     * `obj_bar`, your subsequent call can include `ending_before=obj_bar` in order to fetch the
     * previous page of the list.
     */
    string ending_before;

    /**
     * Specifies which fields in the response should be expanded.
     */
    string[] expand;

    /**
     * A limit on the number of objects to be returned. Limit can range between 1 and 100, and the
     * default is 10.
     */
    Nullable!(int) limit;

    /**
     * Only return refunds for the PaymentIntent specified by this ID.
     */
    string payment_intent;

    /**
     * A cursor for use in pagination. `starting_after` is an object ID that defines your place in
     * the list. For instance, if you make a list request and receive 100 objects, ending with
     * `obj_foo`, your subsequent call can include `starting_after=obj_foo` in order to fetch the
     * next page of the list.
     */
    string starting_after;

    mixin AddBuilder!(typeof(this));

  }

  static class GetRefundsResponseHandler : ResponseHandler {

    static class APIMethodRefundList {
      /**
       * True if this list has another page of items after this one that can be fetched.
       */
      @optional
      Nullable!(bool) has_more;

      /**
       * String representing the object's type. Objects of the same type share the same value. Always
       * has the value `list`.
       */
      @optional
      string object;

      @optional
      Refund[] data;

      /**
       * The URL where this list can be accessed.
       */
      @optional
      string url;

      mixin AddBuilder!(typeof(this));

    }

    /**
     * Successful response.
     */
    void delegate(APIMethodRefundList response) handleResponse200;

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
        handleResponse200(deserializeJson!(APIMethodRefundList)(res.readJson()));
        return;
      }
      if (handleResponseDefault is null) throw new Exception("Unhandled response status code default");
      handleResponseDefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

  }

  /**
   * <p>Returns a list of all refunds you’ve previously created. The refunds are returned in
   * sorted order, with the most recent refunds appearing first. For convenience, the 10 most recent
   * refunds are always available by default on the charge object.</p>
   * See_Also: HTTP GET `/v1/refunds`
   */
  void getRefunds(
      GetRefundsParams params,
      GetRefundsResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.GET,
        Servers.getServerUrl(),
        "/v1/refunds");
    if (!params.charge.isNull)
      requestor.setQueryParam!("deepObject")("charge", params.charge);
    if (!params.created.isNull)
      requestor.setQueryParam!("deepObject")("created", params.created);
    if (!params.ending_before.isNull)
      requestor.setQueryParam!("deepObject")("ending_before", params.ending_before);
    if (!params.expand.isNull)
      requestor.setQueryParam!("deepObject")("expand", params.expand);
    if (!params.limit.isNull)
      requestor.setQueryParam!("deepObject")("limit", params.limit);
    if (!params.payment_intent.isNull)
      requestor.setQueryParam!("deepObject")("payment_intent", params.payment_intent);
    if (!params.starting_after.isNull)
      requestor.setQueryParam!("deepObject")("starting_after", params.starting_after);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class PostRefundsBody {
    /**
     * Origin of the refund
     */
    @optional
    string origin;

    /**
     * A positive integer representing how much to refund.
     */
    @optional
    Nullable!(int) amount;

    @optional
    string payment_intent;

    /**
     * Address to send refund email, use customer email if not specified
     */
    @optional
    string instructions_email;

    /**
     * Customer whose customer balance to refund from.
     */
    @optional
    string customer;

    /**
     * Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an
     * object. This can be useful for storing additional information about the object in a
     * structured format. Individual keys can be unset by posting an empty value to them. All keys
     * can be unset by posting an empty value to `metadata`.
     */
    @optional
    Json metadata;

    /**
     * Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in
     * lowercase. Must be a [supported currency](https://stripe.com/docs/currencies).
     */
    @optional
    string currency;

    @optional
    string reason;

    @optional
    string charge;

    /**
     * Specifies which fields in the response should be expanded.
     */
    @optional
    string[] expand;

    @optional
    Nullable!(bool) refund_application_fee;

    @optional
    Nullable!(bool) reverse_transfer;

    mixin AddBuilder!(typeof(this));

  }

  static class PostRefundsResponseHandler : ResponseHandler {

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
   * <p>Create a refund.</p>
   * See_Also: HTTP POST `/v1/refunds`
   */
  void postRefunds(
      PostRefundsBody requestBody,
      PostRefundsResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/refunds");
    requestor.setHeaderParam("Content-Type", "application/x-www-form-urlencoded");
    Security.apply(requestor);
    requestor.makeRequest(requestBody, responseHandler);
  }

  mixin AddBuilder!(typeof(this));

}

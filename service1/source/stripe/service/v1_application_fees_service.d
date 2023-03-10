// File automatically generated from OpenAPI spec.
module stripe.service.v1_application_fees_service;

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

public import stripe.model.application_fee : ApplicationFee;
public import stripe.model.error : Error_;
public import stripe.model.fee_refund : FeeRefund;

/**
 * Service to make REST API calls to paths beginning with: /v1/application_fees
 */
class V1ApplicationFeesService {
  static class GetApplicationFeesIdRefundsParams {
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
     */
    string id;

    /**
     * A limit on the number of objects to be returned. Limit can range between 1 and 100, and the
     * default is 10.
     */
    Nullable!(int) limit;

    /**
     * A cursor for use in pagination. `starting_after` is an object ID that defines your place in
     * the list. For instance, if you make a list request and receive 100 objects, ending with
     * `obj_foo`, your subsequent call can include `starting_after=obj_foo` in order to fetch the
     * next page of the list.
     */
    string starting_after;

    mixin AddBuilder!(typeof(this));

  }

  static class GetApplicationFeesIdRefundsResponseHandler : ResponseHandler {

    static class FeeRefundList {
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

      /**
       * Details about each object.
       */
      @optional
      FeeRefund[] data;

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
    void delegate(FeeRefundList response) handleResponse200;

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
        handleResponse200(deserializeJson!(FeeRefundList)(res.readJson()));
        return;
      }
      if (handleResponseDefault is null) throw new Exception("Unhandled response status code default");
      handleResponseDefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

  }

  /**
   * <p>You can see a list of the refunds belonging to a specific application fee. Note that the 10
   * most recent refunds are always available by default on the application fee object. If you need
   * more than those 10, you can use this API method and the <code>limit</code> and
   * <code>starting_after</code> parameters to page through additional refunds.</p>
   * See_Also: HTTP GET `/v1/application_fees/{id}/refunds`
   */
  void getApplicationFeesIdRefunds(
      GetApplicationFeesIdRefundsParams params,
      GetApplicationFeesIdRefundsResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.GET,
        Servers.getServerUrl(),
        "/v1/application_fees/{id}/refunds");
    if (!params.ending_before.isNull)
      requestor.setQueryParam!("deepObject")("ending_before", params.ending_before);
    if (!params.expand.isNull)
      requestor.setQueryParam!("deepObject")("expand", params.expand);
    if (!params.id.isNull)
      requestor.setPathParam("id", params.id);
    if (!params.limit.isNull)
      requestor.setQueryParam!("deepObject")("limit", params.limit);
    if (!params.starting_after.isNull)
      requestor.setQueryParam!("deepObject")("starting_after", params.starting_after);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class PostApplicationFeesIdRefundsParams {
    /**
     */
    string id;

    mixin AddBuilder!(typeof(this));

  }

  static class PostApplicationFeesIdRefundsBody {
    /**
     * Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an
     * object. This can be useful for storing additional information about the object in a
     * structured format. Individual keys can be unset by posting an empty value to them. All keys
     * can be unset by posting an empty value to `metadata`.
     */
    @optional
    string[string] metadata;

    /**
     * A positive integer, in _cents (or local equivalent)_, representing how much of this fee to
     * refund. Can refund only up to the remaining unrefunded amount of the fee.
     */
    @optional
    Nullable!(int) amount;

    /**
     * Specifies which fields in the response should be expanded.
     */
    @optional
    string[] expand;

    mixin AddBuilder!(typeof(this));

  }

  static class PostApplicationFeesIdRefundsResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(FeeRefund response) handleResponse200;

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
        handleResponse200(deserializeJson!(FeeRefund)(res.readJson()));
        return;
      }
      if (handleResponseDefault is null) throw new Exception("Unhandled response status code default");
      handleResponseDefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

  }

  /**
   * <p>Refunds an application fee that has previously been collected but not yet refunded.
   * Funds will be refunded to the Stripe account from which the fee was originally collected.</p>
   * <p>You can optionally refund only part of an application fee.
   * You can do so multiple times, until the entire fee has been refunded.</p>
   * <p>Once entirely refunded, an application fee can???t be refunded again.
   * This method will raise an error when called on an already-refunded application fee,
   * or when trying to refund more money than is left on an application fee.</p>
   * See_Also: HTTP POST `/v1/application_fees/{id}/refunds`
   */
  void postApplicationFeesIdRefunds(
      PostApplicationFeesIdRefundsParams params,
      PostApplicationFeesIdRefundsBody requestBody,
      PostApplicationFeesIdRefundsResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/application_fees/{id}/refunds");
    if (!params.id.isNull)
      requestor.setPathParam("id", params.id);
    requestor.setHeaderParam("Content-Type", "application/x-www-form-urlencoded");
    Security.apply(requestor);
    requestor.makeRequest(requestBody, responseHandler);
  }

  static class GetApplicationFeesParams {
    /**
     * Only return application fees for the charge specified by this charge ID.
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
     * A cursor for use in pagination. `starting_after` is an object ID that defines your place in
     * the list. For instance, if you make a list request and receive 100 objects, ending with
     * `obj_foo`, your subsequent call can include `starting_after=obj_foo` in order to fetch the
     * next page of the list.
     */
    string starting_after;

    mixin AddBuilder!(typeof(this));

  }

  static class GetApplicationFeesResponseHandler : ResponseHandler {

    static class PlatformEarningList {
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
      ApplicationFee[] data;

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
    void delegate(PlatformEarningList response) handleResponse200;

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
        handleResponse200(deserializeJson!(PlatformEarningList)(res.readJson()));
        return;
      }
      if (handleResponseDefault is null) throw new Exception("Unhandled response status code default");
      handleResponseDefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

  }

  /**
   * <p>Returns a list of application fees you???ve previously collected. The application fees are
   * returned in sorted order, with the most recent fees appearing first.</p>
   * See_Also: HTTP GET `/v1/application_fees`
   */
  void getApplicationFees(
      GetApplicationFeesParams params,
      GetApplicationFeesResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.GET,
        Servers.getServerUrl(),
        "/v1/application_fees");
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
    if (!params.starting_after.isNull)
      requestor.setQueryParam!("deepObject")("starting_after", params.starting_after);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class PostApplicationFeesIdRefundParams {
    /**
     */
    string id;

    mixin AddBuilder!(typeof(this));

  }

  static class PostApplicationFeesIdRefundBody {
    @optional
    Nullable!(int) amount;

    /**
     * Specifies which fields in the response should be expanded.
     */
    @optional
    string[] expand;

    @optional
    string directive;

    mixin AddBuilder!(typeof(this));

  }

  static class PostApplicationFeesIdRefundResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(ApplicationFee response) handleResponse200;

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
        handleResponse200(deserializeJson!(ApplicationFee)(res.readJson()));
        return;
      }
      if (handleResponseDefault is null) throw new Exception("Unhandled response status code default");
      handleResponseDefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

  }

  /**
   * See_Also: HTTP POST `/v1/application_fees/{id}/refund`
   */
  void postApplicationFeesIdRefund(
      PostApplicationFeesIdRefundParams params,
      PostApplicationFeesIdRefundBody requestBody,
      PostApplicationFeesIdRefundResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/application_fees/{id}/refund");
    if (!params.id.isNull)
      requestor.setPathParam("id", params.id);
    requestor.setHeaderParam("Content-Type", "application/x-www-form-urlencoded");
    Security.apply(requestor);
    requestor.makeRequest(requestBody, responseHandler);
  }

  static class GetApplicationFeesFeeRefundsIdParams {
    /**
     * Specifies which fields in the response should be expanded.
     */
    string[] expand;

    /**
     */
    string fee;

    /**
     */
    string id;

    mixin AddBuilder!(typeof(this));

  }

  static class GetApplicationFeesFeeRefundsIdResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(FeeRefund response) handleResponse200;

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
        handleResponse200(deserializeJson!(FeeRefund)(res.readJson()));
        return;
      }
      if (handleResponseDefault is null) throw new Exception("Unhandled response status code default");
      handleResponseDefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

  }

  /**
   * <p>By default, you can see the 10 most recent refunds stored directly on the application fee
   * object, but you can also retrieve details about a specific refund stored on the application
   * fee.</p>
   * See_Also: HTTP GET `/v1/application_fees/{fee}/refunds/{id}`
   */
  void getApplicationFeesFeeRefundsId(
      GetApplicationFeesFeeRefundsIdParams params,
      GetApplicationFeesFeeRefundsIdResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.GET,
        Servers.getServerUrl(),
        "/v1/application_fees/{fee}/refunds/{id}");
    if (!params.expand.isNull)
      requestor.setQueryParam!("deepObject")("expand", params.expand);
    if (!params.fee.isNull)
      requestor.setPathParam("fee", params.fee);
    if (!params.id.isNull)
      requestor.setPathParam("id", params.id);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class PostApplicationFeesFeeRefundsIdParams {
    /**
     */
    string fee;

    /**
     */
    string id;

    mixin AddBuilder!(typeof(this));

  }

  static class PostApplicationFeesFeeRefundsIdBody {
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

  static class PostApplicationFeesFeeRefundsIdResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(FeeRefund response) handleResponse200;

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
        handleResponse200(deserializeJson!(FeeRefund)(res.readJson()));
        return;
      }
      if (handleResponseDefault is null) throw new Exception("Unhandled response status code default");
      handleResponseDefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

  }

  /**
   * <p>Updates the specified application fee refund by setting the values of the parameters passed.
   * Any parameters not provided will be left unchanged.</p>
   * <p>This request only accepts metadata as an argument.</p>
   * See_Also: HTTP POST `/v1/application_fees/{fee}/refunds/{id}`
   */
  void postApplicationFeesFeeRefundsId(
      PostApplicationFeesFeeRefundsIdParams params,
      PostApplicationFeesFeeRefundsIdBody requestBody,
      PostApplicationFeesFeeRefundsIdResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/application_fees/{fee}/refunds/{id}");
    if (!params.fee.isNull)
      requestor.setPathParam("fee", params.fee);
    if (!params.id.isNull)
      requestor.setPathParam("id", params.id);
    requestor.setHeaderParam("Content-Type", "application/x-www-form-urlencoded");
    Security.apply(requestor);
    requestor.makeRequest(requestBody, responseHandler);
  }

  static class GetApplicationFeesIdParams {
    /**
     * Specifies which fields in the response should be expanded.
     */
    string[] expand;

    /**
     */
    string id;

    mixin AddBuilder!(typeof(this));

  }

  static class GetApplicationFeesIdResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(ApplicationFee response) handleResponse200;

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
        handleResponse200(deserializeJson!(ApplicationFee)(res.readJson()));
        return;
      }
      if (handleResponseDefault is null) throw new Exception("Unhandled response status code default");
      handleResponseDefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

  }

  /**
   * <p>Retrieves the details of an application fee that your account has collected. The same
   * information is returned when refunding the application fee.</p>
   * See_Also: HTTP GET `/v1/application_fees/{id}`
   */
  void getApplicationFeesId(
      GetApplicationFeesIdParams params,
      GetApplicationFeesIdResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.GET,
        Servers.getServerUrl(),
        "/v1/application_fees/{id}");
    if (!params.expand.isNull)
      requestor.setQueryParam!("deepObject")("expand", params.expand);
    if (!params.id.isNull)
      requestor.setPathParam("id", params.id);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  mixin AddBuilder!(typeof(this));

}

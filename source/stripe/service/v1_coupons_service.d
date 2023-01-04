// File automatically generated from OpenAPI spec.
module stripe.service.v1_coupons_service;

import vibe.http.client : requestHTTP, HTTPClientRequest, HTTPClientResponse;
import vibe.http.common : HTTPMethod;
import vibe.stream.operations : readAllUTF8;
import vibe.data.serialization : optional;
import vibe.data.json : Json, deserializeJson;

import stripe.servers : Servers;
import stripe.security : Security;
import openapi_client.util : isNull;
import openapi_client.apirequest : ApiRequest;
import openapi_client.handler : ResponseHandler;

import std.conv : to;
import std.typecons : Nullable;
import std.stdio;

public import stripe.model.coupon : Coupon;
public import stripe.model.deleted_coupon : DeletedCoupon;
public import stripe.model.error : Error_;

/**
 * Service to make REST API calls to paths beginning with: /v1/coupons
 */
class V1CouponsService {
  static class GetCouponsParams {
    /**
     * A filter on the list, based on the object `created` field. The value can be a string with an
     * integer Unix timestamp, or it can be a dictionary with a number of different query options.
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

  }

  static class GetCouponsResponseHandler : ResponseHandler {

    static class CouponsResourceCouponList {
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
      Coupon[] data;

      /**
       * The URL where this list can be accessed.
       */
      @optional
      string url;

    }

    /**
     * Successful response.
     */
    void delegate(CouponsResourceCouponList response) handleResponse200;

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
        handleResponse200(deserializeJson!(CouponsResourceCouponList)(res.readJson()));
        return;
      }
      if (handleResponsedefault is null) throw new Exception("Unhandled response status code default");
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   * <p>Returns a list of your coupons.</p>
   * See_Also: HTTP GET `/v1/coupons`
   */
  void getCoupons(
      GetCouponsParams params,
      GetCouponsResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.GET,
        Servers.getServerUrl(),
        "/v1/coupons");
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

  static class PostCouponsResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(Coupon response) handleResponse200;

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
        handleResponse200(deserializeJson!(Coupon)(res.readJson()));
        return;
      }
      if (handleResponsedefault is null) throw new Exception("Unhandled response status code default");
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   * <p>You can create coupons easily via the <a href="https://dashboard.stripe.com/coupons">coupon
   * management</a> page of the Stripe dashboard. Coupon creation is also accessible via the API if
   * you need to create coupons on the fly.</p>
   * <p>A coupon has either a <code>percent_off</code> or an <code>amount_off</code> and
   * <code>currency</code>. If you set an <code>amount_off</code>, that amount will be subtracted
   * from any invoice’s subtotal. For example, an invoice with a subtotal of
   * <currency>100</currency> will have a final total of <currency>0</currency> if a coupon with an
   * <code>amount_off</code> of <amount>200</amount> is applied to it and an invoice with a subtotal
   * of <currency>300</currency> will have a final total of <currency>100</currency> if a coupon
   * with an <code>amount_off</code> of <amount>200</amount> is applied to it.</p>
   * See_Also: HTTP POST `/v1/coupons`
   */
  void postCoupons(
      PostCouponsResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/coupons");
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class GetCouponsCouponParams {
    /**
     */
    string coupon;

    /**
     * Specifies which fields in the response should be expanded.
     */
    string[] expand;

  }

  static class GetCouponsCouponResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(Coupon response) handleResponse200;

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
        handleResponse200(deserializeJson!(Coupon)(res.readJson()));
        return;
      }
      if (handleResponsedefault is null) throw new Exception("Unhandled response status code default");
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   * <p>Retrieves the coupon with the given ID.</p>
   * See_Also: HTTP GET `/v1/coupons/{coupon}`
   */
  void getCouponsCoupon(
      GetCouponsCouponParams params,
      GetCouponsCouponResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.GET,
        Servers.getServerUrl(),
        "/v1/coupons/{coupon}");
    if (!params.coupon.isNull)
      requestor.setPathParam("coupon", params.coupon);
    if (!params.expand.isNull)
      requestor.setQueryParam!("deepObject")("expand", params.expand);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class PostCouponsCouponParams {
    /**
     */
    string coupon;

  }

  static class PostCouponsCouponResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(Coupon response) handleResponse200;

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
        handleResponse200(deserializeJson!(Coupon)(res.readJson()));
        return;
      }
      if (handleResponsedefault is null) throw new Exception("Unhandled response status code default");
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   * <p>Updates the metadata of a coupon. Other coupon details (currency, duration, amount_off) are,
   * by design, not editable.</p>
   * See_Also: HTTP POST `/v1/coupons/{coupon}`
   */
  void postCouponsCoupon(
      PostCouponsCouponParams params,
      PostCouponsCouponResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/coupons/{coupon}");
    if (!params.coupon.isNull)
      requestor.setPathParam("coupon", params.coupon);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class DeleteCouponsCouponParams {
    /**
     */
    string coupon;

  }

  static class DeleteCouponsCouponResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(DeletedCoupon response) handleResponse200;

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
        handleResponse200(deserializeJson!(DeletedCoupon)(res.readJson()));
        return;
      }
      if (handleResponsedefault is null) throw new Exception("Unhandled response status code default");
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   * <p>You can delete coupons via the <a href="https://dashboard.stripe.com/coupons">coupon
   * management</a> page of the Stripe dashboard. However, deleting a coupon does not affect any
   * customers who have already applied the coupon; it means that new customers can’t redeem the
   * coupon. You can also delete coupons via the API.</p>
   * See_Also: HTTP DELETE `/v1/coupons/{coupon}`
   */
  void deleteCouponsCoupon(
      DeleteCouponsCouponParams params,
      DeleteCouponsCouponResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.DELETE,
        Servers.getServerUrl(),
        "/v1/coupons/{coupon}");
    if (!params.coupon.isNull)
      requestor.setPathParam("coupon", params.coupon);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

}

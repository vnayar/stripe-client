// File automatically generated from OpenAPI spec.
module stripe.service.v1_coupons_service;

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

    mixin AddBuilder!(typeof(this));

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

      mixin AddBuilder!(typeof(this));

    }

    /**
     * Successful response.
     */
    void delegate(CouponsResourceCouponList response) handleResponse200;

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
        handleResponse200(deserializeJson!(CouponsResourceCouponList)(res.readJson()));
        return;
      }
      if (handleResponseDefault is null) throw new Exception("Unhandled response status code default");
      handleResponseDefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

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

  static class PostCouponsBody {
    /**
     * Unique string of your choice that will be used to identify this coupon when applying it to a
     * customer. If you don't want to specify a particular code, you can leave the ID blank and
     * we'll generate a random code for you.
     */
    @optional
    string id;

    /**
     * Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an
     * object. This can be useful for storing additional information about the object in a
     * structured format. Individual keys can be unset by posting an empty value to them. All keys
     * can be unset by posting an empty value to `metadata`.
     */
    @optional
    Json metadata;

    /**
     * Three-letter [ISO code for the currency](https://stripe.com/docs/currencies) of the
     * `amount_off` parameter (required if `amount_off` is passed).
     */
    @optional
    string currency;

    /**
     * A positive integer specifying the number of times the coupon can be redeemed before it's no
     * longer valid. For example, you might have a 50% off coupon that the first 20 readers of your
     * blog can use.
     */
    @optional
    Nullable!(int) max_redemptions;

    /**
     * Name of the coupon displayed to customers on, for instance invoices, or receipts. By default
     * the `id` is shown if `name` is not set.
     */
    @optional
    string name;

    /**
     * A positive integer representing the amount to subtract from an invoice total (required if
     * `percent_off` is not passed).
     */
    @optional
    Nullable!(int) amount_off;

    /**
     * Specifies which fields in the response should be expanded.
     */
    @optional
    string[] expand;

    /**
     * Unix timestamp specifying the last time at which the coupon can be redeemed. After the
     * redeem_by date, the coupon can no longer be applied to new customers.
     */
    @optional
    Nullable!(long) redeem_by;

    static class AppliesToParams {
      @optional
      string[] products;

      mixin AddBuilder!(typeof(this));

    }

    /**
     * A hash containing directions for what this Coupon will apply discounts to.
     */
    @optional
    AppliesToParams applies_to;

    /**
     * Specifies how long the discount will be in effect if used on a subscription. Defaults to
     * `once`.
     */
    @optional
    string duration;

    /**
     * A positive float larger than 0, and smaller or equal to 100, that represents the discount the
     * coupon will apply (required if `amount_off` is not passed).
     */
    @optional
    Nullable!(float) percent_off;

    /**
     * Required only if `duration` is `repeating`, in which case it must be a positive integer that
     * specifies the number of months the discount will be in effect.
     */
    @optional
    Nullable!(int) duration_in_months;

    static class CurrencyOption {
      @optional
      Nullable!(int) amount_off;

      mixin AddBuilder!(typeof(this));

    }

    /**
     * Coupons defined in each available currency option (only supported if `amount_off` is passed).
     * Each key must be a three-letter [ISO currency
     * code](https://www.iso.org/iso-4217-currency-codes.html) and a [supported
     * currency](https://stripe.com/docs/currencies).
     */
    @optional
    CurrencyOption[string] currency_options;

    mixin AddBuilder!(typeof(this));

  }

  static class PostCouponsResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(Coupon response) handleResponse200;

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
        handleResponse200(deserializeJson!(Coupon)(res.readJson()));
        return;
      }
      if (handleResponseDefault is null) throw new Exception("Unhandled response status code default");
      handleResponseDefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

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
      PostCouponsBody requestBody,
      PostCouponsResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/coupons");
    requestor.setHeaderParam("Content-Type", "application/x-www-form-urlencoded");
    Security.apply(requestor);
    requestor.makeRequest(requestBody, responseHandler);
  }

  static class GetCouponsCouponParams {
    /**
     */
    string coupon;

    /**
     * Specifies which fields in the response should be expanded.
     */
    string[] expand;

    mixin AddBuilder!(typeof(this));

  }

  static class GetCouponsCouponResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(Coupon response) handleResponse200;

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
        handleResponse200(deserializeJson!(Coupon)(res.readJson()));
        return;
      }
      if (handleResponseDefault is null) throw new Exception("Unhandled response status code default");
      handleResponseDefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

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

    mixin AddBuilder!(typeof(this));

  }

  static class PostCouponsCouponBody {
    /**
     * Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an
     * object. This can be useful for storing additional information about the object in a
     * structured format. Individual keys can be unset by posting an empty value to them. All keys
     * can be unset by posting an empty value to `metadata`.
     */
    @optional
    Json metadata;

    static class CurrencyOption {
      @optional
      Nullable!(int) amount_off;

      mixin AddBuilder!(typeof(this));

    }

    /**
     * Coupons defined in each available currency option (only supported if the coupon is
     * amount-based). Each key must be a three-letter [ISO currency
     * code](https://www.iso.org/iso-4217-currency-codes.html) and a [supported
     * currency](https://stripe.com/docs/currencies).
     */
    @optional
    CurrencyOption[string] currency_options;

    /**
     * Specifies which fields in the response should be expanded.
     */
    @optional
    string[] expand;

    /**
     * Name of the coupon displayed to customers on, for instance invoices, or receipts. By default
     * the `id` is shown if `name` is not set.
     */
    @optional
    string name;

    mixin AddBuilder!(typeof(this));

  }

  static class PostCouponsCouponResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(Coupon response) handleResponse200;

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
        handleResponse200(deserializeJson!(Coupon)(res.readJson()));
        return;
      }
      if (handleResponseDefault is null) throw new Exception("Unhandled response status code default");
      handleResponseDefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

  }

  /**
   * <p>Updates the metadata of a coupon. Other coupon details (currency, duration, amount_off) are,
   * by design, not editable.</p>
   * See_Also: HTTP POST `/v1/coupons/{coupon}`
   */
  void postCouponsCoupon(
      PostCouponsCouponParams params,
      PostCouponsCouponBody requestBody,
      PostCouponsCouponResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/coupons/{coupon}");
    if (!params.coupon.isNull)
      requestor.setPathParam("coupon", params.coupon);
    requestor.setHeaderParam("Content-Type", "application/x-www-form-urlencoded");
    Security.apply(requestor);
    requestor.makeRequest(requestBody, responseHandler);
  }

  static class DeleteCouponsCouponParams {
    /**
     */
    string coupon;

    mixin AddBuilder!(typeof(this));

  }

  static class DeleteCouponsCouponResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(DeletedCoupon response) handleResponse200;

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
        handleResponse200(deserializeJson!(DeletedCoupon)(res.readJson()));
        return;
      }
      if (handleResponseDefault is null) throw new Exception("Unhandled response status code default");
      handleResponseDefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

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

  mixin AddBuilder!(typeof(this));

}

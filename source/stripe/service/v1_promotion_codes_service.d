// File automatically generated from OpenAPI spec.
module stripe.service.v1_promotion_codes_service;

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
public import stripe.model.promotion_code : PromotionCode;

/**
 * Service to make REST API calls to paths beginning with: /v1/promotion_codes
 */
class V1PromotionCodesService {
  static class GetPromotionCodesPromotionCodeParams {
    /**
     * Specifies which fields in the response should be expanded.
     */
    string[] expand;

    /**
     */
    string promotion_code;

    mixin AddBuilder!(typeof(this));

  }

  static class GetPromotionCodesPromotionCodeResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(PromotionCode response) handleResponse200;

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
        handleResponse200(deserializeJson!(PromotionCode)(res.readJson()));
        return;
      }
      if (handleResponsedefault is null) throw new Exception("Unhandled response status code default");
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

  }

  /**
   * <p>Retrieves the promotion code with the given ID. In order to retrieve a promotion code by the
   * customer-facing <code>code</code> use <a href="/docs/api/promotion_codes/list">list</a> with
   * the desired <code>code</code>.</p>
   * See_Also: HTTP GET `/v1/promotion_codes/{promotion_code}`
   */
  void getPromotionCodesPromotionCode(
      GetPromotionCodesPromotionCodeParams params,
      GetPromotionCodesPromotionCodeResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.GET,
        Servers.getServerUrl(),
        "/v1/promotion_codes/{promotion_code}");
    if (!params.expand.isNull)
      requestor.setQueryParam!("deepObject")("expand", params.expand);
    if (!params.promotion_code.isNull)
      requestor.setPathParam("promotion_code", params.promotion_code);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class PostPromotionCodesPromotionCodeParams {
    /**
     */
    string promotion_code;

    mixin AddBuilder!(typeof(this));

  }

  static class PostPromotionCodesPromotionCodeResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(PromotionCode response) handleResponse200;

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
        handleResponse200(deserializeJson!(PromotionCode)(res.readJson()));
        return;
      }
      if (handleResponsedefault is null) throw new Exception("Unhandled response status code default");
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

  }

  /**
   * <p>Updates the specified promotion code by setting the values of the parameters passed. Most
   * fields are, by design, not editable.</p>
   * See_Also: HTTP POST `/v1/promotion_codes/{promotion_code}`
   */
  void postPromotionCodesPromotionCode(
      PostPromotionCodesPromotionCodeParams params,
      PostPromotionCodesPromotionCodeResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/promotion_codes/{promotion_code}");
    if (!params.promotion_code.isNull)
      requestor.setPathParam("promotion_code", params.promotion_code);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class GetPromotionCodesParams {
    /**
     * Filter promotion codes by whether they are active.
     */
    Nullable!(bool) active;

    /**
     * Only return promotion codes that have this case-insensitive code.
     */
    string code;

    /**
     * Only return promotion codes for this coupon.
     */
    string coupon;

    /**
     * A filter on the list, based on the object `created` field. The value can be a string with an
     * integer Unix timestamp, or it can be a dictionary with a number of different query options.
     */
    Json created;

    /**
     * Only return promotion codes that are restricted to this customer.
     */
    string customer;

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

  static class GetPromotionCodesResponseHandler : ResponseHandler {

    static class PromotionCodesResourcePromotionCodeList {
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
      PromotionCode[] data;

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
    void delegate(PromotionCodesResourcePromotionCodeList response) handleResponse200;

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
        handleResponse200(deserializeJson!(PromotionCodesResourcePromotionCodeList)(res.readJson()));
        return;
      }
      if (handleResponsedefault is null) throw new Exception("Unhandled response status code default");
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

  }

  /**
   * <p>Returns a list of your promotion codes.</p>
   * See_Also: HTTP GET `/v1/promotion_codes`
   */
  void getPromotionCodes(
      GetPromotionCodesParams params,
      GetPromotionCodesResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.GET,
        Servers.getServerUrl(),
        "/v1/promotion_codes");
    if (!params.active.isNull)
      requestor.setQueryParam!("deepObject")("active", params.active);
    if (!params.code.isNull)
      requestor.setQueryParam!("deepObject")("code", params.code);
    if (!params.coupon.isNull)
      requestor.setQueryParam!("deepObject")("coupon", params.coupon);
    if (!params.created.isNull)
      requestor.setQueryParam!("deepObject")("created", params.created);
    if (!params.customer.isNull)
      requestor.setQueryParam!("deepObject")("customer", params.customer);
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

  static class PostPromotionCodesBody {
    static class RestrictionsParams {
      @optional
      string minimum_amount_currency;

      static class CurrencyOption {
        @optional
        Nullable!(int) minimum_amount;

        mixin AddBuilder!(typeof(this));

      }

      @optional
      CurrencyOption[string] currency_options;

      @optional
      Nullable!(int) minimum_amount;

      @optional
      Nullable!(bool) first_time_transaction;

      mixin AddBuilder!(typeof(this));

    }

    /**
     * Settings that restrict the redemption of the promotion code.
     */
    @optional
    RestrictionsParams restrictions;

    /**
     * The coupon for this promotion code.
     */
    @optional
    string coupon;

    /**
     * The timestamp at which this promotion code will expire. If the coupon has specified a
     * `redeems_by`, then this value cannot be after the coupon's `redeems_by`.
     */
    @optional
    Nullable!(long) expires_at;

    /**
     * The customer-facing code. Regardless of case, this code must be unique across all active
     * promotion codes for a specific customer. If left blank, we will generate one automatically.
     */
    @optional
    string code;

    /**
     * The customer that this promotion code can be used by. If not set, the promotion code can be
     * used by all customers.
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
    string[string] metadata;

    /**
     * A positive integer specifying the number of times the promotion code can be redeemed. If the
     * coupon has specified a `max_redemptions`, then this value cannot be greater than the coupon's
     * `max_redemptions`.
     */
    @optional
    Nullable!(int) max_redemptions;

    /**
     * Whether the promotion code is currently active.
     */
    @optional
    Nullable!(bool) active;

    /**
     * Specifies which fields in the response should be expanded.
     */
    @optional
    string[] expand;

    mixin AddBuilder!(typeof(this));

  }

  static class PostPromotionCodesResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(PromotionCode response) handleResponse200;

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
        handleResponse200(deserializeJson!(PromotionCode)(res.readJson()));
        return;
      }
      if (handleResponsedefault is null) throw new Exception("Unhandled response status code default");
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

  }

  /**
   * <p>A promotion code points to a coupon. You can optionally restrict the code to a specific
   * customer, redemption limit, and expiration date.</p>
   * See_Also: HTTP POST `/v1/promotion_codes`
   */
  void postPromotionCodes(
      PostPromotionCodesBody requestBody,
      PostPromotionCodesResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/promotion_codes");
    requestor.setHeaderParam("Content-Type", "application/x-www-form-urlencoded");
    Security.apply(requestor);
    requestor.makeRequest(requestBody, responseHandler);
  }

  mixin AddBuilder!(typeof(this));

}

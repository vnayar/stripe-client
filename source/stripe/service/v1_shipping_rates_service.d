// File automatically generated from OpenAPI spec.
module stripe.service.v1_shipping_rates_service;

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

public import stripe.model.error : Error_;
public import stripe.model.shipping_rate : ShippingRate;

/**
 * Service to make REST API calls to paths beginning with: /v1/shipping_rates
 */
class V1ShippingRatesService {
  static class GetShippingRatesShippingRateTokenParams {
    /**
     * Specifies which fields in the response should be expanded.
     */
    string[] expand;

    /**
     */
    string shipping_rate_token;

  }

  static class GetShippingRatesShippingRateTokenResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(ShippingRate response) handleResponse200;

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
        handleResponse200(deserializeJson!(ShippingRate)(res.readJson()));
        return;
      }
      if (handleResponsedefault is null) throw new Exception("Unhandled response status code default");
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   * <p>Returns the shipping rate object with the given ID.</p>
   * See_Also: HTTP GET `/v1/shipping_rates/{shipping_rate_token}`
   */
  void getShippingRatesShippingRateToken(
      GetShippingRatesShippingRateTokenParams params,
      GetShippingRatesShippingRateTokenResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.GET,
        Servers.getServerUrl(),
        "/v1/shipping_rates/{shipping_rate_token}");
    if (!params.expand.isNull)
      requestor.setQueryParam!("deepObject")("expand", params.expand);
    if (!params.shipping_rate_token.isNull)
      requestor.setPathParam("shipping_rate_token", params.shipping_rate_token);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class PostShippingRatesShippingRateTokenParams {
    /**
     */
    string shipping_rate_token;

  }

  static class PostShippingRatesShippingRateTokenResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(ShippingRate response) handleResponse200;

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
        handleResponse200(deserializeJson!(ShippingRate)(res.readJson()));
        return;
      }
      if (handleResponsedefault is null) throw new Exception("Unhandled response status code default");
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   * <p>Updates an existing shipping rate object.</p>
   * See_Also: HTTP POST `/v1/shipping_rates/{shipping_rate_token}`
   */
  void postShippingRatesShippingRateToken(
      PostShippingRatesShippingRateTokenParams params,
      PostShippingRatesShippingRateTokenResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/shipping_rates/{shipping_rate_token}");
    if (!params.shipping_rate_token.isNull)
      requestor.setPathParam("shipping_rate_token", params.shipping_rate_token);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class GetShippingRatesParams {
    /**
     * Only return shipping rates that are active or inactive.
     */
    Nullable!(bool) active;

    /**
     * A filter on the list, based on the object `created` field. The value can be a string with an
     * integer Unix timestamp, or it can be a dictionary with a number of different query options.
     */
    Json created;

    /**
     * Only return shipping rates for the given currency.
     */
    string currency;

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

  static class GetShippingRatesResponseHandler : ResponseHandler {

    static class ShippingResourcesShippingRateList {
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
      ShippingRate[] data;

      /**
       * The URL where this list can be accessed.
       */
      @optional
      string url;

    }

    /**
     * Successful response.
     */
    void delegate(ShippingResourcesShippingRateList response) handleResponse200;

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
        handleResponse200(deserializeJson!(ShippingResourcesShippingRateList)(res.readJson()));
        return;
      }
      if (handleResponsedefault is null) throw new Exception("Unhandled response status code default");
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   * <p>Returns a list of your shipping rates.</p>
   * See_Also: HTTP GET `/v1/shipping_rates`
   */
  void getShippingRates(
      GetShippingRatesParams params,
      GetShippingRatesResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.GET,
        Servers.getServerUrl(),
        "/v1/shipping_rates");
    if (!params.active.isNull)
      requestor.setQueryParam!("deepObject")("active", params.active);
    if (!params.created.isNull)
      requestor.setQueryParam!("deepObject")("created", params.created);
    if (!params.currency.isNull)
      requestor.setQueryParam!("deepObject")("currency", params.currency);
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

  static class PostShippingRatesBody {
    static class DeliveryEstimate {
      static class DeliveryEstimateBound {
        @optional
        string unit;

        @optional
        Nullable!(int) value;

      }

      @optional
      DeliveryEstimateBound minimum;

      @optional
      DeliveryEstimateBound maximum;

    }

    /**
     * The estimated range for how long shipping will take, meant to be displayable to the customer.
     * This will appear on CheckoutSessions.
     */
    @optional
    DeliveryEstimate delivery_estimate;

    static class FixedAmount {
      @optional
      Nullable!(int) amount;

      @optional
      string currency;

      static class CurrencyOption {
        @optional
        Nullable!(int) amount;

        @optional
        string tax_behavior;

      }

      @optional
      CurrencyOption[string] currency_options;

    }

    /**
     * Describes a fixed amount to charge for shipping. Must be present if type is `fixed_amount`.
     */
    @optional
    FixedAmount fixed_amount;

    /**
     * A [tax code](https://stripe.com/docs/tax/tax-categories) ID. The Shipping tax code is
     * `txcd_92010001`.
     */
    @optional
    string tax_code;

    /**
     * Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an
     * object. This can be useful for storing additional information about the object in a
     * structured format. Individual keys can be unset by posting an empty value to them. All keys
     * can be unset by posting an empty value to `metadata`.
     */
    @optional
    string[string] metadata;

    /**
     * The name of the shipping rate, meant to be displayable to the customer. This will appear on
     * CheckoutSessions.
     */
    @optional
    string display_name;

    /**
     * Specifies which fields in the response should be expanded.
     */
    @optional
    string[] expand;

    /**
     * Specifies whether the rate is considered inclusive of taxes or exclusive of taxes. One of
     * `inclusive`, `exclusive`, or `unspecified`.
     */
    @optional
    string tax_behavior;

    /**
     * The type of calculation to use on the shipping rate. Can only be `fixed_amount` for now.
     */
    @optional
    string type;

  }

  static class PostShippingRatesResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(ShippingRate response) handleResponse200;

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
        handleResponse200(deserializeJson!(ShippingRate)(res.readJson()));
        return;
      }
      if (handleResponsedefault is null) throw new Exception("Unhandled response status code default");
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   * <p>Creates a new shipping rate object.</p>
   * See_Also: HTTP POST `/v1/shipping_rates`
   */
  void postShippingRates(
      PostShippingRatesBody requestBody,
      PostShippingRatesResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/shipping_rates");
    requestor.setHeaderParam("Content-Type", "application/x-www-form-urlencoded");
    Security.apply(requestor);
    requestor.makeRequest(requestBody, responseHandler);
  }

}

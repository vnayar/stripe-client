// File automatically generated from OpenAPI spec.
module stripe.service.v1_tax_rates_service;

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
public import stripe.model.tax_rate : TaxRate;

/**
 * Service to make REST API calls to paths beginning with: /v1/tax_rates
 */
class V1TaxRatesService {
  static class GetTaxRatesTaxRateParams {
    /**
     * Specifies which fields in the response should be expanded.
     */
    string[] expand;

    /**
     */
    string tax_rate;

    mixin AddBuilder!(typeof(this));

  }

  static class GetTaxRatesTaxRateResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(TaxRate response) handleResponse200;

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
        handleResponse200(deserializeJson!(TaxRate)(res.readJson()));
        return;
      }
      if (handleResponsedefault is null) throw new Exception("Unhandled response status code default");
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

  }

  /**
   * <p>Retrieves a tax rate with the given ID</p>
   * See_Also: HTTP GET `/v1/tax_rates/{tax_rate}`
   */
  void getTaxRatesTaxRate(
      GetTaxRatesTaxRateParams params,
      GetTaxRatesTaxRateResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.GET,
        Servers.getServerUrl(),
        "/v1/tax_rates/{tax_rate}");
    if (!params.expand.isNull)
      requestor.setQueryParam!("deepObject")("expand", params.expand);
    if (!params.tax_rate.isNull)
      requestor.setPathParam("tax_rate", params.tax_rate);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class PostTaxRatesTaxRateParams {
    /**
     */
    string tax_rate;

    mixin AddBuilder!(typeof(this));

  }

  static class PostTaxRatesTaxRateResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(TaxRate response) handleResponse200;

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
        handleResponse200(deserializeJson!(TaxRate)(res.readJson()));
        return;
      }
      if (handleResponsedefault is null) throw new Exception("Unhandled response status code default");
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

  }

  /**
   * <p>Updates an existing tax rate.</p>
   * See_Also: HTTP POST `/v1/tax_rates/{tax_rate}`
   */
  void postTaxRatesTaxRate(
      PostTaxRatesTaxRateParams params,
      PostTaxRatesTaxRateResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/tax_rates/{tax_rate}");
    if (!params.tax_rate.isNull)
      requestor.setPathParam("tax_rate", params.tax_rate);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class GetTaxRatesParams {
    /**
     * Optional flag to filter by tax rates that are either active or inactive (archived).
     */
    Nullable!(bool) active;

    /**
     * Optional range for filtering created date.
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
     * Optional flag to filter by tax rates that are inclusive (or those that are not inclusive).
     */
    Nullable!(bool) inclusive;

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

  static class GetTaxRatesResponseHandler : ResponseHandler {

    static class TaxRatesList {
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
      TaxRate[] data;

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
    void delegate(TaxRatesList response) handleResponse200;

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
        handleResponse200(deserializeJson!(TaxRatesList)(res.readJson()));
        return;
      }
      if (handleResponsedefault is null) throw new Exception("Unhandled response status code default");
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

  }

  /**
   * <p>Returns a list of your tax rates. Tax rates are returned sorted by creation date, with the
   * most recently created tax rates appearing first.</p>
   * See_Also: HTTP GET `/v1/tax_rates`
   */
  void getTaxRates(
      GetTaxRatesParams params,
      GetTaxRatesResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.GET,
        Servers.getServerUrl(),
        "/v1/tax_rates");
    if (!params.active.isNull)
      requestor.setQueryParam!("deepObject")("active", params.active);
    if (!params.created.isNull)
      requestor.setQueryParam!("deepObject")("created", params.created);
    if (!params.ending_before.isNull)
      requestor.setQueryParam!("deepObject")("ending_before", params.ending_before);
    if (!params.expand.isNull)
      requestor.setQueryParam!("deepObject")("expand", params.expand);
    if (!params.inclusive.isNull)
      requestor.setQueryParam!("deepObject")("inclusive", params.inclusive);
    if (!params.limit.isNull)
      requestor.setQueryParam!("deepObject")("limit", params.limit);
    if (!params.starting_after.isNull)
      requestor.setQueryParam!("deepObject")("starting_after", params.starting_after);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class PostTaxRatesBody {
    /**
     * Two-letter country code ([ISO 3166-1
     * alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2)).
     */
    @optional
    string country;

    /**
     * [ISO 3166-2 subdivision code](https://en.wikipedia.org/wiki/ISO_3166-2:US), without country
     * prefix. For example, "NY" for New York, United States.
     */
    @optional
    string state;

    /**
     * This specifies if the tax rate is inclusive or exclusive.
     */
    @optional
    Nullable!(bool) inclusive;

    /**
     * Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an
     * object. This can be useful for storing additional information about the object in a
     * structured format. Individual keys can be unset by posting an empty value to them. All keys
     * can be unset by posting an empty value to `metadata`.
     */
    @optional
    string[string] metadata;

    /**
     * Flag determining whether the tax rate is active or inactive (archived). Inactive tax rates
     * cannot be used with new applications or Checkout Sessions, but will still work for
     * subscriptions and invoices that already have it set.
     */
    @optional
    Nullable!(bool) active;

    /**
     * This represents the tax rate percent out of 100.
     */
    @optional
    Nullable!(float) percentage;

    /**
     * The display name of the tax rate, which will be shown to users.
     */
    @optional
    string display_name;

    /**
     * Specifies which fields in the response should be expanded.
     */
    @optional
    string[] expand;

    /**
     * The high-level tax type, such as `vat` or `sales_tax`.
     */
    @optional
    string tax_type;

    /**
     * An arbitrary string attached to the tax rate for your internal use only. It will not be
     * visible to your customers.
     */
    @optional
    string description;

    /**
     * The jurisdiction for the tax rate. You can use this label field for tax reporting purposes.
     * It also appears on your customer’s invoice.
     */
    @optional
    string jurisdiction;

    mixin AddBuilder!(typeof(this));

  }

  static class PostTaxRatesResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(TaxRate response) handleResponse200;

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
        handleResponse200(deserializeJson!(TaxRate)(res.readJson()));
        return;
      }
      if (handleResponsedefault is null) throw new Exception("Unhandled response status code default");
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

  }

  /**
   * <p>Creates a new tax rate.</p>
   * See_Also: HTTP POST `/v1/tax_rates`
   */
  void postTaxRates(
      PostTaxRatesBody requestBody,
      PostTaxRatesResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/tax_rates");
    requestor.setHeaderParam("Content-Type", "application/x-www-form-urlencoded");
    Security.apply(requestor);
    requestor.makeRequest(requestBody, responseHandler);
  }

  mixin AddBuilder!(typeof(this));

}

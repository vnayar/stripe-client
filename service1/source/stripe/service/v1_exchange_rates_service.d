// File automatically generated from OpenAPI spec.
module stripe.service.v1_exchange_rates_service;

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
public import stripe.model.exchange_rate : ExchangeRate;

/**
 * Service to make REST API calls to paths beginning with: /v1/exchange_rates
 */
class V1ExchangeRatesService {
  static class GetExchangeRatesParams {
    /**
     * A cursor for use in pagination. `ending_before` is the currency that defines your place in
     * the list. For instance, if you make a list request and receive 100 objects, starting with the
     * exchange rate for currency X your subsequent call can include `ending_before=obj_bar` in
     * order to fetch the previous page of the list.
     */
    string ending_before;

    /**
     * Specifies which fields in the response should be expanded.
     */
    string[] expand;

    /**
     * A limit on the number of objects to be returned. Limit can range between 1 and total number
     * of supported payout currencies, and the default is the max.
     */
    Nullable!(int) limit;

    /**
     * A cursor for use in pagination. `starting_after` is the currency that defines your place in
     * the list. For instance, if you make a list request and receive 100 objects, ending with the
     * exchange rate for currency X, your subsequent call can include `starting_after=X` in order to
     * fetch the next page of the list.
     */
    string starting_after;

    mixin AddBuilder!(typeof(this));

  }

  static class GetExchangeRatesResponseHandler : ResponseHandler {

    static class ExchangeRateList {
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
      ExchangeRate[] data;

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
    void delegate(ExchangeRateList response) handleResponse200;

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
        handleResponse200(deserializeJson!(ExchangeRateList)(res.readJson()));
        return;
      }
      if (handleResponseDefault is null) throw new Exception("Unhandled response status code default");
      handleResponseDefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

  }

  /**
   * <p>Returns a list of objects that contain the rates at which foreign currencies are converted
   * to one another. Only shows the currencies for which Stripe supports.</p>
   * See_Also: HTTP GET `/v1/exchange_rates`
   */
  void getExchangeRates(
      GetExchangeRatesParams params,
      GetExchangeRatesResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.GET,
        Servers.getServerUrl(),
        "/v1/exchange_rates");
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

  static class GetExchangeRatesRateIdParams {
    /**
     * Specifies which fields in the response should be expanded.
     */
    string[] expand;

    /**
     */
    string rate_id;

    mixin AddBuilder!(typeof(this));

  }

  static class GetExchangeRatesRateIdResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(ExchangeRate response) handleResponse200;

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
        handleResponse200(deserializeJson!(ExchangeRate)(res.readJson()));
        return;
      }
      if (handleResponseDefault is null) throw new Exception("Unhandled response status code default");
      handleResponseDefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

  }

  /**
   * <p>Retrieves the exchange rates from the given currency to every supported currency.</p>
   * See_Also: HTTP GET `/v1/exchange_rates/{rate_id}`
   */
  void getExchangeRatesRateId(
      GetExchangeRatesRateIdParams params,
      GetExchangeRatesRateIdResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.GET,
        Servers.getServerUrl(),
        "/v1/exchange_rates/{rate_id}");
    if (!params.expand.isNull)
      requestor.setQueryParam!("deepObject")("expand", params.expand);
    if (!params.rate_id.isNull)
      requestor.setPathParam("rate_id", params.rate_id);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  mixin AddBuilder!(typeof(this));

}

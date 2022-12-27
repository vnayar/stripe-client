// File automatically generated from OpenAPI spec.
module stripe.service.v1_prices_service;

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
public import stripe.model.price : Price;
/**
 * Service to make REST API calls to paths beginning with: /v1/prices
 */
class V1PricesService {
  static class GetPricesParams {
    /**
     * Only return prices that are active or inactive (e.g., pass `false` to list all inactive
     * prices).
     */
    Nullable!(Nullable!(bool)) active;

    /**
     * A filter on the list, based on the object `created` field. The value can be a string with an
     * integer Unix timestamp, or it can be a dictionary with a number of different query options.
     */
    Nullable!(Json) created;

    /**
     * Only return prices for the given currency.
     */
    Nullable!(Nullable!(string)) currency;

    /**
     * A cursor for use in pagination. `ending_before` is an object ID that defines your place in
     * the list. For instance, if you make a list request and receive 100 objects, starting with
     * `obj_bar`, your subsequent call can include `ending_before=obj_bar` in order to fetch the
     * previous page of the list.
     */
    Nullable!(Nullable!(string)) ending_before;

    /**
     * Specifies which fields in the response should be expanded.
     */
    Nullable!(Nullable!(string)[]) expand;

    /**
     * A limit on the number of objects to be returned. Limit can range between 1 and 100, and the
     * default is 10.
     */
    Nullable!(Nullable!(int)) limit;

    /**
     * Only return the price with these lookup_keys, if any exist.
     */
    Nullable!(Nullable!(string)[]) lookup_keys;

    /**
     * Only return prices for the given product.
     */
    Nullable!(Nullable!(string)) product;

    /**
     * Only return prices with these recurring fields.
     */
    static class AllPricesRecurringParams {
      @optional
      Nullable!(string) usage_type;

      @optional
      Nullable!(string) interval;

    }

    Nullable!(AllPricesRecurringParams) recurring;

    /**
     * A cursor for use in pagination. `starting_after` is an object ID that defines your place in
     * the list. For instance, if you make a list request and receive 100 objects, ending with
     * `obj_foo`, your subsequent call can include `starting_after=obj_foo` in order to fetch the
     * next page of the list.
     */
    Nullable!(Nullable!(string)) starting_after;

    /**
     * Only return prices of type `recurring` or `one_time`.
     */
    Nullable!(Nullable!(string)) type;

  }

  static class GetPricesResponseHandler : ResponseHandler {

    static class PriceList {
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
      Nullable!(string) object;

      /**
       * Details about each object.
       */
      @optional
      Price[] data;

      /**
       * The URL where this list can be accessed.
       */
      @optional
      Nullable!(string) url;

    }

    /**
     * Successful response.
     */
    void delegate(PriceList response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponsedefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        handleResponse200(deserializeJson!(PriceList)(res.readJson()));
        return;
      }
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   */
  void getPrices(
      GetPricesParams params,
      GetPricesResponseHandler responseHandler = null,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.GET,
        Servers.getServerUrl(),
        "/v1/prices");
    if (!params.active.isNull)
      requestor.setQueryParam("active", params.active.get.to!string);
    if (!params.created.isNull)
      requestor.setQueryParam("created", params.created.get.to!string);
    if (!params.currency.isNull)
      requestor.setQueryParam("currency", params.currency.get.to!string);
    if (!params.ending_before.isNull)
      requestor.setQueryParam("ending_before", params.ending_before.get.to!string);
    if (!params.expand.isNull)
      requestor.setQueryParam("expand", params.expand.get.to!string);
    if (!params.limit.isNull)
      requestor.setQueryParam("limit", params.limit.get.to!string);
    if (!params.lookup_keys.isNull)
      requestor.setQueryParam("lookup_keys", params.lookup_keys.get.to!string);
    if (!params.product.isNull)
      requestor.setQueryParam("product", params.product.get.to!string);
    if (!params.recurring.isNull)
      requestor.setQueryParam("recurring", params.recurring.get.to!string);
    if (!params.starting_after.isNull)
      requestor.setQueryParam("starting_after", params.starting_after.get.to!string);
    if (!params.type.isNull)
      requestor.setQueryParam("type", params.type.get.to!string);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class PostPricesBody {
    /**
     * A lookup key used to retrieve prices dynamically from a static string. This may be up to 200
     * characters.
     */
    @optional
    Nullable!(string) lookup_key;

    static class Recurring {
      @optional
      Nullable!(string) aggregate_usage;

      @optional
      Nullable!(int) interval_count;

      @optional
      Nullable!(string) usage_type;

      @optional
      Nullable!(string) interval;

    }

    /**
     * The recurring components of a price such as `interval` and `usage_type`.
     */
    @optional
    Recurring recurring;

    /**
     * A positive integer in cents (or local equivalent) (or 0 for a free price) representing how
     * much to charge. One of `unit_amount` or `custom_unit_amount` is required, unless
     * `billing_scheme=tiered`.
     */
    @optional
    Nullable!(int) unit_amount;

    /**
     * Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an
     * object. This can be useful for storing additional information about the object in a
     * structured format. Individual keys can be unset by posting an empty value to them. All keys
     * can be unset by posting an empty value to `metadata`.
     */
    @optional
    Nullable!(string)[string] metadata;

    /**
     * Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in
     * lowercase. Must be a [supported currency](https://stripe.com/docs/currencies).
     */
    @optional
    Nullable!(string) currency;

    /**
     * The ID of the product that this price will belong to.
     */
    @optional
    Nullable!(string) product;

    static class TransformUsageParam {
      @optional
      Nullable!(int) divide_by;

      @optional
      Nullable!(string) round;

    }

    /**
     * Apply a transformation to the reported usage or set quantity before computing the billed
     * price. Cannot be combined with `tiers`.
     */
    @optional
    TransformUsageParam transform_quantity;

    /**
     * Whether the price can be used for new purchases. Defaults to `true`.
     */
    @optional
    Nullable!(bool) active;

    /**
     * Same as `unit_amount`, but accepts a decimal value in cents (or local equivalent) with at
     * most 12 decimal places. Only one of `unit_amount` and `unit_amount_decimal` can be set.
     */
    @optional
    Nullable!(string) unit_amount_decimal;

    /**
     * Specifies which fields in the response should be expanded.
     */
    @optional
    Nullable!(string)[] expand;

    static class CustomUnitAmount {
      @optional
      Nullable!(bool) enabled;

      @optional
      Nullable!(int) minimum;

      @optional
      Nullable!(int) preset;

      @optional
      Nullable!(int) maximum;

    }

    /**
     * When set, provides configuration for the amount to be adjusted by the customer during
     * Checkout Sessions and Payment Links.
     */
    @optional
    CustomUnitAmount custom_unit_amount;

    /**
     * Specifies whether the price is considered inclusive of taxes or exclusive of taxes. One of
     * `inclusive`, `exclusive`, or `unspecified`. Once specified as either `inclusive` or
     * `exclusive`, it cannot be changed.
     */
    @optional
    Nullable!(string) tax_behavior;

    /**
     * Describes how to compute the price per period. Either `per_unit` or `tiered`. `per_unit`
     * indicates that the fixed amount (specified in `unit_amount` or `unit_amount_decimal`) will be
     * charged per unit in `quantity` (for prices with `usage_type=licensed`), or per unit of total
     * usage (for prices with `usage_type=metered`). `tiered` indicates that the unit pricing will
     * be computed using a tiering strategy as defined using the `tiers` and `tiers_mode`
     * attributes.
     */
    @optional
    Nullable!(string) billing_scheme;

    /**
     * A brief description of the price, hidden from customers.
     */
    @optional
    Nullable!(string) nickname;

    static class CurrencyOption {
      static class Tier {
        @optional
        Nullable!(string) unit_amount_decimal;

        @optional
        Nullable!(int) flat_amount;

        @optional
        Json up_to;

        @optional
        Nullable!(int) unit_amount;

        @optional
        Nullable!(string) flat_amount_decimal;

      }

      @optional
      Tier[] tiers;

      @optional
      Nullable!(string) unit_amount_decimal;

      static class CustomUnitAmount {
        @optional
        Nullable!(bool) enabled;

        @optional
        Nullable!(int) minimum;

        @optional
        Nullable!(int) preset;

        @optional
        Nullable!(int) maximum;

      }

      @optional
      CustomUnitAmount custom_unit_amount;

      @optional
      Nullable!(int) unit_amount;

      @optional
      Nullable!(string) tax_behavior;

    }

    /**
     * Prices defined in each available currency option. Each key must be a three-letter [ISO
     * currency code](https://www.iso.org/iso-4217-currency-codes.html) and a [supported
     * currency](https://stripe.com/docs/currencies).
     */
    @optional
    CurrencyOption[string] currency_options;

    static class InlineProductParams {
      @optional
      Nullable!(string) unit_label;

      @optional
      Nullable!(string) tax_code;

      @optional
      Nullable!(string) statement_descriptor;

      @optional
      Nullable!(string) id;

      @optional
      Nullable!(string)[string] metadata;

      @optional
      Nullable!(string) name;

      @optional
      Nullable!(bool) active;

    }

    /**
     * These fields can be used to create a new product that this price will belong to.
     */
    @optional
    InlineProductParams product_data;

    /**
     * If set to true, will atomically remove the lookup key from the existing price, and assign it
     * to this price.
     */
    @optional
    Nullable!(bool) transfer_lookup_key;

    /**
     * Defines if the tiering price should be `graduated` or `volume` based. In `volume`-based
     * tiering, the maximum quantity within a period determines the per unit price, in `graduated`
     * tiering pricing can successively change as the quantity grows.
     */
    @optional
    Nullable!(string) tiers_mode;

    static class Tier {
      @optional
      Nullable!(string) unit_amount_decimal;

      @optional
      Nullable!(int) flat_amount;

      @optional
      Json up_to;

      @optional
      Nullable!(int) unit_amount;

      @optional
      Nullable!(string) flat_amount_decimal;

    }

    /**
     * Each element represents a pricing tier. This parameter requires `billing_scheme` to be set to
     * `tiered`. See also the documentation for `billing_scheme`.
     */
    @optional
    Tier[] tiers;

  }

  static class PostPricesResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(Price response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponsedefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        handleResponse200(deserializeJson!(Price)(res.readJson()));
        return;
      }
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   */
  void postPrices(
      PostPricesBody requestBody,
      PostPricesResponseHandler responseHandler = null,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/prices");
    Security.apply(requestor);
    requestor.makeRequest(requestBody, responseHandler);
  }

  static class GetPricesPriceParams {
    /**
     * Specifies which fields in the response should be expanded.
     */
    Nullable!(Nullable!(string)[]) expand;

    /**
     */
    Nullable!(Nullable!(string)) price;

  }

  static class GetPricesPriceResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(Price response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponsedefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        handleResponse200(deserializeJson!(Price)(res.readJson()));
        return;
      }
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   */
  void getPricesPrice(
      GetPricesPriceParams params,
      GetPricesPriceResponseHandler responseHandler = null,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.GET,
        Servers.getServerUrl(),
        "/v1/prices/{price}");
    if (!params.expand.isNull)
      requestor.setQueryParam("expand", params.expand.get.to!string);
    if (!params.price.isNull)
      requestor.setPathParam("price", params.price.get.to!string);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class PostPricesPriceParams {
    /**
     */
    Nullable!(Nullable!(string)) price;

  }

  static class PostPricesPriceResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(Price response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponsedefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        handleResponse200(deserializeJson!(Price)(res.readJson()));
        return;
      }
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   */
  void postPricesPrice(
      PostPricesPriceParams params,
      PostPricesPriceResponseHandler responseHandler = null,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/prices/{price}");
    if (!params.price.isNull)
      requestor.setPathParam("price", params.price.get.to!string);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

}

// File automatically generated from OpenAPI spec.
module stripe.service.v1_quotes_service;

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
public import stripe.model.item : Item;
public import stripe.model.quote : Quote;

/**
 * Service to make REST API calls to paths beginning with: /v1/quotes
 */
class V1QuotesService {
  static class GetQuotesParams {
    /**
     * The ID of the customer whose quotes will be retrieved.
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

    /**
     * The status of the quote.
     */
    string status;

    /**
     * Provides a list of quotes that are associated with the specified test clock. The response
     * will not include quotes with test clocks if this and the customer parameter is not set.
     */
    string test_clock;

    mixin AddBuilder!(typeof(this));

  }

  static class GetQuotesResponseHandler : ResponseHandler {

    static class QuotesResourceQuoteList {
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
      Quote[] data;

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
    void delegate(QuotesResourceQuoteList response) handleResponse200;

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
        handleResponse200(deserializeJson!(QuotesResourceQuoteList)(res.readJson()));
        return;
      }
      if (handleResponseDefault is null) throw new Exception("Unhandled response status code default");
      handleResponseDefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

  }

  /**
   * <p>Returns a list of your quotes.</p>
   * See_Also: HTTP GET `/v1/quotes`
   */
  void getQuotes(
      GetQuotesParams params,
      GetQuotesResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.GET,
        Servers.getServerUrl(),
        "/v1/quotes");
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
    if (!params.status.isNull)
      requestor.setQueryParam!("deepObject")("status", params.status);
    if (!params.test_clock.isNull)
      requestor.setQueryParam!("deepObject")("test_clock", params.test_clock);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class PostQuotesBody {
    static class FromQuoteParams {
      @optional
      string quote;

      @optional
      Nullable!(bool) is_revision;

      mixin AddBuilder!(typeof(this));

    }

    /**
     * Clone an existing quote. The new quote will be created in `status=draft`. When using this
     * parameter, you cannot specify any other parameters except for `expires_at`.
     */
    @optional
    FromQuoteParams from_quote;

    /**
     * A future timestamp on which the quote will be canceled if in `open` or `draft` status.
     * Measured in seconds since the Unix epoch. If no value is passed, the default expiration date
     * configured in your [quote template
     * settings](https://dashboard.stripe.com/settings/billing/quote) will be used.
     */
    @optional
    Nullable!(long) expires_at;

    /**
     * Either `charge_automatically`, or `send_invoice`. When charging automatically, Stripe will
     * attempt to pay invoices at the end of the subscription cycle or at invoice finalization using
     * the default payment method attached to the subscription or customer. When sending an invoice,
     * Stripe will email your customer an invoice with payment instructions and mark the
     * subscription as `active`. Defaults to `charge_automatically`.
     */
    @optional
    string collection_method;

    static class QuoteParam {
      @optional
      Nullable!(int) days_until_due;

      mixin AddBuilder!(typeof(this));

    }

    /**
     * All invoices will be billed using the specified settings.
     */
    @optional
    QuoteParam invoice_settings;

    /**
     * The customer for which this quote belongs to. A customer is required before finalizing the
     * quote. Once specified, it cannot be changed.
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
     * The tax rates that will apply to any line item that does not have `tax_rates` set.
     */
    @optional
    Json default_tax_rates;

    /**
     * A non-negative decimal between 0 and 100, with at most two decimal places. This represents
     * the percentage of the subscription invoice subtotal that will be transferred to the
     * application owner's Stripe account. There must be at least 1 line item with a recurring price
     * to use this field.
     */
    @optional
    Json application_fee_percent;

    static class LineItemCreateParams {
      static class PriceData {
        @optional
        string currency;

        @optional
        string unit_amount_decimal;

        static class RecurringAdhoc {
          @optional
          Nullable!(int) interval_count;

          @optional
          string interval;

          mixin AddBuilder!(typeof(this));

        }

        @optional
        RecurringAdhoc recurring;

        @optional
        string product;

        @optional
        string tax_behavior;

        @optional
        Nullable!(int) unit_amount;

        mixin AddBuilder!(typeof(this));

      }

      @optional
      PriceData price_data;

      @optional
      Nullable!(int) quantity;

      @optional
      Json tax_rates;

      @optional
      string price;

      mixin AddBuilder!(typeof(this));

    }

    /**
     * A list of line items the customer is being quoted for. Each line item includes information
     * about the product, the quantity, and the resulting cost.
     */
    @optional
    LineItemCreateParams[] line_items;

    /**
     * Specifies which fields in the response should be expanded.
     */
    @optional
    string[] expand;

    /**
     * A header that will be displayed on the quote PDF. If no value is passed, the default header
     * configured in your [quote template
     * settings](https://dashboard.stripe.com/settings/billing/quote) will be used.
     */
    @optional
    string header;

    /**
     * ID of the test clock to attach to the quote.
     */
    @optional
    string test_clock;

    /**
     * A footer that will be displayed on the quote PDF. If no value is passed, the default footer
     * configured in your [quote template
     * settings](https://dashboard.stripe.com/settings/billing/quote) will be used.
     */
    @optional
    string footer;

    /**
     * The discounts applied to the quote. You can only set up to one discount.
     */
    @optional
    Json discounts;

    /**
     * A description that will be displayed on the quote PDF. If no value is passed, the default
     * description configured in your [quote template
     * settings](https://dashboard.stripe.com/settings/billing/quote) will be used.
     */
    @optional
    string description;

    static class SubscriptionDataCreateParams {
      @optional
      string description;

      @optional
      Json trial_period_days;

      @optional
      Json effective_date;

      mixin AddBuilder!(typeof(this));

    }

    /**
     * When creating a subscription or subscription schedule, the specified configuration data will
     * be used. There must be at least one line item with a recurring price for a subscription or
     * subscription schedule to be created. A subscription schedule is created if
     * `subscription_data[effective_date]` is present and in the future, otherwise a subscription is
     * created.
     */
    @optional
    SubscriptionDataCreateParams subscription_data;

    /**
     * The amount of the application fee (if any) that will be requested to be applied to the
     * payment and transferred to the application owner's Stripe account. There cannot be any line
     * items with recurring prices when using this field.
     */
    @optional
    Json application_fee_amount;

    /**
     * The account on behalf of which to charge.
     */
    @optional
    Json on_behalf_of;

    static class AutomaticTaxParam {
      @optional
      Nullable!(bool) enabled;

      mixin AddBuilder!(typeof(this));

    }

    /**
     * Settings for automatic tax lookup for this quote and resulting invoices and subscriptions.
     */
    @optional
    AutomaticTaxParam automatic_tax;

    /**
     * The data with which to automatically create a Transfer for each of the invoices.
     */
    @optional
    Json transfer_data;

    mixin AddBuilder!(typeof(this));

  }

  static class PostQuotesResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(Quote response) handleResponse200;

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
        handleResponse200(deserializeJson!(Quote)(res.readJson()));
        return;
      }
      if (handleResponseDefault is null) throw new Exception("Unhandled response status code default");
      handleResponseDefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

  }

  /**
   * <p>A quote models prices and services for a customer. Default options for <code>header</code>,
   * <code>description</code>, <code>footer</code>, and <code>expires_at</code> can be set in the
   * dashboard via the <a href="https://dashboard.stripe.com/settings/billing/quote">quote
   * template</a>.</p>
   * See_Also: HTTP POST `/v1/quotes`
   */
  void postQuotes(
      PostQuotesBody requestBody,
      PostQuotesResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/quotes");
    requestor.setHeaderParam("Content-Type", "application/x-www-form-urlencoded");
    Security.apply(requestor);
    requestor.makeRequest(requestBody, responseHandler);
  }

  static class GetQuotesQuotePdfParams {
    /**
     * Specifies which fields in the response should be expanded.
     */
    string[] expand;

    /**
     */
    string quote;

    mixin AddBuilder!(typeof(this));

  }

  static class GetQuotesQuotePdfResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(string response) handleResponse200;

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
        writeln("Unsupported contentType application/pdf.");
      }
      if (handleResponseDefault is null) throw new Exception("Unhandled response status code default");
      handleResponseDefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

  }

  /**
   * <p>Download the PDF for a finalized quote</p>
   * See_Also: HTTP GET `/v1/quotes/{quote}/pdf`
   */
  void getQuotesQuotePdf(
      GetQuotesQuotePdfParams params,
      GetQuotesQuotePdfResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.GET,
        Servers.getServerUrl(),
        "/v1/quotes/{quote}/pdf");
    if (!params.expand.isNull)
      requestor.setQueryParam!("deepObject")("expand", params.expand);
    if (!params.quote.isNull)
      requestor.setPathParam("quote", params.quote);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class PostQuotesQuoteCancelParams {
    /**
     */
    string quote;

    mixin AddBuilder!(typeof(this));

  }

  static class PostQuotesQuoteCancelBody {
    /**
     * Specifies which fields in the response should be expanded.
     */
    @optional
    string[] expand;

    mixin AddBuilder!(typeof(this));

  }

  static class PostQuotesQuoteCancelResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(Quote response) handleResponse200;

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
        handleResponse200(deserializeJson!(Quote)(res.readJson()));
        return;
      }
      if (handleResponseDefault is null) throw new Exception("Unhandled response status code default");
      handleResponseDefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

  }

  /**
   * <p>Cancels the quote.</p>
   * See_Also: HTTP POST `/v1/quotes/{quote}/cancel`
   */
  void postQuotesQuoteCancel(
      PostQuotesQuoteCancelParams params,
      PostQuotesQuoteCancelBody requestBody,
      PostQuotesQuoteCancelResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/quotes/{quote}/cancel");
    if (!params.quote.isNull)
      requestor.setPathParam("quote", params.quote);
    requestor.setHeaderParam("Content-Type", "application/x-www-form-urlencoded");
    Security.apply(requestor);
    requestor.makeRequest(requestBody, responseHandler);
  }

  static class GetQuotesQuoteLineItemsParams {
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
     */
    string quote;

    /**
     * A cursor for use in pagination. `starting_after` is an object ID that defines your place in
     * the list. For instance, if you make a list request and receive 100 objects, ending with
     * `obj_foo`, your subsequent call can include `starting_after=obj_foo` in order to fetch the
     * next page of the list.
     */
    string starting_after;

    mixin AddBuilder!(typeof(this));

  }

  static class GetQuotesQuoteLineItemsResponseHandler : ResponseHandler {

    static class QuotesResourceListLineItems {
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
      Item[] data;

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
    void delegate(QuotesResourceListLineItems response) handleResponse200;

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
        handleResponse200(deserializeJson!(QuotesResourceListLineItems)(res.readJson()));
        return;
      }
      if (handleResponseDefault is null) throw new Exception("Unhandled response status code default");
      handleResponseDefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

  }

  /**
   * <p>When retrieving a quote, there is an includable <strong>line_items</strong> property
   * containing the first handful of those items. There is also a URL where you can retrieve the
   * full (paginated) list of line items.</p>
   * See_Also: HTTP GET `/v1/quotes/{quote}/line_items`
   */
  void getQuotesQuoteLineItems(
      GetQuotesQuoteLineItemsParams params,
      GetQuotesQuoteLineItemsResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.GET,
        Servers.getServerUrl(),
        "/v1/quotes/{quote}/line_items");
    if (!params.ending_before.isNull)
      requestor.setQueryParam!("deepObject")("ending_before", params.ending_before);
    if (!params.expand.isNull)
      requestor.setQueryParam!("deepObject")("expand", params.expand);
    if (!params.limit.isNull)
      requestor.setQueryParam!("deepObject")("limit", params.limit);
    if (!params.quote.isNull)
      requestor.setPathParam("quote", params.quote);
    if (!params.starting_after.isNull)
      requestor.setQueryParam!("deepObject")("starting_after", params.starting_after);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class GetQuotesQuoteComputedUpfrontLineItemsParams {
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
     */
    string quote;

    /**
     * A cursor for use in pagination. `starting_after` is an object ID that defines your place in
     * the list. For instance, if you make a list request and receive 100 objects, ending with
     * `obj_foo`, your subsequent call can include `starting_after=obj_foo` in order to fetch the
     * next page of the list.
     */
    string starting_after;

    mixin AddBuilder!(typeof(this));

  }

  static class GetQuotesQuoteComputedUpfrontLineItemsResponseHandler : ResponseHandler {

    static class QuotesResourceListLineItems {
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
      Item[] data;

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
    void delegate(QuotesResourceListLineItems response) handleResponse200;

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
        handleResponse200(deserializeJson!(QuotesResourceListLineItems)(res.readJson()));
        return;
      }
      if (handleResponseDefault is null) throw new Exception("Unhandled response status code default");
      handleResponseDefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

  }

  /**
   * <p>When retrieving a quote, there is an includable <a
   * href="https://stripe.com/docs/api/quotes/object#quote_object-computed-upfront-line_items"><stro
   * ng>computed.upfront.line_items</strong></a> property containing the first handful of those
   * items. There is also a URL where you can retrieve the full (paginated) list of upfront line
   * items.</p>
   * See_Also: HTTP GET `/v1/quotes/{quote}/computed_upfront_line_items`
   */
  void getQuotesQuoteComputedUpfrontLineItems(
      GetQuotesQuoteComputedUpfrontLineItemsParams params,
      GetQuotesQuoteComputedUpfrontLineItemsResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.GET,
        Servers.getServerUrl(),
        "/v1/quotes/{quote}/computed_upfront_line_items");
    if (!params.ending_before.isNull)
      requestor.setQueryParam!("deepObject")("ending_before", params.ending_before);
    if (!params.expand.isNull)
      requestor.setQueryParam!("deepObject")("expand", params.expand);
    if (!params.limit.isNull)
      requestor.setQueryParam!("deepObject")("limit", params.limit);
    if (!params.quote.isNull)
      requestor.setPathParam("quote", params.quote);
    if (!params.starting_after.isNull)
      requestor.setQueryParam!("deepObject")("starting_after", params.starting_after);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class GetQuotesQuoteParams {
    /**
     * Specifies which fields in the response should be expanded.
     */
    string[] expand;

    /**
     */
    string quote;

    mixin AddBuilder!(typeof(this));

  }

  static class GetQuotesQuoteResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(Quote response) handleResponse200;

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
        handleResponse200(deserializeJson!(Quote)(res.readJson()));
        return;
      }
      if (handleResponseDefault is null) throw new Exception("Unhandled response status code default");
      handleResponseDefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

  }

  /**
   * <p>Retrieves the quote with the given ID.</p>
   * See_Also: HTTP GET `/v1/quotes/{quote}`
   */
  void getQuotesQuote(
      GetQuotesQuoteParams params,
      GetQuotesQuoteResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.GET,
        Servers.getServerUrl(),
        "/v1/quotes/{quote}");
    if (!params.expand.isNull)
      requestor.setQueryParam!("deepObject")("expand", params.expand);
    if (!params.quote.isNull)
      requestor.setPathParam("quote", params.quote);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class PostQuotesQuoteParams {
    /**
     */
    string quote;

    mixin AddBuilder!(typeof(this));

  }

  static class PostQuotesQuoteBody {
    /**
     * A future timestamp on which the quote will be canceled if in `open` or `draft` status.
     * Measured in seconds since the Unix epoch.
     */
    @optional
    Nullable!(long) expires_at;

    /**
     * Either `charge_automatically`, or `send_invoice`. When charging automatically, Stripe will
     * attempt to pay invoices at the end of the subscription cycle or at invoice finalization using
     * the default payment method attached to the subscription or customer. When sending an invoice,
     * Stripe will email your customer an invoice with payment instructions and mark the
     * subscription as `active`. Defaults to `charge_automatically`.
     */
    @optional
    string collection_method;

    static class QuoteParam {
      @optional
      Nullable!(int) days_until_due;

      mixin AddBuilder!(typeof(this));

    }

    /**
     * All invoices will be billed using the specified settings.
     */
    @optional
    QuoteParam invoice_settings;

    /**
     * The customer for which this quote belongs to. A customer is required before finalizing the
     * quote. Once specified, it cannot be changed.
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
     * The tax rates that will apply to any line item that does not have `tax_rates` set.
     */
    @optional
    Json default_tax_rates;

    /**
     * A non-negative decimal between 0 and 100, with at most two decimal places. This represents
     * the percentage of the subscription invoice subtotal that will be transferred to the
     * application owner's Stripe account. There must be at least 1 line item with a recurring price
     * to use this field.
     */
    @optional
    Json application_fee_percent;

    static class LineItemUpdateParams {
      static class PriceData {
        @optional
        string currency;

        @optional
        string unit_amount_decimal;

        static class RecurringAdhoc {
          @optional
          Nullable!(int) interval_count;

          @optional
          string interval;

          mixin AddBuilder!(typeof(this));

        }

        @optional
        RecurringAdhoc recurring;

        @optional
        string product;

        @optional
        string tax_behavior;

        @optional
        Nullable!(int) unit_amount;

        mixin AddBuilder!(typeof(this));

      }

      @optional
      PriceData price_data;

      @optional
      Nullable!(int) quantity;

      @optional
      string id;

      @optional
      string price;

      @optional
      Json tax_rates;

      mixin AddBuilder!(typeof(this));

    }

    /**
     * A list of line items the customer is being quoted for. Each line item includes information
     * about the product, the quantity, and the resulting cost.
     */
    @optional
    LineItemUpdateParams[] line_items;

    /**
     * Specifies which fields in the response should be expanded.
     */
    @optional
    string[] expand;

    /**
     * A header that will be displayed on the quote PDF.
     */
    @optional
    string header;

    /**
     * A footer that will be displayed on the quote PDF.
     */
    @optional
    string footer;

    /**
     * The discounts applied to the quote. You can only set up to one discount.
     */
    @optional
    Json discounts;

    /**
     * A description that will be displayed on the quote PDF.
     */
    @optional
    string description;

    static class SubscriptionDataUpdateParams {
      @optional
      string description;

      @optional
      Json trial_period_days;

      @optional
      Json effective_date;

      mixin AddBuilder!(typeof(this));

    }

    /**
     * When creating a subscription or subscription schedule, the specified configuration data will
     * be used. There must be at least one line item with a recurring price for a subscription or
     * subscription schedule to be created. A subscription schedule is created if
     * `subscription_data[effective_date]` is present and in the future, otherwise a subscription is
     * created.
     */
    @optional
    SubscriptionDataUpdateParams subscription_data;

    /**
     * The amount of the application fee (if any) that will be requested to be applied to the
     * payment and transferred to the application owner's Stripe account. There cannot be any line
     * items with recurring prices when using this field.
     */
    @optional
    Json application_fee_amount;

    /**
     * The account on behalf of which to charge.
     */
    @optional
    Json on_behalf_of;

    static class AutomaticTaxParam {
      @optional
      Nullable!(bool) enabled;

      mixin AddBuilder!(typeof(this));

    }

    /**
     * Settings for automatic tax lookup for this quote and resulting invoices and subscriptions.
     */
    @optional
    AutomaticTaxParam automatic_tax;

    /**
     * The data with which to automatically create a Transfer for each of the invoices.
     */
    @optional
    Json transfer_data;

    mixin AddBuilder!(typeof(this));

  }

  static class PostQuotesQuoteResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(Quote response) handleResponse200;

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
        handleResponse200(deserializeJson!(Quote)(res.readJson()));
        return;
      }
      if (handleResponseDefault is null) throw new Exception("Unhandled response status code default");
      handleResponseDefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

  }

  /**
   * <p>A quote models prices and services for a customer.</p>
   * See_Also: HTTP POST `/v1/quotes/{quote}`
   */
  void postQuotesQuote(
      PostQuotesQuoteParams params,
      PostQuotesQuoteBody requestBody,
      PostQuotesQuoteResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/quotes/{quote}");
    if (!params.quote.isNull)
      requestor.setPathParam("quote", params.quote);
    requestor.setHeaderParam("Content-Type", "application/x-www-form-urlencoded");
    Security.apply(requestor);
    requestor.makeRequest(requestBody, responseHandler);
  }

  static class PostQuotesQuoteAcceptParams {
    /**
     */
    string quote;

    mixin AddBuilder!(typeof(this));

  }

  static class PostQuotesQuoteAcceptBody {
    /**
     * Specifies which fields in the response should be expanded.
     */
    @optional
    string[] expand;

    mixin AddBuilder!(typeof(this));

  }

  static class PostQuotesQuoteAcceptResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(Quote response) handleResponse200;

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
        handleResponse200(deserializeJson!(Quote)(res.readJson()));
        return;
      }
      if (handleResponseDefault is null) throw new Exception("Unhandled response status code default");
      handleResponseDefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

  }

  /**
   * <p>Accepts the specified quote.</p>
   * See_Also: HTTP POST `/v1/quotes/{quote}/accept`
   */
  void postQuotesQuoteAccept(
      PostQuotesQuoteAcceptParams params,
      PostQuotesQuoteAcceptBody requestBody,
      PostQuotesQuoteAcceptResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/quotes/{quote}/accept");
    if (!params.quote.isNull)
      requestor.setPathParam("quote", params.quote);
    requestor.setHeaderParam("Content-Type", "application/x-www-form-urlencoded");
    Security.apply(requestor);
    requestor.makeRequest(requestBody, responseHandler);
  }

  static class PostQuotesQuoteFinalizeParams {
    /**
     */
    string quote;

    mixin AddBuilder!(typeof(this));

  }

  static class PostQuotesQuoteFinalizeBody {
    /**
     * Specifies which fields in the response should be expanded.
     */
    @optional
    string[] expand;

    /**
     * A future timestamp on which the quote will be canceled if in `open` or `draft` status.
     * Measured in seconds since the Unix epoch.
     */
    @optional
    Nullable!(long) expires_at;

    mixin AddBuilder!(typeof(this));

  }

  static class PostQuotesQuoteFinalizeResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(Quote response) handleResponse200;

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
        handleResponse200(deserializeJson!(Quote)(res.readJson()));
        return;
      }
      if (handleResponseDefault is null) throw new Exception("Unhandled response status code default");
      handleResponseDefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

  }

  /**
   * <p>Finalizes the quote.</p>
   * See_Also: HTTP POST `/v1/quotes/{quote}/finalize`
   */
  void postQuotesQuoteFinalize(
      PostQuotesQuoteFinalizeParams params,
      PostQuotesQuoteFinalizeBody requestBody,
      PostQuotesQuoteFinalizeResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/quotes/{quote}/finalize");
    if (!params.quote.isNull)
      requestor.setPathParam("quote", params.quote);
    requestor.setHeaderParam("Content-Type", "application/x-www-form-urlencoded");
    Security.apply(requestor);
    requestor.makeRequest(requestBody, responseHandler);
  }

  mixin AddBuilder!(typeof(this));

}

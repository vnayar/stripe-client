// File automatically generated from OpenAPI spec.
module stripe.service.v1_invoiceitems_service;

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

public import stripe.model.deleted_invoiceitem : DeletedInvoiceitem;
public import stripe.model.error : Error_;
public import stripe.model.invoiceitem : Invoiceitem;

/**
 * Service to make REST API calls to paths beginning with: /v1/invoiceitems
 */
class V1InvoiceitemsService {
  static class GetInvoiceitemsParams {
    /**
     */
    Json created;

    /**
     * The identifier of the customer whose invoice items to return. If none is provided, all
     * invoice items will be returned.
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
     * Only return invoice items belonging to this invoice. If none is provided, all invoice items
     * will be returned. If specifying an invoice, no customer identifier is needed.
     */
    string invoice;

    /**
     * A limit on the number of objects to be returned. Limit can range between 1 and 100, and the
     * default is 10.
     */
    Nullable!(int) limit;

    /**
     * Set to `true` to only show pending invoice items, which are not yet attached to any invoices.
     * Set to `false` to only show invoice items already attached to invoices. If unspecified, no
     * filter is applied.
     */
    Nullable!(bool) pending;

    /**
     * A cursor for use in pagination. `starting_after` is an object ID that defines your place in
     * the list. For instance, if you make a list request and receive 100 objects, ending with
     * `obj_foo`, your subsequent call can include `starting_after=obj_foo` in order to fetch the
     * next page of the list.
     */
    string starting_after;

    mixin AddBuilder!(typeof(this));

  }

  static class GetInvoiceitemsResponseHandler : ResponseHandler {

    static class InvoicesItemsList {
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
      Invoiceitem[] data;

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
    void delegate(InvoicesItemsList response) handleResponse200;

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
        handleResponse200(deserializeJson!(InvoicesItemsList)(res.readJson()));
        return;
      }
      if (handleResponseDefault is null) throw new Exception("Unhandled response status code default");
      handleResponseDefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

  }

  /**
   * <p>Returns a list of your invoice items. Invoice items are returned sorted by creation date,
   * with the most recently created invoice items appearing first.</p>
   * See_Also: HTTP GET `/v1/invoiceitems`
   */
  void getInvoiceitems(
      GetInvoiceitemsParams params,
      GetInvoiceitemsResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.GET,
        Servers.getServerUrl(),
        "/v1/invoiceitems");
    if (!params.created.isNull)
      requestor.setQueryParam!("deepObject")("created", params.created);
    if (!params.customer.isNull)
      requestor.setQueryParam!("deepObject")("customer", params.customer);
    if (!params.ending_before.isNull)
      requestor.setQueryParam!("deepObject")("ending_before", params.ending_before);
    if (!params.expand.isNull)
      requestor.setQueryParam!("deepObject")("expand", params.expand);
    if (!params.invoice.isNull)
      requestor.setQueryParam!("deepObject")("invoice", params.invoice);
    if (!params.limit.isNull)
      requestor.setQueryParam!("deepObject")("limit", params.limit);
    if (!params.pending.isNull)
      requestor.setQueryParam!("deepObject")("pending", params.pending);
    if (!params.starting_after.isNull)
      requestor.setQueryParam!("deepObject")("starting_after", params.starting_after);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class PostInvoiceitemsBody {
    /**
     * A [tax code](https://stripe.com/docs/tax/tax-categories) ID.
     */
    @optional
    Json tax_code;

    /**
     * The integer amount in cents (or local equivalent) of the charge to be applied to the upcoming
     * invoice. Passing in a negative `amount` will reduce the `amount_due` on the invoice.
     */
    @optional
    Nullable!(int) amount;

    /**
     * The ID of an existing invoice to add this invoice item to. When left blank, the invoice item
     * will be added to the next upcoming scheduled invoice. This is useful when adding invoice
     * items in response to an invoice.created webhook. You can only add invoice items to draft
     * invoices and there is a maximum of 250 items per invoice.
     */
    @optional
    string invoice;

    static class Period {
      @optional
      Nullable!(long) end;

      @optional
      Nullable!(long) start;

      mixin AddBuilder!(typeof(this));

    }

    /**
     * The period associated with this invoice item. When set to different values, the period will
     * be rendered on the invoice. If you have [Stripe Revenue
     * Recognition](https://stripe.com/docs/revenue-recognition) enabled, the period will be used to
     * recognize and defer revenue. See the [Revenue Recognition
     * documentation](https://stripe.com/docs/revenue-recognition/methodology/subscriptions-and-invo
     * icing) for details.
     */
    @optional
    Period period;

    /**
     * The ID of a subscription to add this invoice item to. When left blank, the invoice item will
     * be be added to the next upcoming scheduled invoice. When set, scheduled invoices for
     * subscriptions other than the specified subscription will ignore the invoice item. Use this
     * when you want to express that an invoice item has been accrued within the context of a
     * particular subscription.
     */
    @optional
    string subscription;

    /**
     * The integer unit amount in cents (or local equivalent) of the charge to be applied to the
     * upcoming invoice. This `unit_amount` will be multiplied by the quantity to get the full
     * amount. Passing in a negative `unit_amount` will reduce the `amount_due` on the invoice.
     */
    @optional
    Nullable!(int) unit_amount;

    /**
     * The ID of the customer who will be billed when this invoice item is billed.
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

    /**
     * Non-negative integer. The quantity of units for the invoice item.
     */
    @optional
    Nullable!(int) quantity;

    static class OneTimePriceData {
      @optional
      string currency;

      @optional
      string unit_amount_decimal;

      @optional
      string product;

      @optional
      string tax_behavior;

      @optional
      Nullable!(int) unit_amount;

      mixin AddBuilder!(typeof(this));

    }

    /**
     * Data used to generate a new [Price](https://stripe.com/docs/api/prices) object inline.
     */
    @optional
    OneTimePriceData price_data;

    /**
     * Specifies which fields in the response should be expanded.
     */
    @optional
    string[] expand;

    /**
     * Same as `unit_amount`, but accepts a decimal value in cents (or local equivalent) with at
     * most 12 decimal places. Only one of `unit_amount` and `unit_amount_decimal` can be set.
     */
    @optional
    string unit_amount_decimal;

    /**
     * Specifies whether the price is considered inclusive of taxes or exclusive of taxes. One of
     * `inclusive`, `exclusive`, or `unspecified`. Once specified as either `inclusive` or
     * `exclusive`, it cannot be changed.
     */
    @optional
    string tax_behavior;

    /**
     * The coupons to redeem into discounts for the invoice item or invoice line item.
     */
    @optional
    Json discounts;

    /**
     * An arbitrary string which you can attach to the invoice item. The description is displayed in
     * the invoice for easy tracking.
     */
    @optional
    string description;

    /**
     * Controls whether discounts apply to this invoice item. Defaults to false for prorations or
     * negative invoice items, and true for all other invoice items.
     */
    @optional
    Nullable!(bool) discountable;

    /**
     * The tax rates which apply to the invoice item. When set, the `default_tax_rates` on the
     * invoice do not apply to this invoice item.
     */
    @optional
    string[] tax_rates;

    /**
     * The ID of the price object.
     */
    @optional
    string price;

    mixin AddBuilder!(typeof(this));

  }

  static class PostInvoiceitemsResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(Invoiceitem response) handleResponse200;

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
        handleResponse200(deserializeJson!(Invoiceitem)(res.readJson()));
        return;
      }
      if (handleResponseDefault is null) throw new Exception("Unhandled response status code default");
      handleResponseDefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

  }

  /**
   * <p>Creates an item to be added to a draft invoice (up to 250 items per invoice). If no invoice
   * is specified, the item will be on the next invoice created for the customer specified.</p>
   * See_Also: HTTP POST `/v1/invoiceitems`
   */
  void postInvoiceitems(
      PostInvoiceitemsBody requestBody,
      PostInvoiceitemsResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/invoiceitems");
    requestor.setHeaderParam("Content-Type", "application/x-www-form-urlencoded");
    Security.apply(requestor);
    requestor.makeRequest(requestBody, responseHandler);
  }

  static class GetInvoiceitemsInvoiceitemParams {
    /**
     * Specifies which fields in the response should be expanded.
     */
    string[] expand;

    /**
     */
    string invoiceitem;

    mixin AddBuilder!(typeof(this));

  }

  static class GetInvoiceitemsInvoiceitemResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(Invoiceitem response) handleResponse200;

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
        handleResponse200(deserializeJson!(Invoiceitem)(res.readJson()));
        return;
      }
      if (handleResponseDefault is null) throw new Exception("Unhandled response status code default");
      handleResponseDefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

  }

  /**
   * <p>Retrieves the invoice item with the given ID.</p>
   * See_Also: HTTP GET `/v1/invoiceitems/{invoiceitem}`
   */
  void getInvoiceitemsInvoiceitem(
      GetInvoiceitemsInvoiceitemParams params,
      GetInvoiceitemsInvoiceitemResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.GET,
        Servers.getServerUrl(),
        "/v1/invoiceitems/{invoiceitem}");
    if (!params.expand.isNull)
      requestor.setQueryParam!("deepObject")("expand", params.expand);
    if (!params.invoiceitem.isNull)
      requestor.setPathParam("invoiceitem", params.invoiceitem);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class PostInvoiceitemsInvoiceitemParams {
    /**
     */
    string invoiceitem;

    mixin AddBuilder!(typeof(this));

  }

  static class PostInvoiceitemsInvoiceitemBody {
    /**
     * A [tax code](https://stripe.com/docs/tax/tax-categories) ID.
     */
    @optional
    Json tax_code;

    /**
     * The integer amount in cents (or local equivalent) of the charge to be applied to the upcoming
     * invoice. If you want to apply a credit to the customer's account, pass a negative amount.
     */
    @optional
    Nullable!(int) amount;

    static class Period {
      @optional
      Nullable!(long) end;

      @optional
      Nullable!(long) start;

      mixin AddBuilder!(typeof(this));

    }

    /**
     * The period associated with this invoice item. When set to different values, the period will
     * be rendered on the invoice. If you have [Stripe Revenue
     * Recognition](https://stripe.com/docs/revenue-recognition) enabled, the period will be used to
     * recognize and defer revenue. See the [Revenue Recognition
     * documentation](https://stripe.com/docs/revenue-recognition/methodology/subscriptions-and-invo
     * icing) for details.
     */
    @optional
    Period period;

    /**
     * The integer unit amount in cents (or local equivalent) of the charge to be applied to the
     * upcoming invoice. This unit_amount will be multiplied by the quantity to get the full amount.
     * If you want to apply a credit to the customer's account, pass a negative unit_amount.
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
    Json metadata;

    /**
     * Non-negative integer. The quantity of units for the invoice item.
     */
    @optional
    Nullable!(int) quantity;

    static class OneTimePriceData {
      @optional
      string currency;

      @optional
      string unit_amount_decimal;

      @optional
      string product;

      @optional
      string tax_behavior;

      @optional
      Nullable!(int) unit_amount;

      mixin AddBuilder!(typeof(this));

    }

    /**
     * Data used to generate a new [Price](https://stripe.com/docs/api/prices) object inline.
     */
    @optional
    OneTimePriceData price_data;

    /**
     * Specifies which fields in the response should be expanded.
     */
    @optional
    string[] expand;

    /**
     * Same as `unit_amount`, but accepts a decimal value in cents (or local equivalent) with at
     * most 12 decimal places. Only one of `unit_amount` and `unit_amount_decimal` can be set.
     */
    @optional
    string unit_amount_decimal;

    /**
     * Specifies whether the price is considered inclusive of taxes or exclusive of taxes. One of
     * `inclusive`, `exclusive`, or `unspecified`. Once specified as either `inclusive` or
     * `exclusive`, it cannot be changed.
     */
    @optional
    string tax_behavior;

    /**
     * The coupons & existing discounts which apply to the invoice item or invoice line item. Item
     * discounts are applied before invoice discounts. Pass an empty string to remove
     * previously-defined discounts.
     */
    @optional
    Json discounts;

    /**
     * An arbitrary string which you can attach to the invoice item. The description is displayed in
     * the invoice for easy tracking.
     */
    @optional
    string description;

    /**
     * Controls whether discounts apply to this invoice item. Defaults to false for prorations or
     * negative invoice items, and true for all other invoice items. Cannot be set to true for
     * prorations.
     */
    @optional
    Nullable!(bool) discountable;

    /**
     * The tax rates which apply to the invoice item. When set, the `default_tax_rates` on the
     * invoice do not apply to this invoice item. Pass an empty string to remove previously-defined
     * tax rates.
     */
    @optional
    Json tax_rates;

    /**
     * The ID of the price object.
     */
    @optional
    string price;

    mixin AddBuilder!(typeof(this));

  }

  static class PostInvoiceitemsInvoiceitemResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(Invoiceitem response) handleResponse200;

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
        handleResponse200(deserializeJson!(Invoiceitem)(res.readJson()));
        return;
      }
      if (handleResponseDefault is null) throw new Exception("Unhandled response status code default");
      handleResponseDefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

  }

  /**
   * <p>Updates the amount or description of an invoice item on an upcoming invoice. Updating an
   * invoice item is only possible before the invoice it’s attached to is closed.</p>
   * See_Also: HTTP POST `/v1/invoiceitems/{invoiceitem}`
   */
  void postInvoiceitemsInvoiceitem(
      PostInvoiceitemsInvoiceitemParams params,
      PostInvoiceitemsInvoiceitemBody requestBody,
      PostInvoiceitemsInvoiceitemResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/invoiceitems/{invoiceitem}");
    if (!params.invoiceitem.isNull)
      requestor.setPathParam("invoiceitem", params.invoiceitem);
    requestor.setHeaderParam("Content-Type", "application/x-www-form-urlencoded");
    Security.apply(requestor);
    requestor.makeRequest(requestBody, responseHandler);
  }

  static class DeleteInvoiceitemsInvoiceitemParams {
    /**
     */
    string invoiceitem;

    mixin AddBuilder!(typeof(this));

  }

  static class DeleteInvoiceitemsInvoiceitemResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(DeletedInvoiceitem response) handleResponse200;

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
        handleResponse200(deserializeJson!(DeletedInvoiceitem)(res.readJson()));
        return;
      }
      if (handleResponseDefault is null) throw new Exception("Unhandled response status code default");
      handleResponseDefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

  }

  /**
   * <p>Deletes an invoice item, removing it from an invoice. Deleting invoice items is only
   * possible when they’re not attached to invoices, or if it’s attached to a draft invoice.</p>
   * See_Also: HTTP DELETE `/v1/invoiceitems/{invoiceitem}`
   */
  void deleteInvoiceitemsInvoiceitem(
      DeleteInvoiceitemsInvoiceitemParams params,
      DeleteInvoiceitemsInvoiceitemResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.DELETE,
        Servers.getServerUrl(),
        "/v1/invoiceitems/{invoiceitem}");
    if (!params.invoiceitem.isNull)
      requestor.setPathParam("invoiceitem", params.invoiceitem);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  mixin AddBuilder!(typeof(this));

}

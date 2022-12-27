// File automatically generated from OpenAPI spec.
module stripe.service.v1_invoiceitems_service;

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
    Nullable!(Json) created;

    /**
     * The identifier of the customer whose invoice items to return. If none is provided, all
     * invoice items will be returned.
     */
    Nullable!(Nullable!(string)) customer;

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
     * Only return invoice items belonging to this invoice. If none is provided, all invoice items
     * will be returned. If specifying an invoice, no customer identifier is needed.
     */
    Nullable!(Nullable!(string)) invoice;

    /**
     * A limit on the number of objects to be returned. Limit can range between 1 and 100, and the
     * default is 10.
     */
    Nullable!(Nullable!(int)) limit;

    /**
     * Set to `true` to only show pending invoice items, which are not yet attached to any invoices.
     * Set to `false` to only show invoice items already attached to invoices. If unspecified, no
     * filter is applied.
     */
    Nullable!(Nullable!(bool)) pending;

    /**
     * A cursor for use in pagination. `starting_after` is an object ID that defines your place in
     * the list. For instance, if you make a list request and receive 100 objects, ending with
     * `obj_foo`, your subsequent call can include `starting_after=obj_foo` in order to fetch the
     * next page of the list.
     */
    Nullable!(Nullable!(string)) starting_after;

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
      Nullable!(string) object;

      @optional
      Invoiceitem[] data;

      /**
       * The URL where this list can be accessed.
       */
      @optional
      Nullable!(string) url;

    }

    /**
     * Successful response.
     */
    void delegate(InvoicesItemsList response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponsedefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        handleResponse200(deserializeJson!(InvoicesItemsList)(res.readJson()));
        return;
      }
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   */
  void getInvoiceitems(
      GetInvoiceitemsParams params,
      GetInvoiceitemsResponseHandler responseHandler = null,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.GET,
        Servers.getServerUrl(),
        "/v1/invoiceitems");
    if (!params.created.isNull)
      requestor.setQueryParam("created", params.created.get.to!string);
    if (!params.customer.isNull)
      requestor.setQueryParam("customer", params.customer.get.to!string);
    if (!params.ending_before.isNull)
      requestor.setQueryParam("ending_before", params.ending_before.get.to!string);
    if (!params.expand.isNull)
      requestor.setQueryParam("expand", params.expand.get.to!string);
    if (!params.invoice.isNull)
      requestor.setQueryParam("invoice", params.invoice.get.to!string);
    if (!params.limit.isNull)
      requestor.setQueryParam("limit", params.limit.get.to!string);
    if (!params.pending.isNull)
      requestor.setQueryParam("pending", params.pending.get.to!string);
    if (!params.starting_after.isNull)
      requestor.setQueryParam("starting_after", params.starting_after.get.to!string);
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
    Nullable!(string) invoice;

    static class Period {
      @optional
      Nullable!(long) end;

      @optional
      Nullable!(long) start;

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
    Nullable!(string) subscription;

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
    Nullable!(string) customer;

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
    Nullable!(string) currency;

    /**
     * Non-negative integer. The quantity of units for the invoice item.
     */
    @optional
    Nullable!(int) quantity;

    static class OneTimePriceData {
      @optional
      Nullable!(string) currency;

      @optional
      Nullable!(string) unit_amount_decimal;

      @optional
      Nullable!(string) product;

      @optional
      Nullable!(string) tax_behavior;

      @optional
      Nullable!(int) unit_amount;

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
    Nullable!(string)[] expand;

    /**
     * Same as `unit_amount`, but accepts a decimal value in cents (or local equivalent) with at
     * most 12 decimal places. Only one of `unit_amount` and `unit_amount_decimal` can be set.
     */
    @optional
    Nullable!(string) unit_amount_decimal;

    /**
     * Specifies whether the price is considered inclusive of taxes or exclusive of taxes. One of
     * `inclusive`, `exclusive`, or `unspecified`. Once specified as either `inclusive` or
     * `exclusive`, it cannot be changed.
     */
    @optional
    Nullable!(string) tax_behavior;

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
    Nullable!(string) description;

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
    Nullable!(string)[] tax_rates;

    /**
     * The ID of the price object.
     */
    @optional
    Nullable!(string) price;

  }

  static class PostInvoiceitemsResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(Invoiceitem response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponsedefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        handleResponse200(deserializeJson!(Invoiceitem)(res.readJson()));
        return;
      }
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   */
  void postInvoiceitems(
      PostInvoiceitemsBody requestBody,
      PostInvoiceitemsResponseHandler responseHandler = null,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/invoiceitems");
    Security.apply(requestor);
    requestor.makeRequest(requestBody, responseHandler);
  }

  static class GetInvoiceitemsInvoiceitemParams {
    /**
     * Specifies which fields in the response should be expanded.
     */
    Nullable!(Nullable!(string)[]) expand;

    /**
     */
    Nullable!(Nullable!(string)) invoiceitem;

  }

  static class GetInvoiceitemsInvoiceitemResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(Invoiceitem response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponsedefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        handleResponse200(deserializeJson!(Invoiceitem)(res.readJson()));
        return;
      }
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   */
  void getInvoiceitemsInvoiceitem(
      GetInvoiceitemsInvoiceitemParams params,
      GetInvoiceitemsInvoiceitemResponseHandler responseHandler = null,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.GET,
        Servers.getServerUrl(),
        "/v1/invoiceitems/{invoiceitem}");
    if (!params.expand.isNull)
      requestor.setQueryParam("expand", params.expand.get.to!string);
    if (!params.invoiceitem.isNull)
      requestor.setPathParam("invoiceitem", params.invoiceitem.get.to!string);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class PostInvoiceitemsInvoiceitemParams {
    /**
     */
    Nullable!(Nullable!(string)) invoiceitem;

  }

  static class PostInvoiceitemsInvoiceitemResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(Invoiceitem response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponsedefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        handleResponse200(deserializeJson!(Invoiceitem)(res.readJson()));
        return;
      }
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   */
  void postInvoiceitemsInvoiceitem(
      PostInvoiceitemsInvoiceitemParams params,
      PostInvoiceitemsInvoiceitemResponseHandler responseHandler = null,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/invoiceitems/{invoiceitem}");
    if (!params.invoiceitem.isNull)
      requestor.setPathParam("invoiceitem", params.invoiceitem.get.to!string);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class DeleteInvoiceitemsInvoiceitemParams {
    /**
     */
    Nullable!(Nullable!(string)) invoiceitem;

  }

  static class DeleteInvoiceitemsInvoiceitemResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(DeletedInvoiceitem response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponsedefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        handleResponse200(deserializeJson!(DeletedInvoiceitem)(res.readJson()));
        return;
      }
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   */
  void deleteInvoiceitemsInvoiceitem(
      DeleteInvoiceitemsInvoiceitemParams params,
      DeleteInvoiceitemsInvoiceitemResponseHandler responseHandler = null,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.DELETE,
        Servers.getServerUrl(),
        "/v1/invoiceitems/{invoiceitem}");
    if (!params.invoiceitem.isNull)
      requestor.setPathParam("invoiceitem", params.invoiceitem.get.to!string);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

}
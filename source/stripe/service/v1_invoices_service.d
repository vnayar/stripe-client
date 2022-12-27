// File automatically generated from OpenAPI spec.
module stripe.service.v1_invoices_service;

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

public import stripe.model.deleted_invoice : DeletedInvoice;
public import stripe.model.error : Error_;
public import stripe.model.invoice : Invoice;
public import stripe.model.line_item : LineItem;
/**
 * Service to make REST API calls to paths beginning with: /v1/invoices
 */
class V1InvoicesService {
  static class GetInvoicesParams {
    /**
     * The collection method of the invoice to retrieve. Either `charge_automatically` or
     * `send_invoice`.
     */
    Nullable!(Nullable!(string)) collection_method;

    /**
     */
    Nullable!(Json) created;

    /**
     * Only return invoices for the customer specified by this customer ID.
     */
    Nullable!(Nullable!(string)) customer;

    /**
     */
    Nullable!(Json) due_date;

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
     * A cursor for use in pagination. `starting_after` is an object ID that defines your place in
     * the list. For instance, if you make a list request and receive 100 objects, ending with
     * `obj_foo`, your subsequent call can include `starting_after=obj_foo` in order to fetch the
     * next page of the list.
     */
    Nullable!(Nullable!(string)) starting_after;

    /**
     * The status of the invoice, one of `draft`, `open`, `paid`, `uncollectible`, or `void`. [Learn
     * more](https://stripe.com/docs/billing/invoices/workflow#workflow-overview)
     */
    Nullable!(Nullable!(string)) status;

    /**
     * Only return invoices for the subscription specified by this subscription ID.
     */
    Nullable!(Nullable!(string)) subscription;

  }

  static class GetInvoicesResponseHandler : ResponseHandler {

    static class InvoicesList {
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
      Invoice[] data;

      /**
       * The URL where this list can be accessed.
       */
      @optional
      Nullable!(string) url;

    }

    /**
     * Successful response.
     */
    void delegate(InvoicesList response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponsedefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        handleResponse200(deserializeJson!(InvoicesList)(res.readJson()));
        return;
      }
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   */
  void getInvoices(
      GetInvoicesParams params,
      GetInvoicesResponseHandler responseHandler = null,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.GET,
        Servers.getServerUrl(),
        "/v1/invoices");
    if (!params.collection_method.isNull)
      requestor.setQueryParam("collection_method", params.collection_method.get.to!string);
    if (!params.created.isNull)
      requestor.setQueryParam("created", params.created.get.to!string);
    if (!params.customer.isNull)
      requestor.setQueryParam("customer", params.customer.get.to!string);
    if (!params.due_date.isNull)
      requestor.setQueryParam("due_date", params.due_date.get.to!string);
    if (!params.ending_before.isNull)
      requestor.setQueryParam("ending_before", params.ending_before.get.to!string);
    if (!params.expand.isNull)
      requestor.setQueryParam("expand", params.expand.get.to!string);
    if (!params.limit.isNull)
      requestor.setQueryParam("limit", params.limit.get.to!string);
    if (!params.starting_after.isNull)
      requestor.setQueryParam("starting_after", params.starting_after.get.to!string);
    if (!params.status.isNull)
      requestor.setQueryParam("status", params.status.get.to!string);
    if (!params.subscription.isNull)
      requestor.setQueryParam("subscription", params.subscription.get.to!string);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class PostInvoicesResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(Invoice response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponsedefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        handleResponse200(deserializeJson!(Invoice)(res.readJson()));
        return;
      }
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   */
  void postInvoices(
      PostInvoicesResponseHandler responseHandler = null,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/invoices");
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class PostInvoicesInvoiceMarkUncollectibleParams {
    /**
     */
    Nullable!(Nullable!(string)) invoice;

  }

  static class PostInvoicesInvoiceMarkUncollectibleResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(Invoice response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponsedefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        handleResponse200(deserializeJson!(Invoice)(res.readJson()));
        return;
      }
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   */
  void postInvoicesInvoiceMarkUncollectible(
      PostInvoicesInvoiceMarkUncollectibleParams params,
      PostInvoicesInvoiceMarkUncollectibleResponseHandler responseHandler = null,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/invoices/{invoice}/mark_uncollectible");
    if (!params.invoice.isNull)
      requestor.setPathParam("invoice", params.invoice.get.to!string);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class PostInvoicesInvoicePayParams {
    /**
     */
    Nullable!(Nullable!(string)) invoice;

  }

  static class PostInvoicesInvoicePayResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(Invoice response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponsedefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        handleResponse200(deserializeJson!(Invoice)(res.readJson()));
        return;
      }
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   */
  void postInvoicesInvoicePay(
      PostInvoicesInvoicePayParams params,
      PostInvoicesInvoicePayResponseHandler responseHandler = null,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/invoices/{invoice}/pay");
    if (!params.invoice.isNull)
      requestor.setPathParam("invoice", params.invoice.get.to!string);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class GetInvoicesInvoiceLinesParams {
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
     */
    Nullable!(Nullable!(string)) invoice;

    /**
     * A limit on the number of objects to be returned. Limit can range between 1 and 100, and the
     * default is 10.
     */
    Nullable!(Nullable!(int)) limit;

    /**
     * A cursor for use in pagination. `starting_after` is an object ID that defines your place in
     * the list. For instance, if you make a list request and receive 100 objects, ending with
     * `obj_foo`, your subsequent call can include `starting_after=obj_foo` in order to fetch the
     * next page of the list.
     */
    Nullable!(Nullable!(string)) starting_after;

  }

  static class GetInvoicesInvoiceLinesResponseHandler : ResponseHandler {

    static class InvoiceLinesList {
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
      LineItem[] data;

      /**
       * The URL where this list can be accessed.
       */
      @optional
      Nullable!(string) url;

    }

    /**
     * Successful response.
     */
    void delegate(InvoiceLinesList response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponsedefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        handleResponse200(deserializeJson!(InvoiceLinesList)(res.readJson()));
        return;
      }
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   */
  void getInvoicesInvoiceLines(
      GetInvoicesInvoiceLinesParams params,
      GetInvoicesInvoiceLinesResponseHandler responseHandler = null,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.GET,
        Servers.getServerUrl(),
        "/v1/invoices/{invoice}/lines");
    if (!params.ending_before.isNull)
      requestor.setQueryParam("ending_before", params.ending_before.get.to!string);
    if (!params.expand.isNull)
      requestor.setQueryParam("expand", params.expand.get.to!string);
    if (!params.invoice.isNull)
      requestor.setPathParam("invoice", params.invoice.get.to!string);
    if (!params.limit.isNull)
      requestor.setQueryParam("limit", params.limit.get.to!string);
    if (!params.starting_after.isNull)
      requestor.setQueryParam("starting_after", params.starting_after.get.to!string);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class PostInvoicesInvoiceSendParams {
    /**
     */
    Nullable!(Nullable!(string)) invoice;

  }

  static class PostInvoicesInvoiceSendResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(Invoice response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponsedefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        handleResponse200(deserializeJson!(Invoice)(res.readJson()));
        return;
      }
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   */
  void postInvoicesInvoiceSend(
      PostInvoicesInvoiceSendParams params,
      PostInvoicesInvoiceSendResponseHandler responseHandler = null,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/invoices/{invoice}/send");
    if (!params.invoice.isNull)
      requestor.setPathParam("invoice", params.invoice.get.to!string);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class PostInvoicesInvoiceFinalizeParams {
    /**
     */
    Nullable!(Nullable!(string)) invoice;

  }

  static class PostInvoicesInvoiceFinalizeResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(Invoice response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponsedefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        handleResponse200(deserializeJson!(Invoice)(res.readJson()));
        return;
      }
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   */
  void postInvoicesInvoiceFinalize(
      PostInvoicesInvoiceFinalizeParams params,
      PostInvoicesInvoiceFinalizeResponseHandler responseHandler = null,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/invoices/{invoice}/finalize");
    if (!params.invoice.isNull)
      requestor.setPathParam("invoice", params.invoice.get.to!string);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class PostInvoicesInvoiceVoidParams {
    /**
     */
    Nullable!(Nullable!(string)) invoice;

  }

  static class PostInvoicesInvoiceVoidResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(Invoice response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponsedefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        handleResponse200(deserializeJson!(Invoice)(res.readJson()));
        return;
      }
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   */
  void postInvoicesInvoiceVoid(
      PostInvoicesInvoiceVoidParams params,
      PostInvoicesInvoiceVoidResponseHandler responseHandler = null,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/invoices/{invoice}/void");
    if (!params.invoice.isNull)
      requestor.setPathParam("invoice", params.invoice.get.to!string);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class GetInvoicesInvoiceParams {
    /**
     * Specifies which fields in the response should be expanded.
     */
    Nullable!(Nullable!(string)[]) expand;

    /**
     */
    Nullable!(Nullable!(string)) invoice;

  }

  static class GetInvoicesInvoiceResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(Invoice response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponsedefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        handleResponse200(deserializeJson!(Invoice)(res.readJson()));
        return;
      }
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   */
  void getInvoicesInvoice(
      GetInvoicesInvoiceParams params,
      GetInvoicesInvoiceResponseHandler responseHandler = null,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.GET,
        Servers.getServerUrl(),
        "/v1/invoices/{invoice}");
    if (!params.expand.isNull)
      requestor.setQueryParam("expand", params.expand.get.to!string);
    if (!params.invoice.isNull)
      requestor.setPathParam("invoice", params.invoice.get.to!string);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class PostInvoicesInvoiceParams {
    /**
     */
    Nullable!(Nullable!(string)) invoice;

  }

  static class PostInvoicesInvoiceResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(Invoice response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponsedefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        handleResponse200(deserializeJson!(Invoice)(res.readJson()));
        return;
      }
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   */
  void postInvoicesInvoice(
      PostInvoicesInvoiceParams params,
      PostInvoicesInvoiceResponseHandler responseHandler = null,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/invoices/{invoice}");
    if (!params.invoice.isNull)
      requestor.setPathParam("invoice", params.invoice.get.to!string);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class DeleteInvoicesInvoiceParams {
    /**
     */
    Nullable!(Nullable!(string)) invoice;

  }

  static class DeleteInvoicesInvoiceResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(DeletedInvoice response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponsedefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        handleResponse200(deserializeJson!(DeletedInvoice)(res.readJson()));
        return;
      }
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   */
  void deleteInvoicesInvoice(
      DeleteInvoicesInvoiceParams params,
      DeleteInvoicesInvoiceResponseHandler responseHandler = null,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.DELETE,
        Servers.getServerUrl(),
        "/v1/invoices/{invoice}");
    if (!params.invoice.isNull)
      requestor.setPathParam("invoice", params.invoice.get.to!string);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

}

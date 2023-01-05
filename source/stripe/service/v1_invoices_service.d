// File automatically generated from OpenAPI spec.
module stripe.service.v1_invoices_service;

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
    string collection_method;

    /**
     */
    Json created;

    /**
     * Only return invoices for the customer specified by this customer ID.
     */
    string customer;

    /**
     */
    Json due_date;

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
     * The status of the invoice, one of `draft`, `open`, `paid`, `uncollectible`, or `void`. [Learn
     * more](https://stripe.com/docs/billing/invoices/workflow#workflow-overview)
     */
    string status;

    /**
     * Only return invoices for the subscription specified by this subscription ID.
     */
    string subscription;

    mixin AddBuilder!(typeof(this));

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
      string object;

      @optional
      Invoice[] data;

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
        if (handleResponse200 is null) throw new Exception("Unhandled response status code 200");
        handleResponse200(deserializeJson!(InvoicesList)(res.readJson()));
        return;
      }
      if (handleResponsedefault is null) throw new Exception("Unhandled response status code default");
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

  }

  /**
   * <p>You can list all invoices, or list the invoices for a specific customer. The invoices are
   * returned sorted by creation date, with the most recently created invoices appearing first.</p>
   * See_Also: HTTP GET `/v1/invoices`
   */
  void getInvoices(
      GetInvoicesParams params,
      GetInvoicesResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.GET,
        Servers.getServerUrl(),
        "/v1/invoices");
    if (!params.collection_method.isNull)
      requestor.setQueryParam!("deepObject")("collection_method", params.collection_method);
    if (!params.created.isNull)
      requestor.setQueryParam!("deepObject")("created", params.created);
    if (!params.customer.isNull)
      requestor.setQueryParam!("deepObject")("customer", params.customer);
    if (!params.due_date.isNull)
      requestor.setQueryParam!("deepObject")("due_date", params.due_date);
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
    if (!params.subscription.isNull)
      requestor.setQueryParam!("deepObject")("subscription", params.subscription);
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
        if (handleResponse200 is null) throw new Exception("Unhandled response status code 200");
        handleResponse200(deserializeJson!(Invoice)(res.readJson()));
        return;
      }
      if (handleResponsedefault is null) throw new Exception("Unhandled response status code default");
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

  }

  /**
   * <p>This endpoint creates a draft invoice for a given customer. The invoice remains a draft
   * until you <a href="#finalize_invoice">finalize</a> the invoice, which allows you to <a
   * href="#pay_invoice">pay</a> or <a href="#send_invoice">send</a> the invoice to your
   * customers.</p>
   * See_Also: HTTP POST `/v1/invoices`
   */
  void postInvoices(
      PostInvoicesResponseHandler responseHandler,
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
    string invoice;

    mixin AddBuilder!(typeof(this));

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
        if (handleResponse200 is null) throw new Exception("Unhandled response status code 200");
        handleResponse200(deserializeJson!(Invoice)(res.readJson()));
        return;
      }
      if (handleResponsedefault is null) throw new Exception("Unhandled response status code default");
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

  }

  /**
   * <p>Marking an invoice as uncollectible is useful for keeping track of bad debts that can be
   * written off for accounting purposes.</p>
   * See_Also: HTTP POST `/v1/invoices/{invoice}/mark_uncollectible`
   */
  void postInvoicesInvoiceMarkUncollectible(
      PostInvoicesInvoiceMarkUncollectibleParams params,
      PostInvoicesInvoiceMarkUncollectibleResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/invoices/{invoice}/mark_uncollectible");
    if (!params.invoice.isNull)
      requestor.setPathParam("invoice", params.invoice);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class PostInvoicesInvoicePayParams {
    /**
     */
    string invoice;

    mixin AddBuilder!(typeof(this));

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
        if (handleResponse200 is null) throw new Exception("Unhandled response status code 200");
        handleResponse200(deserializeJson!(Invoice)(res.readJson()));
        return;
      }
      if (handleResponsedefault is null) throw new Exception("Unhandled response status code default");
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

  }

  /**
   * <p>Stripe automatically creates and then attempts to collect payment on invoices for customers
   * on subscriptions according to your <a
   * href="https://dashboard.stripe.com/account/billing/automatic">subscriptions settings</a>.
   * However, if you’d like to attempt payment on an invoice out of the normal collection schedule
   * or for some other reason, you can do so.</p>
   * See_Also: HTTP POST `/v1/invoices/{invoice}/pay`
   */
  void postInvoicesInvoicePay(
      PostInvoicesInvoicePayParams params,
      PostInvoicesInvoicePayResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/invoices/{invoice}/pay");
    if (!params.invoice.isNull)
      requestor.setPathParam("invoice", params.invoice);
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
    string ending_before;

    /**
     * Specifies which fields in the response should be expanded.
     */
    string[] expand;

    /**
     */
    string invoice;

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
      string object;

      /**
       * Details about each object.
       */
      @optional
      LineItem[] data;

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
        if (handleResponse200 is null) throw new Exception("Unhandled response status code 200");
        handleResponse200(deserializeJson!(InvoiceLinesList)(res.readJson()));
        return;
      }
      if (handleResponsedefault is null) throw new Exception("Unhandled response status code default");
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

  }

  /**
   * <p>When retrieving an invoice, you’ll get a <strong>lines</strong> property containing the
   * total count of line items and the first handful of those items. There is also a URL where you
   * can retrieve the full (paginated) list of line items.</p>
   * See_Also: HTTP GET `/v1/invoices/{invoice}/lines`
   */
  void getInvoicesInvoiceLines(
      GetInvoicesInvoiceLinesParams params,
      GetInvoicesInvoiceLinesResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.GET,
        Servers.getServerUrl(),
        "/v1/invoices/{invoice}/lines");
    if (!params.ending_before.isNull)
      requestor.setQueryParam!("deepObject")("ending_before", params.ending_before);
    if (!params.expand.isNull)
      requestor.setQueryParam!("deepObject")("expand", params.expand);
    if (!params.invoice.isNull)
      requestor.setPathParam("invoice", params.invoice);
    if (!params.limit.isNull)
      requestor.setQueryParam!("deepObject")("limit", params.limit);
    if (!params.starting_after.isNull)
      requestor.setQueryParam!("deepObject")("starting_after", params.starting_after);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class PostInvoicesInvoiceSendParams {
    /**
     */
    string invoice;

    mixin AddBuilder!(typeof(this));

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
        if (handleResponse200 is null) throw new Exception("Unhandled response status code 200");
        handleResponse200(deserializeJson!(Invoice)(res.readJson()));
        return;
      }
      if (handleResponsedefault is null) throw new Exception("Unhandled response status code default");
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

  }

  /**
   * <p>Stripe will automatically send invoices to customers according to your <a
   * href="https://dashboard.stripe.com/account/billing/automatic">subscriptions settings</a>.
   * However, if you’d like to manually send an invoice to your customer out of the normal
   * schedule, you can do so. When sending invoices that have already been paid, there will be no
   * reference to the payment in the email.</p>
   * <p>Requests made in test-mode result in no emails being sent, despite sending an
   * <code>invoice.sent</code> event.</p>
   * See_Also: HTTP POST `/v1/invoices/{invoice}/send`
   */
  void postInvoicesInvoiceSend(
      PostInvoicesInvoiceSendParams params,
      PostInvoicesInvoiceSendResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/invoices/{invoice}/send");
    if (!params.invoice.isNull)
      requestor.setPathParam("invoice", params.invoice);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class PostInvoicesInvoiceFinalizeParams {
    /**
     */
    string invoice;

    mixin AddBuilder!(typeof(this));

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
        if (handleResponse200 is null) throw new Exception("Unhandled response status code 200");
        handleResponse200(deserializeJson!(Invoice)(res.readJson()));
        return;
      }
      if (handleResponsedefault is null) throw new Exception("Unhandled response status code default");
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

  }

  /**
   * <p>Stripe automatically finalizes drafts before sending and attempting payment on invoices.
   * However, if you’d like to finalize a draft invoice manually, you can do so using this
   * method.</p>
   * See_Also: HTTP POST `/v1/invoices/{invoice}/finalize`
   */
  void postInvoicesInvoiceFinalize(
      PostInvoicesInvoiceFinalizeParams params,
      PostInvoicesInvoiceFinalizeResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/invoices/{invoice}/finalize");
    if (!params.invoice.isNull)
      requestor.setPathParam("invoice", params.invoice);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class PostInvoicesInvoiceVoidParams {
    /**
     */
    string invoice;

    mixin AddBuilder!(typeof(this));

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
        if (handleResponse200 is null) throw new Exception("Unhandled response status code 200");
        handleResponse200(deserializeJson!(Invoice)(res.readJson()));
        return;
      }
      if (handleResponsedefault is null) throw new Exception("Unhandled response status code default");
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

  }

  /**
   * <p>Mark a finalized invoice as void. This cannot be undone. Voiding an invoice is similar to <a
   * href="#delete_invoice">deletion</a>, however it only applies to finalized invoices and
   * maintains a papertrail where the invoice can still be found.</p>
   * See_Also: HTTP POST `/v1/invoices/{invoice}/void`
   */
  void postInvoicesInvoiceVoid(
      PostInvoicesInvoiceVoidParams params,
      PostInvoicesInvoiceVoidResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/invoices/{invoice}/void");
    if (!params.invoice.isNull)
      requestor.setPathParam("invoice", params.invoice);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class GetInvoicesInvoiceParams {
    /**
     * Specifies which fields in the response should be expanded.
     */
    string[] expand;

    /**
     */
    string invoice;

    mixin AddBuilder!(typeof(this));

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
        if (handleResponse200 is null) throw new Exception("Unhandled response status code 200");
        handleResponse200(deserializeJson!(Invoice)(res.readJson()));
        return;
      }
      if (handleResponsedefault is null) throw new Exception("Unhandled response status code default");
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

  }

  /**
   * <p>Retrieves the invoice with the given ID.</p>
   * See_Also: HTTP GET `/v1/invoices/{invoice}`
   */
  void getInvoicesInvoice(
      GetInvoicesInvoiceParams params,
      GetInvoicesInvoiceResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.GET,
        Servers.getServerUrl(),
        "/v1/invoices/{invoice}");
    if (!params.expand.isNull)
      requestor.setQueryParam!("deepObject")("expand", params.expand);
    if (!params.invoice.isNull)
      requestor.setPathParam("invoice", params.invoice);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class PostInvoicesInvoiceParams {
    /**
     */
    string invoice;

    mixin AddBuilder!(typeof(this));

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
        if (handleResponse200 is null) throw new Exception("Unhandled response status code 200");
        handleResponse200(deserializeJson!(Invoice)(res.readJson()));
        return;
      }
      if (handleResponsedefault is null) throw new Exception("Unhandled response status code default");
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

  }

  /**
   * <p>Draft invoices are fully editable. Once an invoice is <a
   * href="/docs/billing/invoices/workflow#finalized">finalized</a>,
   * monetary values, as well as <code>collection_method</code>, become uneditable.</p>
   * <p>If you would like to stop the Stripe Billing engine from automatically finalizing,
   * reattempting payments on,
   * sending reminders for, or <a href="/docs/billing/invoices/reconciliation">automatically
   * reconciling</a> invoices, pass
   * <code>auto_advance=false</code>.</p>
   * See_Also: HTTP POST `/v1/invoices/{invoice}`
   */
  void postInvoicesInvoice(
      PostInvoicesInvoiceParams params,
      PostInvoicesInvoiceResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/invoices/{invoice}");
    if (!params.invoice.isNull)
      requestor.setPathParam("invoice", params.invoice);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class DeleteInvoicesInvoiceParams {
    /**
     */
    string invoice;

    mixin AddBuilder!(typeof(this));

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
        if (handleResponse200 is null) throw new Exception("Unhandled response status code 200");
        handleResponse200(deserializeJson!(DeletedInvoice)(res.readJson()));
        return;
      }
      if (handleResponsedefault is null) throw new Exception("Unhandled response status code default");
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

  }

  /**
   * <p>Permanently deletes a one-off invoice draft. This cannot be undone. Attempts to delete
   * invoices that are no longer in a draft state will fail; once an invoice has been finalized or
   * if an invoice is for a subscription, it must be <a href="#void_invoice">voided</a>.</p>
   * See_Also: HTTP DELETE `/v1/invoices/{invoice}`
   */
  void deleteInvoicesInvoice(
      DeleteInvoicesInvoiceParams params,
      DeleteInvoicesInvoiceResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.DELETE,
        Servers.getServerUrl(),
        "/v1/invoices/{invoice}");
    if (!params.invoice.isNull)
      requestor.setPathParam("invoice", params.invoice);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  mixin AddBuilder!(typeof(this));

}

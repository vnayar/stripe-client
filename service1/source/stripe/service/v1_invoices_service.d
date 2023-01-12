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
    void delegate(Error_ response) handleResponseDefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        if (handleResponse200 is null) throw new Exception("Unhandled response status code 200");
        handleResponse200(deserializeJson!(InvoicesList)(res.readJson()));
        return;
      }
      if (handleResponseDefault is null) throw new Exception("Unhandled response status code default");
      handleResponseDefault(deserializeJson!(Error_)(res.readJson()));
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

  static class PostInvoicesBody {
    /**
     * The date on which payment for this invoice is due. Valid only for invoices where
     * `collection_method=send_invoice`.
     */
    @optional
    Nullable!(long) due_date;

    /**
     * Either `charge_automatically`, or `send_invoice`. When charging automatically, Stripe will
     * attempt to pay this invoice using the default source attached to the customer. When sending
     * an invoice, Stripe will email this invoice to the customer with payment instructions.
     * Defaults to `charge_automatically`.
     */
    @optional
    string collection_method;

    /**
     * The tax rates that will apply to any line item that does not have `tax_rates` set.
     */
    @optional
    string[] default_tax_rates;

    /**
     * The account (if any) for which the funds of the invoice payment are intended. If set, the
     * invoice will be presented with the branding and support information of the specified account.
     * See the [Invoices with Connect](https://stripe.com/docs/billing/invoices/connect)
     * documentation for details.
     */
    @optional
    string on_behalf_of;

    /**
     * The number of days from when the invoice is created until it is due. Valid only for invoices
     * where `collection_method=send_invoice`.
     */
    @optional
    Nullable!(int) days_until_due;

    /**
     * The ID of the subscription to invoice, if any. If set, the created invoice will only include
     * pending invoice items for that subscription. The subscription's billing cycle and regular
     * subscription events won't be affected.
     */
    @optional
    string subscription;

    /**
     * The ID of the customer who will be billed.
     */
    @optional
    string customer;

    /**
     * The currency to create this invoice in. Defaults to that of `customer` if not specified.
     */
    @optional
    string currency;

    static class FromInvoice {
      @optional
      string invoice;

      @optional
      string action;

      mixin AddBuilder!(typeof(this));

    }

    /**
     * Revise an existing invoice. The new invoice will be created in `status=draft`. See the
     * [revision documentation](https://stripe.com/docs/invoicing/invoice-revisions) for more
     * details.
     */
    @optional
    FromInvoice from_invoice;

    static class PaymentSettings {
      @optional
      Json payment_method_types;

      @optional
      string default_mandate;

      static class PaymentMethodOptions {
        @optional
        Json card;

        @optional
        Json bancontact;

        @optional
        Json konbini;

        @optional
        Json acss_debit;

        @optional
        Json customer_balance;

        @optional
        Json us_bank_account;

        mixin AddBuilder!(typeof(this));

      }

      @optional
      PaymentMethodOptions payment_method_options;

      mixin AddBuilder!(typeof(this));

    }

    /**
     * Configuration settings for the PaymentIntent that is generated when the invoice is finalized.
     */
    @optional
    PaymentSettings payment_settings;

    /**
     * A list of up to 4 custom fields to be displayed on the invoice.
     */
    @optional
    Json custom_fields;

    /**
     * ID of the default payment method for the invoice. It must belong to the customer associated
     * with the invoice. If not set, defaults to the subscription's default payment method, if any,
     * or to the default payment method in the customer's invoice settings.
     */
    @optional
    string default_payment_method;

    static class TransferDataSpecs {
      @optional
      Nullable!(int) amount;

      @optional
      string destination;

      mixin AddBuilder!(typeof(this));

    }

    /**
     * If specified, the funds from the invoice will be transferred to the destination and the ID of
     * the resulting transfer will be found on the invoice's charge.
     */
    @optional
    TransferDataSpecs transfer_data;

    /**
     * Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an
     * object. This can be useful for storing additional information about the object in a
     * structured format. Individual keys can be unset by posting an empty value to them. All keys
     * can be unset by posting an empty value to `metadata`.
     */
    @optional
    Json metadata;

    /**
     * The account tax IDs associated with the invoice. Only editable when the invoice is a draft.
     */
    @optional
    Json account_tax_ids;

    /**
     * Specifies which fields in the response should be expanded.
     */
    @optional
    string[] expand;

    /**
     * Controls whether Stripe will perform [automatic
     * collection](https://stripe.com/docs/billing/invoices/workflow/#auto_advance) of the invoice.
     * When `false`, the invoice's state will not automatically advance without an explicit action.
     */
    @optional
    Nullable!(bool) auto_advance;

    /**
     * A fee in cents (or local equivalent) that will be applied to the invoice and transferred to
     * the application owner's Stripe account. The request must be made with an OAuth key or the
     * Stripe-Account header in order to take an application fee. For more information, see the
     * application fees
     * [documentation](https://stripe.com/docs/billing/invoices/connect#collecting-fees).
     */
    @optional
    Nullable!(int) application_fee_amount;

    /**
     * ID of the default payment source for the invoice. It must belong to the customer associated
     * with the invoice and be in a chargeable state. If not set, defaults to the subscription's
     * default source, if any, or to the customer's default source.
     */
    @optional
    string default_source;

    /**
     * Extra information about a charge for the customer's credit card statement. It must contain at
     * least one letter. If not specified and this invoice is part of a subscription, the default
     * `statement_descriptor` will be set to the first subscription item's product's
     * `statement_descriptor`.
     */
    @optional
    string statement_descriptor;

    /**
     * How to handle pending invoice items on invoice creation. One of `include` or `exclude`.
     * `include` will include any pending invoice items, and will create an empty draft invoice if
     * no pending invoice items exist. `exclude` will always create an empty invoice draft
     * regardless if there are pending invoice items or not. Defaults to `exclude` if the parameter
     * is omitted.
     */
    @optional
    string pending_invoice_items_behavior;

    /**
     * Footer to be displayed on the invoice.
     */
    @optional
    string footer;

    /**
     * Options for invoice PDF rendering.
     */
    @optional
    Json rendering_options;

    /**
     * The coupons to redeem into discounts for the invoice. If not specified, inherits the discount
     * from the invoice's customer. Pass an empty string to avoid inheriting any discounts.
     */
    @optional
    Json discounts;

    /**
     * An arbitrary string attached to the object. Often useful for displaying to users. Referenced
     * as 'memo' in the Dashboard.
     */
    @optional
    string description;

    static class AutomaticTaxParam {
      @optional
      Nullable!(bool) enabled;

      mixin AddBuilder!(typeof(this));

    }

    /**
     * Settings for automatic tax lookup for this invoice.
     */
    @optional
    AutomaticTaxParam automatic_tax;

    mixin AddBuilder!(typeof(this));

  }

  static class PostInvoicesResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(Invoice response) handleResponse200;

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
        handleResponse200(deserializeJson!(Invoice)(res.readJson()));
        return;
      }
      if (handleResponseDefault is null) throw new Exception("Unhandled response status code default");
      handleResponseDefault(deserializeJson!(Error_)(res.readJson()));
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
      PostInvoicesBody requestBody,
      PostInvoicesResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/invoices");
    requestor.setHeaderParam("Content-Type", "application/x-www-form-urlencoded");
    Security.apply(requestor);
    requestor.makeRequest(requestBody, responseHandler);
  }

  static class PostInvoicesInvoiceMarkUncollectibleParams {
    /**
     */
    string invoice;

    mixin AddBuilder!(typeof(this));

  }

  static class PostInvoicesInvoiceMarkUncollectibleBody {
    /**
     * Specifies which fields in the response should be expanded.
     */
    @optional
    string[] expand;

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
    void delegate(Error_ response) handleResponseDefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        if (handleResponse200 is null) throw new Exception("Unhandled response status code 200");
        handleResponse200(deserializeJson!(Invoice)(res.readJson()));
        return;
      }
      if (handleResponseDefault is null) throw new Exception("Unhandled response status code default");
      handleResponseDefault(deserializeJson!(Error_)(res.readJson()));
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
      PostInvoicesInvoiceMarkUncollectibleBody requestBody,
      PostInvoicesInvoiceMarkUncollectibleResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/invoices/{invoice}/mark_uncollectible");
    if (!params.invoice.isNull)
      requestor.setPathParam("invoice", params.invoice);
    requestor.setHeaderParam("Content-Type", "application/x-www-form-urlencoded");
    Security.apply(requestor);
    requestor.makeRequest(requestBody, responseHandler);
  }

  static class PostInvoicesInvoicePayParams {
    /**
     */
    string invoice;

    mixin AddBuilder!(typeof(this));

  }

  static class PostInvoicesInvoicePayBody {
    /**
     * Boolean representing whether an invoice is paid outside of Stripe. This will result in no
     * charge being made. Defaults to `false`.
     */
    @optional
    Nullable!(bool) paid_out_of_band;

    /**
     * A payment source to be charged. The source must be the ID of a source belonging to the
     * customer associated with the invoice being paid.
     */
    @optional
    string source;

    /**
     * Indicates if a customer is on or off-session while an invoice payment is attempted. Defaults
     * to `true` (off-session).
     */
    @optional
    Nullable!(bool) off_session;

    /**
     * A PaymentMethod to be charged. The PaymentMethod must be the ID of a PaymentMethod belonging
     * to the customer associated with the invoice being paid.
     */
    @optional
    string payment_method;

    /**
     * In cases where the source used to pay the invoice has insufficient funds, passing
     * `forgive=true` controls whether a charge should be attempted for the full amount available on
     * the source, up to the amount to fully pay the invoice. This effectively forgives the
     * difference between the amount available on the source and the amount due. 
     * Passing `forgive=false` will fail the charge if the source hasn't been pre-funded with the
     * right amount. An example for this case is with ACH Credit Transfers and wires: if the amount
     * wired is less than the amount due by a small amount, you might want to forgive the
     * difference. Defaults to `false`.
     */
    @optional
    Nullable!(bool) forgive;

    /**
     * Specifies which fields in the response should be expanded.
     */
    @optional
    string[] expand;

    /**
     * ID of the mandate to be used for this invoice. It must correspond to the payment method used
     * to pay the invoice, including the payment_method param or the invoice's
     * default_payment_method or default_source, if set.
     */
    @optional
    string mandate;

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
    void delegate(Error_ response) handleResponseDefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        if (handleResponse200 is null) throw new Exception("Unhandled response status code 200");
        handleResponse200(deserializeJson!(Invoice)(res.readJson()));
        return;
      }
      if (handleResponseDefault is null) throw new Exception("Unhandled response status code default");
      handleResponseDefault(deserializeJson!(Error_)(res.readJson()));
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
      PostInvoicesInvoicePayBody requestBody,
      PostInvoicesInvoicePayResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/invoices/{invoice}/pay");
    if (!params.invoice.isNull)
      requestor.setPathParam("invoice", params.invoice);
    requestor.setHeaderParam("Content-Type", "application/x-www-form-urlencoded");
    Security.apply(requestor);
    requestor.makeRequest(requestBody, responseHandler);
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
    void delegate(Error_ response) handleResponseDefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        if (handleResponse200 is null) throw new Exception("Unhandled response status code 200");
        handleResponse200(deserializeJson!(InvoiceLinesList)(res.readJson()));
        return;
      }
      if (handleResponseDefault is null) throw new Exception("Unhandled response status code default");
      handleResponseDefault(deserializeJson!(Error_)(res.readJson()));
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

  static class PostInvoicesInvoiceSendBody {
    /**
     * Specifies which fields in the response should be expanded.
     */
    @optional
    string[] expand;

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
    void delegate(Error_ response) handleResponseDefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        if (handleResponse200 is null) throw new Exception("Unhandled response status code 200");
        handleResponse200(deserializeJson!(Invoice)(res.readJson()));
        return;
      }
      if (handleResponseDefault is null) throw new Exception("Unhandled response status code default");
      handleResponseDefault(deserializeJson!(Error_)(res.readJson()));
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
      PostInvoicesInvoiceSendBody requestBody,
      PostInvoicesInvoiceSendResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/invoices/{invoice}/send");
    if (!params.invoice.isNull)
      requestor.setPathParam("invoice", params.invoice);
    requestor.setHeaderParam("Content-Type", "application/x-www-form-urlencoded");
    Security.apply(requestor);
    requestor.makeRequest(requestBody, responseHandler);
  }

  static class PostInvoicesInvoiceFinalizeParams {
    /**
     */
    string invoice;

    mixin AddBuilder!(typeof(this));

  }

  static class PostInvoicesInvoiceFinalizeBody {
    /**
     * Controls whether Stripe will perform [automatic
     * collection](https://stripe.com/docs/invoicing/automatic-charging) of the invoice. When
     * `false`, the invoice's state will not automatically advance without an explicit action.
     */
    @optional
    Nullable!(bool) auto_advance;

    /**
     * Specifies which fields in the response should be expanded.
     */
    @optional
    string[] expand;

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
    void delegate(Error_ response) handleResponseDefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        if (handleResponse200 is null) throw new Exception("Unhandled response status code 200");
        handleResponse200(deserializeJson!(Invoice)(res.readJson()));
        return;
      }
      if (handleResponseDefault is null) throw new Exception("Unhandled response status code default");
      handleResponseDefault(deserializeJson!(Error_)(res.readJson()));
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
      PostInvoicesInvoiceFinalizeBody requestBody,
      PostInvoicesInvoiceFinalizeResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/invoices/{invoice}/finalize");
    if (!params.invoice.isNull)
      requestor.setPathParam("invoice", params.invoice);
    requestor.setHeaderParam("Content-Type", "application/x-www-form-urlencoded");
    Security.apply(requestor);
    requestor.makeRequest(requestBody, responseHandler);
  }

  static class PostInvoicesInvoiceVoidParams {
    /**
     */
    string invoice;

    mixin AddBuilder!(typeof(this));

  }

  static class PostInvoicesInvoiceVoidBody {
    /**
     * Specifies which fields in the response should be expanded.
     */
    @optional
    string[] expand;

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
    void delegate(Error_ response) handleResponseDefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        if (handleResponse200 is null) throw new Exception("Unhandled response status code 200");
        handleResponse200(deserializeJson!(Invoice)(res.readJson()));
        return;
      }
      if (handleResponseDefault is null) throw new Exception("Unhandled response status code default");
      handleResponseDefault(deserializeJson!(Error_)(res.readJson()));
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
      PostInvoicesInvoiceVoidBody requestBody,
      PostInvoicesInvoiceVoidResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/invoices/{invoice}/void");
    if (!params.invoice.isNull)
      requestor.setPathParam("invoice", params.invoice);
    requestor.setHeaderParam("Content-Type", "application/x-www-form-urlencoded");
    Security.apply(requestor);
    requestor.makeRequest(requestBody, responseHandler);
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
    void delegate(Error_ response) handleResponseDefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        if (handleResponse200 is null) throw new Exception("Unhandled response status code 200");
        handleResponse200(deserializeJson!(Invoice)(res.readJson()));
        return;
      }
      if (handleResponseDefault is null) throw new Exception("Unhandled response status code default");
      handleResponseDefault(deserializeJson!(Error_)(res.readJson()));
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

  static class PostInvoicesInvoiceBody {
    static class AutomaticTaxParam {
      @optional
      Nullable!(bool) enabled;

      mixin AddBuilder!(typeof(this));

    }

    /**
     * Settings for automatic tax lookup for this invoice.
     */
    @optional
    AutomaticTaxParam automatic_tax;

    /**
     * The date on which payment for this invoice is due. Only valid for invoices where
     * `collection_method=send_invoice`. This field can only be updated on `draft` invoices.
     */
    @optional
    Nullable!(long) due_date;

    /**
     * Extra information about a charge for the customer's credit card statement. It must contain at
     * least one letter. If not specified and this invoice is part of a subscription, the default
     * `statement_descriptor` will be set to the first subscription item's product's
     * `statement_descriptor`.
     */
    @optional
    string statement_descriptor;

    /**
     * Either `charge_automatically` or `send_invoice`. This field can be updated only on `draft`
     * invoices.
     */
    @optional
    string collection_method;

    /**
     * The number of days from which the invoice is created until it is due. Only valid for invoices
     * where `collection_method=send_invoice`. This field can only be updated on `draft` invoices.
     */
    @optional
    Nullable!(int) days_until_due;

    /**
     * Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an
     * object. This can be useful for storing additional information about the object in a
     * structured format. Individual keys can be unset by posting an empty value to them. All keys
     * can be unset by posting an empty value to `metadata`.
     */
    @optional
    Json metadata;

    /**
     * The account tax IDs associated with the invoice. Only editable when the invoice is a draft.
     */
    @optional
    Json account_tax_ids;

    /**
     * The tax rates that will apply to any line item that does not have `tax_rates` set. Pass an
     * empty string to remove previously-defined tax rates.
     */
    @optional
    Json default_tax_rates;

    /**
     * Specifies which fields in the response should be expanded.
     */
    @optional
    string[] expand;

    static class PaymentSettings {
      @optional
      Json payment_method_types;

      @optional
      string default_mandate;

      static class PaymentMethodOptions {
        @optional
        Json card;

        @optional
        Json bancontact;

        @optional
        Json konbini;

        @optional
        Json acss_debit;

        @optional
        Json customer_balance;

        @optional
        Json us_bank_account;

        mixin AddBuilder!(typeof(this));

      }

      @optional
      PaymentMethodOptions payment_method_options;

      mixin AddBuilder!(typeof(this));

    }

    /**
     * Configuration settings for the PaymentIntent that is generated when the invoice is finalized.
     */
    @optional
    PaymentSettings payment_settings;

    /**
     * A list of up to 4 custom fields to be displayed on the invoice. If a value for
     * `custom_fields` is specified, the list specified will replace the existing custom field list
     * on this invoice. Pass an empty string to remove previously-defined fields.
     */
    @optional
    Json custom_fields;

    /**
     * Footer to be displayed on the invoice.
     */
    @optional
    string footer;

    /**
     * Options for invoice PDF rendering.
     */
    @optional
    Json rendering_options;

    /**
     * The discounts that will apply to the invoice. Pass an empty string to remove
     * previously-defined discounts.
     */
    @optional
    Json discounts;

    /**
     * If specified, the funds from the invoice will be transferred to the destination and the ID of
     * the resulting transfer will be found on the invoice's charge. This will be unset if you POST
     * an empty value.
     */
    @optional
    Json transfer_data;

    /**
     * ID of the default payment method for the invoice. It must belong to the customer associated
     * with the invoice. If not set, defaults to the subscription's default payment method, if any,
     * or to the default payment method in the customer's invoice settings.
     */
    @optional
    string default_payment_method;

    /**
     * Controls whether Stripe will perform [automatic
     * collection](https://stripe.com/docs/billing/invoices/workflow/#auto_advance) of the invoice.
     */
    @optional
    Nullable!(bool) auto_advance;

    /**
     * ID of the default payment source for the invoice. It must belong to the customer associated
     * with the invoice and be in a chargeable state. If not set, defaults to the subscription's
     * default source, if any, or to the customer's default source.
     */
    @optional
    string default_source;

    /**
     * A fee in cents (or local equivalent) that will be applied to the invoice and transferred to
     * the application owner's Stripe account. The request must be made with an OAuth key or the
     * Stripe-Account header in order to take an application fee. For more information, see the
     * application fees
     * [documentation](https://stripe.com/docs/billing/invoices/connect#collecting-fees).
     */
    @optional
    Nullable!(int) application_fee_amount;

    /**
     * An arbitrary string attached to the object. Often useful for displaying to users. Referenced
     * as 'memo' in the Dashboard.
     */
    @optional
    string description;

    /**
     * The account (if any) for which the funds of the invoice payment are intended. If set, the
     * invoice will be presented with the branding and support information of the specified account.
     * See the [Invoices with Connect](https://stripe.com/docs/billing/invoices/connect)
     * documentation for details.
     */
    @optional
    Json on_behalf_of;

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
    void delegate(Error_ response) handleResponseDefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        if (handleResponse200 is null) throw new Exception("Unhandled response status code 200");
        handleResponse200(deserializeJson!(Invoice)(res.readJson()));
        return;
      }
      if (handleResponseDefault is null) throw new Exception("Unhandled response status code default");
      handleResponseDefault(deserializeJson!(Error_)(res.readJson()));
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
      PostInvoicesInvoiceBody requestBody,
      PostInvoicesInvoiceResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/invoices/{invoice}");
    if (!params.invoice.isNull)
      requestor.setPathParam("invoice", params.invoice);
    requestor.setHeaderParam("Content-Type", "application/x-www-form-urlencoded");
    Security.apply(requestor);
    requestor.makeRequest(requestBody, responseHandler);
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
    void delegate(Error_ response) handleResponseDefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        if (handleResponse200 is null) throw new Exception("Unhandled response status code 200");
        handleResponse200(deserializeJson!(DeletedInvoice)(res.readJson()));
        return;
      }
      if (handleResponseDefault is null) throw new Exception("Unhandled response status code default");
      handleResponseDefault(deserializeJson!(Error_)(res.readJson()));
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

// File automatically generated from OpenAPI spec.
module stripe.service.v1_credit_notes_service;

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

public import stripe.model.credit_note : CreditNote;
public import stripe.model.credit_note_line_item : CreditNoteLineItem;
public import stripe.model.error : Error_;

/**
 * Service to make REST API calls to paths beginning with: /v1/credit_notes
 */
class V1CreditNotesService {
  static class GetCreditNotesCreditNoteLinesParams {
    /**
     */
    Nullable!(Nullable!(string)) credit_note;

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

  }

  static class GetCreditNotesCreditNoteLinesResponseHandler : ResponseHandler {

    static class CreditNoteLinesList {
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
      CreditNoteLineItem[] data;

      /**
       * The URL where this list can be accessed.
       */
      @optional
      Nullable!(string) url;

    }

    /**
     * Successful response.
     */
    void delegate(CreditNoteLinesList response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponsedefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        handleResponse200(deserializeJson!(CreditNoteLinesList)(res.readJson()));
        return;
      }
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   * <p>When retrieving a credit note, you’ll get a <strong>lines</strong> property containing the
   * the first handful of those items. There is also a URL where you can retrieve the full
   * (paginated) list of line items.</p>
   * See_Also: HTTP GET `/v1/credit_notes/{credit_note}/lines`
   */
  void getCreditNotesCreditNoteLines(
      GetCreditNotesCreditNoteLinesParams params,
      GetCreditNotesCreditNoteLinesResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.GET,
        Servers.getServerUrl(),
        "/v1/credit_notes/{credit_note}/lines");
    if (!params.credit_note.isNull)
      requestor.setPathParam("credit_note", params.credit_note.get.to!string);
    if (!params.ending_before.isNull)
      requestor.setQueryParam("ending_before", params.ending_before.get.to!string);
    if (!params.expand.isNull)
      requestor.setQueryParam("expand", params.expand.get.to!string);
    if (!params.limit.isNull)
      requestor.setQueryParam("limit", params.limit.get.to!string);
    if (!params.starting_after.isNull)
      requestor.setQueryParam("starting_after", params.starting_after.get.to!string);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class GetCreditNotesIdParams {
    /**
     * Specifies which fields in the response should be expanded.
     */
    Nullable!(Nullable!(string)[]) expand;

    /**
     */
    Nullable!(Nullable!(string)) id;

  }

  static class GetCreditNotesIdResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(CreditNote response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponsedefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        handleResponse200(deserializeJson!(CreditNote)(res.readJson()));
        return;
      }
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   * <p>Retrieves the credit note object with the given identifier.</p>
   * See_Also: HTTP GET `/v1/credit_notes/{id}`
   */
  void getCreditNotesId(
      GetCreditNotesIdParams params,
      GetCreditNotesIdResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.GET,
        Servers.getServerUrl(),
        "/v1/credit_notes/{id}");
    if (!params.expand.isNull)
      requestor.setQueryParam("expand", params.expand.get.to!string);
    if (!params.id.isNull)
      requestor.setPathParam("id", params.id.get.to!string);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class PostCreditNotesIdParams {
    /**
     */
    Nullable!(Nullable!(string)) id;

  }

  static class PostCreditNotesIdResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(CreditNote response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponsedefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        handleResponse200(deserializeJson!(CreditNote)(res.readJson()));
        return;
      }
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   * <p>Updates an existing credit note.</p>
   * See_Also: HTTP POST `/v1/credit_notes/{id}`
   */
  void postCreditNotesId(
      PostCreditNotesIdParams params,
      PostCreditNotesIdResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/credit_notes/{id}");
    if (!params.id.isNull)
      requestor.setPathParam("id", params.id.get.to!string);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class GetCreditNotesParams {
    /**
     * Only return credit notes for the customer specified by this customer ID.
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
     * Only return credit notes for the invoice specified by this invoice ID.
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

  static class GetCreditNotesResponseHandler : ResponseHandler {

    static class CreditNotesList {
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
      CreditNote[] data;

      /**
       * The URL where this list can be accessed.
       */
      @optional
      Nullable!(string) url;

    }

    /**
     * Successful response.
     */
    void delegate(CreditNotesList response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponsedefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        handleResponse200(deserializeJson!(CreditNotesList)(res.readJson()));
        return;
      }
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   * <p>Returns a list of credit notes.</p>
   * See_Also: HTTP GET `/v1/credit_notes`
   */
  void getCreditNotes(
      GetCreditNotesParams params,
      GetCreditNotesResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.GET,
        Servers.getServerUrl(),
        "/v1/credit_notes");
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
    if (!params.starting_after.isNull)
      requestor.setQueryParam("starting_after", params.starting_after.get.to!string);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class PostCreditNotesBody {
    /**
     * The integer amount in cents (or local equivalent) representing the total amount of the credit
     * note.
     */
    @optional
    Nullable!(int) amount;

    /**
     * ID of the invoice.
     */
    @optional
    Nullable!(string) invoice;

    /**
     * The integer amount in cents (or local equivalent) representing the amount that is credited
     * outside of Stripe.
     */
    @optional
    Nullable!(int) out_of_band_amount;

    static class CreditNoteLineItemParams {
      @optional
      Nullable!(int) amount;

      @optional
      Nullable!(int) unit_amount;

      @optional
      Nullable!(int) quantity;

      @optional
      Nullable!(string) invoice_line_item;

      @optional
      Nullable!(string) unit_amount_decimal;

      @optional
      Nullable!(string) description;

      @optional
      Nullable!(string) type;

      @optional
      Json tax_rates;

    }

    /**
     * Line items that make up the credit note.
     */
    @optional
    CreditNoteLineItemParams[] lines;

    /**
     * Reason for issuing this credit note, one of `duplicate`, `fraudulent`, `order_change`, or
     * `product_unsatisfactory`
     */
    @optional
    Nullable!(string) reason;

    /**
     * Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an
     * object. This can be useful for storing additional information about the object in a
     * structured format. Individual keys can be unset by posting an empty value to them. All keys
     * can be unset by posting an empty value to `metadata`.
     */
    @optional
    Nullable!(string)[string] metadata;

    /**
     * ID of an existing refund to link this credit note to.
     */
    @optional
    Nullable!(string) refund;

    /**
     * The integer amount in cents (or local equivalent) representing the amount to credit the
     * customer's balance, which will be automatically applied to their next invoice.
     */
    @optional
    Nullable!(int) credit_amount;

    /**
     * The integer amount in cents (or local equivalent) representing the amount to refund. If set,
     * a refund will be created for the charge associated with the invoice.
     */
    @optional
    Nullable!(int) refund_amount;

    /**
     * Specifies which fields in the response should be expanded.
     */
    @optional
    Nullable!(string)[] expand;

    /**
     * The credit note's memo appears on the credit note PDF.
     */
    @optional
    Nullable!(string) memo;

  }

  static class PostCreditNotesResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(CreditNote response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponsedefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        handleResponse200(deserializeJson!(CreditNote)(res.readJson()));
        return;
      }
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   * <p>Issue a credit note to adjust the amount of a finalized invoice. For a
   * <code>status=open</code> invoice, a credit note reduces
   * its <code>amount_due</code>. For a <code>status=paid</code> invoice, a credit note does not
   * affect its <code>amount_due</code>. Instead, it can result
   * in any combination of the following:</p>
   * <ul>
   * <li>Refund: create a new refund (using <code>refund_amount</code>) or link an existing refund
   * (using <code>refund</code>).</li>
   * <li>Customer balance credit: credit the customer’s balance (using <code>credit_amount</code>)
   * which will be automatically applied to their next invoice when it’s finalized.</li>
   * <li>Outside of Stripe credit: record the amount that is or will be credited outside of Stripe
   * (using <code>out_of_band_amount</code>).</li>
   * </ul>
   * <p>For post-payment credit notes the sum of the refund, credit and outside of Stripe amounts
   * must equal the credit note total.</p>
   * <p>You may issue multiple credit notes for an invoice. Each credit note will increment the
   * invoice’s <code>pre_payment_credit_notes_amount</code>
   * or <code>post_payment_credit_notes_amount</code> depending on its <code>status</code> at the
   * time of credit note creation.</p>
   * See_Also: HTTP POST `/v1/credit_notes`
   */
  void postCreditNotes(
      PostCreditNotesBody requestBody,
      PostCreditNotesResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/credit_notes");
    requestor.setHeaderParam("Content-Type", "application/x-www-form-urlencoded");
    Security.apply(requestor);
    requestor.makeRequest(requestBody, responseHandler);
  }

  static class PostCreditNotesIdVoidParams {
    /**
     */
    Nullable!(Nullable!(string)) id;

  }

  static class PostCreditNotesIdVoidResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(CreditNote response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponsedefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        handleResponse200(deserializeJson!(CreditNote)(res.readJson()));
        return;
      }
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   * <p>Marks a credit note as void. Learn more about <a
   * href="/docs/billing/invoices/credit-notes#voiding">voiding credit notes</a>.</p>
   * See_Also: HTTP POST `/v1/credit_notes/{id}/void`
   */
  void postCreditNotesIdVoid(
      PostCreditNotesIdVoidParams params,
      PostCreditNotesIdVoidResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/credit_notes/{id}/void");
    if (!params.id.isNull)
      requestor.setPathParam("id", params.id.get.to!string);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

}

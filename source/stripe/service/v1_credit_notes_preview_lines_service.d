// File automatically generated from OpenAPI spec.
module stripe.service.v1_credit_notes_preview_lines_service;

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

public import stripe.model.credit_note_line_item : CreditNoteLineItem;
public import stripe.model.error : Error_;

/**
 * Service to make REST API calls to paths beginning with: /v1/credit_notes/preview/lines
 */
class V1CreditNotesPreviewLinesService {
  static class GetCreditNotesPreviewLinesParams {
    /**
     * The integer amount in cents (or local equivalent) representing the total amount of the credit
     * note.
     */
    Nullable!(Nullable!(int)) amount;

    /**
     * The integer amount in cents (or local equivalent) representing the amount to credit the
     * customer's balance, which will be automatically applied to their next invoice.
     */
    Nullable!(Nullable!(int)) credit_amount;

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
     * ID of the invoice.
     */
    Nullable!(Nullable!(string)) invoice;

    /**
     * A limit on the number of objects to be returned. Limit can range between 1 and 100, and the
     * default is 10.
     */
    Nullable!(Nullable!(int)) limit;

    /**
     * Line items that make up the credit note.
     */
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

    Nullable!(CreditNoteLineItemParams[]) lines;

    /**
     * The credit note's memo appears on the credit note PDF.
     */
    Nullable!(Nullable!(string)) memo;

    /**
     * Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an
     * object. This can be useful for storing additional information about the object in a
     * structured format. Individual keys can be unset by posting an empty value to them. All keys
     * can be unset by posting an empty value to `metadata`.
     */
    Nullable!(Nullable!(string)[string]) metadata;

    /**
     * The integer amount in cents (or local equivalent) representing the amount that is credited
     * outside of Stripe.
     */
    Nullable!(Nullable!(int)) out_of_band_amount;

    /**
     * Reason for issuing this credit note, one of `duplicate`, `fraudulent`, `order_change`, or
     * `product_unsatisfactory`
     */
    Nullable!(Nullable!(string)) reason;

    /**
     * ID of an existing refund to link this credit note to.
     */
    Nullable!(Nullable!(string)) refund;

    /**
     * The integer amount in cents (or local equivalent) representing the amount to refund. If set,
     * a refund will be created for the charge associated with the invoice.
     */
    Nullable!(Nullable!(int)) refund_amount;

    /**
     * A cursor for use in pagination. `starting_after` is an object ID that defines your place in
     * the list. For instance, if you make a list request and receive 100 objects, ending with
     * `obj_foo`, your subsequent call can include `starting_after=obj_foo` in order to fetch the
     * next page of the list.
     */
    Nullable!(Nullable!(string)) starting_after;

  }

  static class GetCreditNotesPreviewLinesResponseHandler : ResponseHandler {

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
   * <p>When retrieving a credit note preview, you’ll get a <strong>lines</strong> property
   * containing the first handful of those items. This URL you can retrieve the full (paginated)
   * list of line items.</p>
   * See_Also: HTTP GET `/v1/credit_notes/preview/lines`
   */
  void getCreditNotesPreviewLines(
      GetCreditNotesPreviewLinesParams params,
      GetCreditNotesPreviewLinesResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.GET,
        Servers.getServerUrl(),
        "/v1/credit_notes/preview/lines");
    if (!params.amount.isNull)
      requestor.setQueryParam("amount", params.amount.get.to!string);
    if (!params.credit_amount.isNull)
      requestor.setQueryParam("credit_amount", params.credit_amount.get.to!string);
    if (!params.ending_before.isNull)
      requestor.setQueryParam("ending_before", params.ending_before.get.to!string);
    if (!params.expand.isNull)
      requestor.setQueryParam("expand", params.expand.get.to!string);
    if (!params.invoice.isNull)
      requestor.setQueryParam("invoice", params.invoice.get.to!string);
    if (!params.limit.isNull)
      requestor.setQueryParam("limit", params.limit.get.to!string);
    if (!params.lines.isNull)
      requestor.setQueryParam("lines", params.lines.get.to!string);
    if (!params.memo.isNull)
      requestor.setQueryParam("memo", params.memo.get.to!string);
    if (!params.metadata.isNull)
      requestor.setQueryParam("metadata", params.metadata.get.to!string);
    if (!params.out_of_band_amount.isNull)
      requestor.setQueryParam("out_of_band_amount", params.out_of_band_amount.get.to!string);
    if (!params.reason.isNull)
      requestor.setQueryParam("reason", params.reason.get.to!string);
    if (!params.refund.isNull)
      requestor.setQueryParam("refund", params.refund.get.to!string);
    if (!params.refund_amount.isNull)
      requestor.setQueryParam("refund_amount", params.refund_amount.get.to!string);
    if (!params.starting_after.isNull)
      requestor.setQueryParam("starting_after", params.starting_after.get.to!string);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

}

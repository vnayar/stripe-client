// File automatically generated from OpenAPI spec.
module stripe.service.v1_credit_notes_preview_lines_service;

import vibe.http.client : requestHTTP, HTTPClientRequest, HTTPClientResponse;
import vibe.http.common : HTTPMethod;
import vibe.stream.operations : readAllUTF8;
import vibe.data.serialization : optional;
import vibe.data.json : Json, deserializeJson;

import stripe.servers : Servers;
import stripe.security : Security;
import openapi_client.util : isNull;
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
    Nullable!(int) amount;

    /**
     * The integer amount in cents (or local equivalent) representing the amount to credit the
     * customer's balance, which will be automatically applied to their next invoice.
     */
    Nullable!(int) credit_amount;

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
     * ID of the invoice.
     */
    string invoice;

    /**
     * A limit on the number of objects to be returned. Limit can range between 1 and 100, and the
     * default is 10.
     */
    Nullable!(int) limit;

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
      string invoice_line_item;

      @optional
      string unit_amount_decimal;

      @optional
      string description;

      @optional
      string type;

      @optional
      Json tax_rates;

    }

    CreditNoteLineItemParams[] lines;

    /**
     * The credit note's memo appears on the credit note PDF.
     */
    string memo;

    /**
     * Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an
     * object. This can be useful for storing additional information about the object in a
     * structured format. Individual keys can be unset by posting an empty value to them. All keys
     * can be unset by posting an empty value to `metadata`.
     */
    string[string] metadata;

    /**
     * The integer amount in cents (or local equivalent) representing the amount that is credited
     * outside of Stripe.
     */
    Nullable!(int) out_of_band_amount;

    /**
     * Reason for issuing this credit note, one of `duplicate`, `fraudulent`, `order_change`, or
     * `product_unsatisfactory`
     */
    string reason;

    /**
     * ID of an existing refund to link this credit note to.
     */
    string refund;

    /**
     * The integer amount in cents (or local equivalent) representing the amount to refund. If set,
     * a refund will be created for the charge associated with the invoice.
     */
    Nullable!(int) refund_amount;

    /**
     * A cursor for use in pagination. `starting_after` is an object ID that defines your place in
     * the list. For instance, if you make a list request and receive 100 objects, ending with
     * `obj_foo`, your subsequent call can include `starting_after=obj_foo` in order to fetch the
     * next page of the list.
     */
    string starting_after;

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
      string object;

      /**
       * Details about each object.
       */
      @optional
      CreditNoteLineItem[] data;

      /**
       * The URL where this list can be accessed.
       */
      @optional
      string url;

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
        if (handleResponse200 is null) throw new Exception("Unhandled response status code 200");
        handleResponse200(deserializeJson!(CreditNoteLinesList)(res.readJson()));
        return;
      }
      if (handleResponsedefault is null) throw new Exception("Unhandled response status code default");
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
      requestor.setQueryParam!("deepObject")("amount", params.amount);
    if (!params.credit_amount.isNull)
      requestor.setQueryParam!("deepObject")("credit_amount", params.credit_amount);
    if (!params.ending_before.isNull)
      requestor.setQueryParam!("deepObject")("ending_before", params.ending_before);
    if (!params.expand.isNull)
      requestor.setQueryParam!("deepObject")("expand", params.expand);
    if (!params.invoice.isNull)
      requestor.setQueryParam!("deepObject")("invoice", params.invoice);
    if (!params.limit.isNull)
      requestor.setQueryParam!("deepObject")("limit", params.limit);
    if (!params.lines.isNull)
      requestor.setQueryParam!("deepObject")("lines", params.lines);
    if (!params.memo.isNull)
      requestor.setQueryParam!("deepObject")("memo", params.memo);
    if (!params.metadata.isNull)
      requestor.setQueryParam!("deepObject")("metadata", params.metadata);
    if (!params.out_of_band_amount.isNull)
      requestor.setQueryParam!("deepObject")("out_of_band_amount", params.out_of_band_amount);
    if (!params.reason.isNull)
      requestor.setQueryParam!("deepObject")("reason", params.reason);
    if (!params.refund.isNull)
      requestor.setQueryParam!("deepObject")("refund", params.refund);
    if (!params.refund_amount.isNull)
      requestor.setQueryParam!("deepObject")("refund_amount", params.refund_amount);
    if (!params.starting_after.isNull)
      requestor.setQueryParam!("deepObject")("starting_after", params.starting_after);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

}

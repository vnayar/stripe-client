// File automatically generated from OpenAPI spec.
module stripe.service.v1_credit_notes_preview_service;

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

public import stripe.model.credit_note : CreditNote;
public import stripe.model.error : Error_;

/**
 * Service to make REST API calls to paths beginning with: /v1/credit_notes/preview
 */
class V1CreditNotesPreviewService {
  static class GetCreditNotesPreviewParams {
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
     * Specifies which fields in the response should be expanded.
     */
    string[] expand;

    /**
     * ID of the invoice.
     */
    string invoice;

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

  }

  static class GetCreditNotesPreviewResponseHandler : ResponseHandler {

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
        if (handleResponse200 is null) throw new Exception("Unhandled response status code 200");
        handleResponse200(deserializeJson!(CreditNote)(res.readJson()));
        return;
      }
      if (handleResponsedefault is null) throw new Exception("Unhandled response status code default");
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   * <p>Get a preview of a credit note without creating it.</p>
   * See_Also: HTTP GET `/v1/credit_notes/preview`
   */
  void getCreditNotesPreview(
      GetCreditNotesPreviewParams params,
      GetCreditNotesPreviewResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.GET,
        Servers.getServerUrl(),
        "/v1/credit_notes/preview");
    if (!params.amount.isNull)
      requestor.setQueryParam!("deepObject")("amount", params.amount);
    if (!params.credit_amount.isNull)
      requestor.setQueryParam!("deepObject")("credit_amount", params.credit_amount);
    if (!params.expand.isNull)
      requestor.setQueryParam!("deepObject")("expand", params.expand);
    if (!params.invoice.isNull)
      requestor.setQueryParam!("deepObject")("invoice", params.invoice);
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
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

}

// File automatically generated from OpenAPI spec.
module stripe.service.v1_credit_notes_preview_service;

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
    Nullable!(Nullable!(int)) amount;

    /**
     * The integer amount in cents (or local equivalent) representing the amount to credit the
     * customer's balance, which will be automatically applied to their next invoice.
     */
    Nullable!(Nullable!(int)) credit_amount;

    /**
     * Specifies which fields in the response should be expanded.
     */
    Nullable!(Nullable!(string)[]) expand;

    /**
     * ID of the invoice.
     */
    Nullable!(Nullable!(string)) invoice;

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
        handleResponse200(deserializeJson!(CreditNote)(res.readJson()));
        return;
      }
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   */
  void getCreditNotesPreview(
      GetCreditNotesPreviewParams params,
      GetCreditNotesPreviewResponseHandler responseHandler = null,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.GET,
        Servers.getServerUrl(),
        "/v1/credit_notes/preview");
    if (!params.amount.isNull)
      requestor.setQueryParam("amount", params.amount.get.to!string);
    if (!params.credit_amount.isNull)
      requestor.setQueryParam("credit_amount", params.credit_amount.get.to!string);
    if (!params.expand.isNull)
      requestor.setQueryParam("expand", params.expand.get.to!string);
    if (!params.invoice.isNull)
      requestor.setQueryParam("invoice", params.invoice.get.to!string);
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
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

}
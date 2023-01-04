// File automatically generated from OpenAPI spec.
module stripe.service.v1_treasury_outbound_transfers_service;

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

public import stripe.model.error : Error_;
public import stripe.model.treasury.outbound_transfer : TreasuryOutboundTransfer;

/**
 * Service to make REST API calls to paths beginning with: /v1/treasury/outbound_transfers
 */
class V1TreasuryOutboundTransfersService {
  static class GetTreasuryOutboundTransfersParams {
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
     * Returns objects associated with this FinancialAccount.
     */
    string financial_account;

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
     * Only return OutboundTransfers that have the given status: `processing`, `canceled`, `failed`,
     * `posted`, or `returned`.
     */
    string status;

  }

  static class GetTreasuryOutboundTransfersResponseHandler : ResponseHandler {

    static class TreasuryOutboundTransfersResourceOutboundTransferList {
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
      TreasuryOutboundTransfer[] data;

      /**
       * The URL where this list can be accessed.
       */
      @optional
      string url;

    }

    /**
     * Successful response.
     */
    void delegate(TreasuryOutboundTransfersResourceOutboundTransferList response) handleResponse200;

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
        handleResponse200(deserializeJson!(TreasuryOutboundTransfersResourceOutboundTransferList)(res.readJson()));
        return;
      }
      if (handleResponsedefault is null) throw new Exception("Unhandled response status code default");
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   * <p>Returns a list of OutboundTransfers sent from the specified FinancialAccount.</p>
   * See_Also: HTTP GET `/v1/treasury/outbound_transfers`
   */
  void getTreasuryOutboundTransfers(
      GetTreasuryOutboundTransfersParams params,
      GetTreasuryOutboundTransfersResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.GET,
        Servers.getServerUrl(),
        "/v1/treasury/outbound_transfers");
    if (!params.ending_before.isNull)
      requestor.setQueryParam!("deepObject")("ending_before", params.ending_before);
    if (!params.expand.isNull)
      requestor.setQueryParam!("deepObject")("expand", params.expand);
    if (!params.financial_account.isNull)
      requestor.setQueryParam!("deepObject")("financial_account", params.financial_account);
    if (!params.limit.isNull)
      requestor.setQueryParam!("deepObject")("limit", params.limit);
    if (!params.starting_after.isNull)
      requestor.setQueryParam!("deepObject")("starting_after", params.starting_after);
    if (!params.status.isNull)
      requestor.setQueryParam!("deepObject")("status", params.status);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class PostTreasuryOutboundTransfersBody {
    /**
     * Amount (in cents) to be transferred.
     */
    @optional
    Nullable!(int) amount;

    /**
     * Statement descriptor to be shown on the receiving end of an OutboundTransfer. Maximum 10
     * characters for `ach` transfers or 140 characters for `wire` transfers. The default value is
     * `transfer`.
     */
    @optional
    string statement_descriptor;

    /**
     * Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an
     * object. This can be useful for storing additional information about the object in a
     * structured format. Individual keys can be unset by posting an empty value to them. All keys
     * can be unset by posting an empty value to `metadata`.
     */
    @optional
    string[string] metadata;

    /**
     * Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in
     * lowercase. Must be a [supported currency](https://stripe.com/docs/currencies).
     */
    @optional
    string currency;

    /**
     * The PaymentMethod to use as the payment instrument for the OutboundTransfer.
     */
    @optional
    string destination_payment_method;

    static class PaymentMethodOptions {
      @optional
      Json us_bank_account;

    }

    /**
     * Hash describing payment method configuration details.
     */
    @optional
    PaymentMethodOptions destination_payment_method_options;

    /**
     * Specifies which fields in the response should be expanded.
     */
    @optional
    string[] expand;

    /**
     * The FinancialAccount to pull funds from.
     */
    @optional
    string financial_account;

    /**
     * An arbitrary string attached to the object. Often useful for displaying to users.
     */
    @optional
    string description;

  }

  static class PostTreasuryOutboundTransfersResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(TreasuryOutboundTransfer response) handleResponse200;

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
        handleResponse200(deserializeJson!(TreasuryOutboundTransfer)(res.readJson()));
        return;
      }
      if (handleResponsedefault is null) throw new Exception("Unhandled response status code default");
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   * <p>Creates an OutboundTransfer.</p>
   * See_Also: HTTP POST `/v1/treasury/outbound_transfers`
   */
  void postTreasuryOutboundTransfers(
      PostTreasuryOutboundTransfersBody requestBody,
      PostTreasuryOutboundTransfersResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/treasury/outbound_transfers");
    requestor.setHeaderParam("Content-Type", "application/x-www-form-urlencoded");
    Security.apply(requestor);
    requestor.makeRequest(requestBody, responseHandler);
  }

  static class GetTreasuryOutboundTransfersOutboundTransferParams {
    /**
     * Specifies which fields in the response should be expanded.
     */
    string[] expand;

    /**
     */
    string outbound_transfer;

  }

  static class GetTreasuryOutboundTransfersOutboundTransferResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(TreasuryOutboundTransfer response) handleResponse200;

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
        handleResponse200(deserializeJson!(TreasuryOutboundTransfer)(res.readJson()));
        return;
      }
      if (handleResponsedefault is null) throw new Exception("Unhandled response status code default");
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   * <p>Retrieves the details of an existing OutboundTransfer by passing the unique OutboundTransfer
   * ID from either the OutboundTransfer creation request or OutboundTransfer list.</p>
   * See_Also: HTTP GET `/v1/treasury/outbound_transfers/{outbound_transfer}`
   */
  void getTreasuryOutboundTransfersOutboundTransfer(
      GetTreasuryOutboundTransfersOutboundTransferParams params,
      GetTreasuryOutboundTransfersOutboundTransferResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.GET,
        Servers.getServerUrl(),
        "/v1/treasury/outbound_transfers/{outbound_transfer}");
    if (!params.expand.isNull)
      requestor.setQueryParam!("deepObject")("expand", params.expand);
    if (!params.outbound_transfer.isNull)
      requestor.setPathParam("outbound_transfer", params.outbound_transfer);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class PostTreasuryOutboundTransfersOutboundTransferCancelParams {
    /**
     */
    string outbound_transfer;

  }

  static class PostTreasuryOutboundTransfersOutboundTransferCancelResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(TreasuryOutboundTransfer response) handleResponse200;

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
        handleResponse200(deserializeJson!(TreasuryOutboundTransfer)(res.readJson()));
        return;
      }
      if (handleResponsedefault is null) throw new Exception("Unhandled response status code default");
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   * <p>An OutboundTransfer can be canceled if the funds have not yet been paid out.</p>
   * See_Also: HTTP POST `/v1/treasury/outbound_transfers/{outbound_transfer}/cancel`
   */
  void postTreasuryOutboundTransfersOutboundTransferCancel(
      PostTreasuryOutboundTransfersOutboundTransferCancelParams params,
      PostTreasuryOutboundTransfersOutboundTransferCancelResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/treasury/outbound_transfers/{outbound_transfer}/cancel");
    if (!params.outbound_transfer.isNull)
      requestor.setPathParam("outbound_transfer", params.outbound_transfer);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

}

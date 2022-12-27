// File automatically generated from OpenAPI spec.
module stripe.service.v1_treasury_inbound_transfers_service;

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

public import stripe.model.error : Error_;
public import stripe.model.treasury.inbound_transfer : TreasuryInboundTransfer;
/**
 * Service to make REST API calls to paths beginning with: /v1/treasury/inbound_transfers
 */
class V1TreasuryInboundTransfersService {
  static class GetTreasuryInboundTransfersIdParams {
    /**
     * Specifies which fields in the response should be expanded.
     */
    Nullable!(Nullable!(string)[]) expand;

    /**
     */
    Nullable!(Nullable!(string)) id;

  }

  static class GetTreasuryInboundTransfersIdResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(TreasuryInboundTransfer response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponsedefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        handleResponse200(deserializeJson!(TreasuryInboundTransfer)(res.readJson()));
        return;
      }
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   */
  void getTreasuryInboundTransfersId(
      GetTreasuryInboundTransfersIdParams params,
      GetTreasuryInboundTransfersIdResponseHandler responseHandler = null,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.GET,
        Servers.getServerUrl(),
        "/v1/treasury/inbound_transfers/{id}");
    if (!params.expand.isNull)
      requestor.setQueryParam("expand", params.expand.get.to!string);
    if (!params.id.isNull)
      requestor.setPathParam("id", params.id.get.to!string);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class GetTreasuryInboundTransfersParams {
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
     * Returns objects associated with this FinancialAccount.
     */
    Nullable!(Nullable!(string)) financial_account;

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
     * Only return InboundTransfers that have the given status: `processing`, `succeeded`, `failed`
     * or `canceled`.
     */
    Nullable!(Nullable!(string)) status;

  }

  static class GetTreasuryInboundTransfersResponseHandler : ResponseHandler {

    static class TreasuryInboundTransfersResourceInboundTransferList {
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
      TreasuryInboundTransfer[] data;

      /**
       * The URL where this list can be accessed.
       */
      @optional
      Nullable!(string) url;

    }

    /**
     * Successful response.
     */
    void delegate(TreasuryInboundTransfersResourceInboundTransferList response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponsedefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        handleResponse200(deserializeJson!(TreasuryInboundTransfersResourceInboundTransferList)(res.readJson()));
        return;
      }
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   */
  void getTreasuryInboundTransfers(
      GetTreasuryInboundTransfersParams params,
      GetTreasuryInboundTransfersResponseHandler responseHandler = null,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.GET,
        Servers.getServerUrl(),
        "/v1/treasury/inbound_transfers");
    if (!params.ending_before.isNull)
      requestor.setQueryParam("ending_before", params.ending_before.get.to!string);
    if (!params.expand.isNull)
      requestor.setQueryParam("expand", params.expand.get.to!string);
    if (!params.financial_account.isNull)
      requestor.setQueryParam("financial_account", params.financial_account.get.to!string);
    if (!params.limit.isNull)
      requestor.setQueryParam("limit", params.limit.get.to!string);
    if (!params.starting_after.isNull)
      requestor.setQueryParam("starting_after", params.starting_after.get.to!string);
    if (!params.status.isNull)
      requestor.setQueryParam("status", params.status.get.to!string);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class PostTreasuryInboundTransfersBody {
    /**
     * Amount (in cents) to be transferred.
     */
    @optional
    Nullable!(int) amount;

    /**
     * The complete description that appears on your customers' statements. Maximum 10 characters.
     */
    @optional
    Nullable!(string) statement_descriptor;

    /**
     * Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an
     * object. This can be useful for storing additional information about the object in a
     * structured format. Individual keys can be unset by posting an empty value to them. All keys
     * can be unset by posting an empty value to `metadata`.
     */
    @optional
    Nullable!(string)[string] metadata;

    /**
     * Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in
     * lowercase. Must be a [supported currency](https://stripe.com/docs/currencies).
     */
    @optional
    Nullable!(string) currency;

    /**
     * The origin payment method to be debited for the InboundTransfer.
     */
    @optional
    Nullable!(string) origin_payment_method;

    /**
     * Specifies which fields in the response should be expanded.
     */
    @optional
    Nullable!(string)[] expand;

    /**
     * The FinancialAccount to send funds to.
     */
    @optional
    Nullable!(string) financial_account;

    /**
     * An arbitrary string attached to the object. Often useful for displaying to users.
     */
    @optional
    Nullable!(string) description;

  }

  static class PostTreasuryInboundTransfersResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(TreasuryInboundTransfer response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponsedefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        handleResponse200(deserializeJson!(TreasuryInboundTransfer)(res.readJson()));
        return;
      }
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   */
  void postTreasuryInboundTransfers(
      PostTreasuryInboundTransfersBody requestBody,
      PostTreasuryInboundTransfersResponseHandler responseHandler = null,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/treasury/inbound_transfers");
    Security.apply(requestor);
    requestor.makeRequest(requestBody, responseHandler);
  }

  static class PostTreasuryInboundTransfersInboundTransferCancelParams {
    /**
     */
    Nullable!(Nullable!(string)) inbound_transfer;

  }

  static class PostTreasuryInboundTransfersInboundTransferCancelResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(TreasuryInboundTransfer response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponsedefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        handleResponse200(deserializeJson!(TreasuryInboundTransfer)(res.readJson()));
        return;
      }
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   */
  void postTreasuryInboundTransfersInboundTransferCancel(
      PostTreasuryInboundTransfersInboundTransferCancelParams params,
      PostTreasuryInboundTransfersInboundTransferCancelResponseHandler responseHandler = null,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/treasury/inbound_transfers/{inbound_transfer}/cancel");
    if (!params.inbound_transfer.isNull)
      requestor.setPathParam("inbound_transfer", params.inbound_transfer.get.to!string);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

}

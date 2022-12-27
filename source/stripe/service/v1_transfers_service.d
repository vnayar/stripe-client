// File automatically generated from OpenAPI spec.
module stripe.service.v1_transfers_service;

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
public import stripe.model.transfer : Transfer;
public import stripe.model.transfer_reversal : TransferReversal;
/**
 * Service to make REST API calls to paths beginning with: /v1/transfers
 */
class V1TransfersService {
  static class GetTransfersTransferReversalsIdParams {
    /**
     * Specifies which fields in the response should be expanded.
     */
    Nullable!(Nullable!(string)[]) expand;

    /**
     */
    Nullable!(Nullable!(string)) id;

    /**
     */
    Nullable!(Nullable!(string)) transfer;

  }

  static class GetTransfersTransferReversalsIdResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(TransferReversal response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponsedefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        handleResponse200(deserializeJson!(TransferReversal)(res.readJson()));
        return;
      }
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   */
  void getTransfersTransferReversalsId(
      GetTransfersTransferReversalsIdParams params,
      GetTransfersTransferReversalsIdResponseHandler responseHandler = null,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.GET,
        Servers.getServerUrl(),
        "/v1/transfers/{transfer}/reversals/{id}");
    if (!params.expand.isNull)
      requestor.setQueryParam("expand", params.expand.get.to!string);
    if (!params.id.isNull)
      requestor.setPathParam("id", params.id.get.to!string);
    if (!params.transfer.isNull)
      requestor.setPathParam("transfer", params.transfer.get.to!string);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class PostTransfersTransferReversalsIdParams {
    /**
     */
    Nullable!(Nullable!(string)) id;

    /**
     */
    Nullable!(Nullable!(string)) transfer;

  }

  static class PostTransfersTransferReversalsIdResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(TransferReversal response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponsedefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        handleResponse200(deserializeJson!(TransferReversal)(res.readJson()));
        return;
      }
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   */
  void postTransfersTransferReversalsId(
      PostTransfersTransferReversalsIdParams params,
      PostTransfersTransferReversalsIdResponseHandler responseHandler = null,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/transfers/{transfer}/reversals/{id}");
    if (!params.id.isNull)
      requestor.setPathParam("id", params.id.get.to!string);
    if (!params.transfer.isNull)
      requestor.setPathParam("transfer", params.transfer.get.to!string);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class GetTransfersIdReversalsParams {
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
    Nullable!(Nullable!(string)) id;

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

  static class GetTransfersIdReversalsResponseHandler : ResponseHandler {

    static class TransferReversalList {
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
      TransferReversal[] data;

      /**
       * The URL where this list can be accessed.
       */
      @optional
      Nullable!(string) url;

    }

    /**
     * Successful response.
     */
    void delegate(TransferReversalList response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponsedefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        handleResponse200(deserializeJson!(TransferReversalList)(res.readJson()));
        return;
      }
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   */
  void getTransfersIdReversals(
      GetTransfersIdReversalsParams params,
      GetTransfersIdReversalsResponseHandler responseHandler = null,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.GET,
        Servers.getServerUrl(),
        "/v1/transfers/{id}/reversals");
    if (!params.ending_before.isNull)
      requestor.setQueryParam("ending_before", params.ending_before.get.to!string);
    if (!params.expand.isNull)
      requestor.setQueryParam("expand", params.expand.get.to!string);
    if (!params.id.isNull)
      requestor.setPathParam("id", params.id.get.to!string);
    if (!params.limit.isNull)
      requestor.setQueryParam("limit", params.limit.get.to!string);
    if (!params.starting_after.isNull)
      requestor.setQueryParam("starting_after", params.starting_after.get.to!string);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class PostTransfersIdReversalsParams {
    /**
     */
    Nullable!(Nullable!(string)) id;

  }

  static class PostTransfersIdReversalsResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(TransferReversal response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponsedefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        handleResponse200(deserializeJson!(TransferReversal)(res.readJson()));
        return;
      }
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   */
  void postTransfersIdReversals(
      PostTransfersIdReversalsParams params,
      PostTransfersIdReversalsResponseHandler responseHandler = null,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/transfers/{id}/reversals");
    if (!params.id.isNull)
      requestor.setPathParam("id", params.id.get.to!string);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class GetTransfersParams {
    /**
     */
    Nullable!(Json) created;

    /**
     * Only return transfers for the destination specified by this account ID.
     */
    Nullable!(Nullable!(string)) destination;

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
     * Only return transfers with the specified transfer group.
     */
    Nullable!(Nullable!(string)) transfer_group;

  }

  static class GetTransfersResponseHandler : ResponseHandler {

    static class TransferList {
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
      Transfer[] data;

      /**
       * The URL where this list can be accessed.
       */
      @optional
      Nullable!(string) url;

    }

    /**
     * Successful response.
     */
    void delegate(TransferList response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponsedefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        handleResponse200(deserializeJson!(TransferList)(res.readJson()));
        return;
      }
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   */
  void getTransfers(
      GetTransfersParams params,
      GetTransfersResponseHandler responseHandler = null,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.GET,
        Servers.getServerUrl(),
        "/v1/transfers");
    if (!params.created.isNull)
      requestor.setQueryParam("created", params.created.get.to!string);
    if (!params.destination.isNull)
      requestor.setQueryParam("destination", params.destination.get.to!string);
    if (!params.ending_before.isNull)
      requestor.setQueryParam("ending_before", params.ending_before.get.to!string);
    if (!params.expand.isNull)
      requestor.setQueryParam("expand", params.expand.get.to!string);
    if (!params.limit.isNull)
      requestor.setQueryParam("limit", params.limit.get.to!string);
    if (!params.starting_after.isNull)
      requestor.setQueryParam("starting_after", params.starting_after.get.to!string);
    if (!params.transfer_group.isNull)
      requestor.setQueryParam("transfer_group", params.transfer_group.get.to!string);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class PostTransfersBody {
    /**
     * A positive integer in cents (or local equivalent) representing how much to transfer.
     */
    @optional
    Nullable!(int) amount;

    /**
     * A string that identifies this transaction as part of a group. See the [Connect
     * documentation](https://stripe.com/docs/connect/charges-transfers#transfer-options) for
     * details.
     */
    @optional
    Nullable!(string) transfer_group;

    /**
     * The source balance to use for this transfer. One of `bank_account`, `card`, or `fpx`. For
     * most users, this will default to `card`.
     */
    @optional
    Nullable!(string) source_type;

    /**
     * The ID of a connected Stripe account. <a href="/docs/connect/charges-transfers">See the
     * Connect documentation</a> for details.
     */
    @optional
    Nullable!(string) destination;

    /**
     * Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an
     * object. This can be useful for storing additional information about the object in a
     * structured format. Individual keys can be unset by posting an empty value to them. All keys
     * can be unset by posting an empty value to `metadata`.
     */
    @optional
    Nullable!(string)[string] metadata;

    /**
     * 3-letter [ISO code for currency](https://stripe.com/docs/payouts).
     */
    @optional
    Nullable!(string) currency;

    /**
     * Specifies which fields in the response should be expanded.
     */
    @optional
    Nullable!(string)[] expand;

    /**
     * You can use this parameter to transfer funds from a charge before they are added to your
     * available balance. A pending balance will transfer immediately but the funds will not become
     * available until the original charge becomes available. [See the Connect
     * documentation](https://stripe.com/docs/connect/charges-transfers#transfer-availability) for
     * details.
     */
    @optional
    Nullable!(string) source_transaction;

    /**
     * An arbitrary string attached to the object. Often useful for displaying to users.
     */
    @optional
    Nullable!(string) description;

  }

  static class PostTransfersResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(Transfer response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponsedefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        handleResponse200(deserializeJson!(Transfer)(res.readJson()));
        return;
      }
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   */
  void postTransfers(
      PostTransfersBody requestBody,
      PostTransfersResponseHandler responseHandler = null,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/transfers");
    Security.apply(requestor);
    requestor.makeRequest(requestBody, responseHandler);
  }

  static class GetTransfersTransferParams {
    /**
     * Specifies which fields in the response should be expanded.
     */
    Nullable!(Nullable!(string)[]) expand;

    /**
     */
    Nullable!(Nullable!(string)) transfer;

  }

  static class GetTransfersTransferResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(Transfer response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponsedefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        handleResponse200(deserializeJson!(Transfer)(res.readJson()));
        return;
      }
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   */
  void getTransfersTransfer(
      GetTransfersTransferParams params,
      GetTransfersTransferResponseHandler responseHandler = null,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.GET,
        Servers.getServerUrl(),
        "/v1/transfers/{transfer}");
    if (!params.expand.isNull)
      requestor.setQueryParam("expand", params.expand.get.to!string);
    if (!params.transfer.isNull)
      requestor.setPathParam("transfer", params.transfer.get.to!string);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class PostTransfersTransferParams {
    /**
     */
    Nullable!(Nullable!(string)) transfer;

  }

  static class PostTransfersTransferResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(Transfer response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponsedefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        handleResponse200(deserializeJson!(Transfer)(res.readJson()));
        return;
      }
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   */
  void postTransfersTransfer(
      PostTransfersTransferParams params,
      PostTransfersTransferResponseHandler responseHandler = null,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/transfers/{transfer}");
    if (!params.transfer.isNull)
      requestor.setPathParam("transfer", params.transfer.get.to!string);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

}

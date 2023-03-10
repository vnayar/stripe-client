// File automatically generated from OpenAPI spec.
module stripe.service.v1_transfers_service;

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
    string[] expand;

    /**
     */
    string id;

    /**
     */
    string transfer;

    mixin AddBuilder!(typeof(this));

  }

  static class GetTransfersTransferReversalsIdResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(TransferReversal response) handleResponse200;

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
        handleResponse200(deserializeJson!(TransferReversal)(res.readJson()));
        return;
      }
      if (handleResponseDefault is null) throw new Exception("Unhandled response status code default");
      handleResponseDefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

  }

  /**
   * <p>By default, you can see the 10 most recent reversals stored directly on the transfer object,
   * but you can also retrieve details about a specific reversal stored on the transfer.</p>
   * See_Also: HTTP GET `/v1/transfers/{transfer}/reversals/{id}`
   */
  void getTransfersTransferReversalsId(
      GetTransfersTransferReversalsIdParams params,
      GetTransfersTransferReversalsIdResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.GET,
        Servers.getServerUrl(),
        "/v1/transfers/{transfer}/reversals/{id}");
    if (!params.expand.isNull)
      requestor.setQueryParam!("deepObject")("expand", params.expand);
    if (!params.id.isNull)
      requestor.setPathParam("id", params.id);
    if (!params.transfer.isNull)
      requestor.setPathParam("transfer", params.transfer);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class PostTransfersTransferReversalsIdParams {
    /**
     */
    string id;

    /**
     */
    string transfer;

    mixin AddBuilder!(typeof(this));

  }

  static class PostTransfersTransferReversalsIdBody {
    /**
     * Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an
     * object. This can be useful for storing additional information about the object in a
     * structured format. Individual keys can be unset by posting an empty value to them. All keys
     * can be unset by posting an empty value to `metadata`.
     */
    @optional
    Json metadata;

    /**
     * Specifies which fields in the response should be expanded.
     */
    @optional
    string[] expand;

    mixin AddBuilder!(typeof(this));

  }

  static class PostTransfersTransferReversalsIdResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(TransferReversal response) handleResponse200;

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
        handleResponse200(deserializeJson!(TransferReversal)(res.readJson()));
        return;
      }
      if (handleResponseDefault is null) throw new Exception("Unhandled response status code default");
      handleResponseDefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

  }

  /**
   * <p>Updates the specified reversal by setting the values of the parameters passed. Any
   * parameters not provided will be left unchanged.</p>
   * <p>This request only accepts metadata and description as arguments.</p>
   * See_Also: HTTP POST `/v1/transfers/{transfer}/reversals/{id}`
   */
  void postTransfersTransferReversalsId(
      PostTransfersTransferReversalsIdParams params,
      PostTransfersTransferReversalsIdBody requestBody,
      PostTransfersTransferReversalsIdResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/transfers/{transfer}/reversals/{id}");
    if (!params.id.isNull)
      requestor.setPathParam("id", params.id);
    if (!params.transfer.isNull)
      requestor.setPathParam("transfer", params.transfer);
    requestor.setHeaderParam("Content-Type", "application/x-www-form-urlencoded");
    Security.apply(requestor);
    requestor.makeRequest(requestBody, responseHandler);
  }

  static class GetTransfersIdReversalsParams {
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
    string id;

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
      string object;

      /**
       * Details about each object.
       */
      @optional
      TransferReversal[] data;

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
    void delegate(TransferReversalList response) handleResponse200;

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
        handleResponse200(deserializeJson!(TransferReversalList)(res.readJson()));
        return;
      }
      if (handleResponseDefault is null) throw new Exception("Unhandled response status code default");
      handleResponseDefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

  }

  /**
   * <p>You can see a list of the reversals belonging to a specific transfer. Note that the 10 most
   * recent reversals are always available by default on the transfer object. If you need more than
   * those 10, you can use this API method and the <code>limit</code> and
   * <code>starting_after</code> parameters to page through additional reversals.</p>
   * See_Also: HTTP GET `/v1/transfers/{id}/reversals`
   */
  void getTransfersIdReversals(
      GetTransfersIdReversalsParams params,
      GetTransfersIdReversalsResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.GET,
        Servers.getServerUrl(),
        "/v1/transfers/{id}/reversals");
    if (!params.ending_before.isNull)
      requestor.setQueryParam!("deepObject")("ending_before", params.ending_before);
    if (!params.expand.isNull)
      requestor.setQueryParam!("deepObject")("expand", params.expand);
    if (!params.id.isNull)
      requestor.setPathParam("id", params.id);
    if (!params.limit.isNull)
      requestor.setQueryParam!("deepObject")("limit", params.limit);
    if (!params.starting_after.isNull)
      requestor.setQueryParam!("deepObject")("starting_after", params.starting_after);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class PostTransfersIdReversalsParams {
    /**
     */
    string id;

    mixin AddBuilder!(typeof(this));

  }

  static class PostTransfersIdReversalsBody {
    /**
     * An arbitrary string which you can attach to a reversal object. It is displayed alongside the
     * reversal in the Dashboard. This will be unset if you POST an empty value.
     */
    @optional
    string description;

    /**
     * Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an
     * object. This can be useful for storing additional information about the object in a
     * structured format. Individual keys can be unset by posting an empty value to them. All keys
     * can be unset by posting an empty value to `metadata`.
     */
    @optional
    Json metadata;

    /**
     * A positive integer in cents (or local equivalent) representing how much of this transfer to
     * reverse. Can only reverse up to the unreversed amount remaining of the transfer. Partial
     * transfer reversals are only allowed for transfers to Stripe Accounts. Defaults to the entire
     * transfer amount.
     */
    @optional
    Nullable!(int) amount;

    /**
     * Specifies which fields in the response should be expanded.
     */
    @optional
    string[] expand;

    /**
     * Boolean indicating whether the application fee should be refunded when reversing this
     * transfer. If a full transfer reversal is given, the full application fee will be refunded.
     * Otherwise, the application fee will be refunded with an amount proportional to the amount of
     * the transfer reversed.
     */
    @optional
    Nullable!(bool) refund_application_fee;

    mixin AddBuilder!(typeof(this));

  }

  static class PostTransfersIdReversalsResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(TransferReversal response) handleResponse200;

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
        handleResponse200(deserializeJson!(TransferReversal)(res.readJson()));
        return;
      }
      if (handleResponseDefault is null) throw new Exception("Unhandled response status code default");
      handleResponseDefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

  }

  /**
   * <p>When you create a new reversal, you must specify a transfer to create it on.</p>
   * <p>When reversing transfers, you can optionally reverse part of the transfer. You can do so as
   * many times as you wish until the entire transfer has been reversed.</p>
   * <p>Once entirely reversed, a transfer can???t be reversed again. This method will return an
   * error when called on an already-reversed transfer, or when trying to reverse more money than is
   * left on a transfer.</p>
   * See_Also: HTTP POST `/v1/transfers/{id}/reversals`
   */
  void postTransfersIdReversals(
      PostTransfersIdReversalsParams params,
      PostTransfersIdReversalsBody requestBody,
      PostTransfersIdReversalsResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/transfers/{id}/reversals");
    if (!params.id.isNull)
      requestor.setPathParam("id", params.id);
    requestor.setHeaderParam("Content-Type", "application/x-www-form-urlencoded");
    Security.apply(requestor);
    requestor.makeRequest(requestBody, responseHandler);
  }

  static class GetTransfersParams {
    /**
     */
    Json created;

    /**
     * Only return transfers for the destination specified by this account ID.
     */
    string destination;

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
     * Only return transfers with the specified transfer group.
     */
    string transfer_group;

    mixin AddBuilder!(typeof(this));

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
      string object;

      /**
       * Details about each object.
       */
      @optional
      Transfer[] data;

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
    void delegate(TransferList response) handleResponse200;

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
        handleResponse200(deserializeJson!(TransferList)(res.readJson()));
        return;
      }
      if (handleResponseDefault is null) throw new Exception("Unhandled response status code default");
      handleResponseDefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

  }

  /**
   * <p>Returns a list of existing transfers sent to connected accounts. The transfers are returned
   * in sorted order, with the most recently created transfers appearing first.</p>
   * See_Also: HTTP GET `/v1/transfers`
   */
  void getTransfers(
      GetTransfersParams params,
      GetTransfersResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.GET,
        Servers.getServerUrl(),
        "/v1/transfers");
    if (!params.created.isNull)
      requestor.setQueryParam!("deepObject")("created", params.created);
    if (!params.destination.isNull)
      requestor.setQueryParam!("deepObject")("destination", params.destination);
    if (!params.ending_before.isNull)
      requestor.setQueryParam!("deepObject")("ending_before", params.ending_before);
    if (!params.expand.isNull)
      requestor.setQueryParam!("deepObject")("expand", params.expand);
    if (!params.limit.isNull)
      requestor.setQueryParam!("deepObject")("limit", params.limit);
    if (!params.starting_after.isNull)
      requestor.setQueryParam!("deepObject")("starting_after", params.starting_after);
    if (!params.transfer_group.isNull)
      requestor.setQueryParam!("deepObject")("transfer_group", params.transfer_group);
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
    string transfer_group;

    /**
     * The source balance to use for this transfer. One of `bank_account`, `card`, or `fpx`. For
     * most users, this will default to `card`.
     */
    @optional
    string source_type;

    /**
     * The ID of a connected Stripe account. <a href="/docs/connect/charges-transfers">See the
     * Connect documentation</a> for details.
     */
    @optional
    string destination;

    /**
     * Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an
     * object. This can be useful for storing additional information about the object in a
     * structured format. Individual keys can be unset by posting an empty value to them. All keys
     * can be unset by posting an empty value to `metadata`.
     */
    @optional
    string[string] metadata;

    /**
     * 3-letter [ISO code for currency](https://stripe.com/docs/payouts).
     */
    @optional
    string currency;

    /**
     * Specifies which fields in the response should be expanded.
     */
    @optional
    string[] expand;

    /**
     * You can use this parameter to transfer funds from a charge before they are added to your
     * available balance. A pending balance will transfer immediately but the funds will not become
     * available until the original charge becomes available. [See the Connect
     * documentation](https://stripe.com/docs/connect/charges-transfers#transfer-availability) for
     * details.
     */
    @optional
    string source_transaction;

    /**
     * An arbitrary string attached to the object. Often useful for displaying to users.
     */
    @optional
    string description;

    mixin AddBuilder!(typeof(this));

  }

  static class PostTransfersResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(Transfer response) handleResponse200;

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
        handleResponse200(deserializeJson!(Transfer)(res.readJson()));
        return;
      }
      if (handleResponseDefault is null) throw new Exception("Unhandled response status code default");
      handleResponseDefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

  }

  /**
   * <p>To send funds from your Stripe account to a connected account, you create a new transfer
   * object. Your <a href="#balance">Stripe balance</a> must be able to cover the transfer amount,
   * or you???ll receive an ???Insufficient Funds??? error.</p>
   * See_Also: HTTP POST `/v1/transfers`
   */
  void postTransfers(
      PostTransfersBody requestBody,
      PostTransfersResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/transfers");
    requestor.setHeaderParam("Content-Type", "application/x-www-form-urlencoded");
    Security.apply(requestor);
    requestor.makeRequest(requestBody, responseHandler);
  }

  static class GetTransfersTransferParams {
    /**
     * Specifies which fields in the response should be expanded.
     */
    string[] expand;

    /**
     */
    string transfer;

    mixin AddBuilder!(typeof(this));

  }

  static class GetTransfersTransferResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(Transfer response) handleResponse200;

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
        handleResponse200(deserializeJson!(Transfer)(res.readJson()));
        return;
      }
      if (handleResponseDefault is null) throw new Exception("Unhandled response status code default");
      handleResponseDefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

  }

  /**
   * <p>Retrieves the details of an existing transfer. Supply the unique transfer ID from either a
   * transfer creation request or the transfer list, and Stripe will return the corresponding
   * transfer information.</p>
   * See_Also: HTTP GET `/v1/transfers/{transfer}`
   */
  void getTransfersTransfer(
      GetTransfersTransferParams params,
      GetTransfersTransferResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.GET,
        Servers.getServerUrl(),
        "/v1/transfers/{transfer}");
    if (!params.expand.isNull)
      requestor.setQueryParam!("deepObject")("expand", params.expand);
    if (!params.transfer.isNull)
      requestor.setPathParam("transfer", params.transfer);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class PostTransfersTransferParams {
    /**
     */
    string transfer;

    mixin AddBuilder!(typeof(this));

  }

  static class PostTransfersTransferBody {
    /**
     * An arbitrary string attached to the object. Often useful for displaying to users.
     */
    @optional
    string description;

    /**
     * Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an
     * object. This can be useful for storing additional information about the object in a
     * structured format. Individual keys can be unset by posting an empty value to them. All keys
     * can be unset by posting an empty value to `metadata`.
     */
    @optional
    Json metadata;

    /**
     * Specifies which fields in the response should be expanded.
     */
    @optional
    string[] expand;

    mixin AddBuilder!(typeof(this));

  }

  static class PostTransfersTransferResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(Transfer response) handleResponse200;

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
        handleResponse200(deserializeJson!(Transfer)(res.readJson()));
        return;
      }
      if (handleResponseDefault is null) throw new Exception("Unhandled response status code default");
      handleResponseDefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

  }

  /**
   * <p>Updates the specified transfer by setting the values of the parameters passed. Any
   * parameters not provided will be left unchanged.</p>
   * <p>This request accepts only metadata as an argument.</p>
   * See_Also: HTTP POST `/v1/transfers/{transfer}`
   */
  void postTransfersTransfer(
      PostTransfersTransferParams params,
      PostTransfersTransferBody requestBody,
      PostTransfersTransferResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/transfers/{transfer}");
    if (!params.transfer.isNull)
      requestor.setPathParam("transfer", params.transfer);
    requestor.setHeaderParam("Content-Type", "application/x-www-form-urlencoded");
    Security.apply(requestor);
    requestor.makeRequest(requestBody, responseHandler);
  }

  mixin AddBuilder!(typeof(this));

}

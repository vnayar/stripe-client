// File automatically generated from OpenAPI spec.
module stripe.service.v1_treasury_transactions_service;

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
public import stripe.model.treasury.transaction : TreasuryTransaction;

/**
 * Service to make REST API calls to paths beginning with: /v1/treasury/transactions
 */
class V1TreasuryTransactionsService {
  static class GetTreasuryTransactionsIdParams {
    /**
     * Specifies which fields in the response should be expanded.
     */
    string[] expand;

    /**
     */
    string id;

    mixin AddBuilder!(typeof(this));

  }

  static class GetTreasuryTransactionsIdResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(TreasuryTransaction response) handleResponse200;

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
        handleResponse200(deserializeJson!(TreasuryTransaction)(res.readJson()));
        return;
      }
      if (handleResponsedefault is null) throw new Exception("Unhandled response status code default");
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

  }

  /**
   * <p>Retrieves the details of an existing Transaction.</p>
   * See_Also: HTTP GET `/v1/treasury/transactions/{id}`
   */
  void getTreasuryTransactionsId(
      GetTreasuryTransactionsIdParams params,
      GetTreasuryTransactionsIdResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.GET,
        Servers.getServerUrl(),
        "/v1/treasury/transactions/{id}");
    if (!params.expand.isNull)
      requestor.setQueryParam!("deepObject")("expand", params.expand);
    if (!params.id.isNull)
      requestor.setPathParam("id", params.id);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class GetTreasuryTransactionsParams {
    /**
     */
    Json created;

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
     * The results are in reverse chronological order by `created` or `posted_at`. The default is
     * `created`.
     */
    string order_by;

    /**
     * A cursor for use in pagination. `starting_after` is an object ID that defines your place in
     * the list. For instance, if you make a list request and receive 100 objects, ending with
     * `obj_foo`, your subsequent call can include `starting_after=obj_foo` in order to fetch the
     * next page of the list.
     */
    string starting_after;

    /**
     * Only return Transactions that have the given status: `open`, `posted`, or `void`.
     */
    string status;

    /**
     * A filter for the `status_transitions.posted_at` timestamp. When using this filter,
     * `status=posted` and `order_by=posted_at` must also be specified.
     */
    static class StatusTransitionTimestampSpecs {
      @optional
      Json posted_at;

      mixin AddBuilder!(typeof(this));

    }

    StatusTransitionTimestampSpecs status_transitions;

    mixin AddBuilder!(typeof(this));

  }

  static class GetTreasuryTransactionsResponseHandler : ResponseHandler {

    static class TreasuryTransactionsResourceTransactionList {
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
      TreasuryTransaction[] data;

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
    void delegate(TreasuryTransactionsResourceTransactionList response) handleResponse200;

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
        handleResponse200(deserializeJson!(TreasuryTransactionsResourceTransactionList)(res.readJson()));
        return;
      }
      if (handleResponsedefault is null) throw new Exception("Unhandled response status code default");
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

  }

  /**
   * <p>Retrieves a list of Transaction objects.</p>
   * See_Also: HTTP GET `/v1/treasury/transactions`
   */
  void getTreasuryTransactions(
      GetTreasuryTransactionsParams params,
      GetTreasuryTransactionsResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.GET,
        Servers.getServerUrl(),
        "/v1/treasury/transactions");
    if (!params.created.isNull)
      requestor.setQueryParam!("deepObject")("created", params.created);
    if (!params.ending_before.isNull)
      requestor.setQueryParam!("deepObject")("ending_before", params.ending_before);
    if (!params.expand.isNull)
      requestor.setQueryParam!("deepObject")("expand", params.expand);
    if (!params.financial_account.isNull)
      requestor.setQueryParam!("deepObject")("financial_account", params.financial_account);
    if (!params.limit.isNull)
      requestor.setQueryParam!("deepObject")("limit", params.limit);
    if (!params.order_by.isNull)
      requestor.setQueryParam!("deepObject")("order_by", params.order_by);
    if (!params.starting_after.isNull)
      requestor.setQueryParam!("deepObject")("starting_after", params.starting_after);
    if (!params.status.isNull)
      requestor.setQueryParam!("deepObject")("status", params.status);
    if (!params.status_transitions.isNull)
      requestor.setQueryParam!("deepObject")("status_transitions", params.status_transitions);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  mixin AddBuilder!(typeof(this));

}

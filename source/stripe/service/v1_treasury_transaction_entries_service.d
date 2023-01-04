// File automatically generated from OpenAPI spec.
module stripe.service.v1_treasury_transaction_entries_service;

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
public import stripe.model.treasury.transaction_entry : TreasuryTransactionEntry;

/**
 * Service to make REST API calls to paths beginning with: /v1/treasury/transaction_entries
 */
class V1TreasuryTransactionEntriesService {
  static class GetTreasuryTransactionEntriesParams {
    /**
     */
    Json created;

    /**
     */
    Json effective_at;

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
     * The results are in reverse chronological order by `created` or `effective_at`. The default is
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
     * Only return TransactionEntries associated with this Transaction.
     */
    string transaction;

  }

  static class GetTreasuryTransactionEntriesResponseHandler : ResponseHandler {

    static class TreasuryTransactionsResourceTransactionEntryList {
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
      TreasuryTransactionEntry[] data;

      /**
       * The URL where this list can be accessed.
       */
      @optional
      string url;

    }

    /**
     * Successful response.
     */
    void delegate(TreasuryTransactionsResourceTransactionEntryList response) handleResponse200;

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
        handleResponse200(deserializeJson!(TreasuryTransactionsResourceTransactionEntryList)(res.readJson()));
        return;
      }
      if (handleResponsedefault is null) throw new Exception("Unhandled response status code default");
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   * <p>Retrieves a list of TransactionEntry objects.</p>
   * See_Also: HTTP GET `/v1/treasury/transaction_entries`
   */
  void getTreasuryTransactionEntries(
      GetTreasuryTransactionEntriesParams params,
      GetTreasuryTransactionEntriesResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.GET,
        Servers.getServerUrl(),
        "/v1/treasury/transaction_entries");
    if (!params.created.isNull)
      requestor.setQueryParam!("deepObject")("created", params.created);
    if (!params.effective_at.isNull)
      requestor.setQueryParam!("deepObject")("effective_at", params.effective_at);
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
    if (!params.transaction.isNull)
      requestor.setQueryParam!("deepObject")("transaction", params.transaction);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class GetTreasuryTransactionEntriesIdParams {
    /**
     * Specifies which fields in the response should be expanded.
     */
    string[] expand;

    /**
     */
    string id;

  }

  static class GetTreasuryTransactionEntriesIdResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(TreasuryTransactionEntry response) handleResponse200;

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
        handleResponse200(deserializeJson!(TreasuryTransactionEntry)(res.readJson()));
        return;
      }
      if (handleResponsedefault is null) throw new Exception("Unhandled response status code default");
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   * <p>Retrieves a TransactionEntry object.</p>
   * See_Also: HTTP GET `/v1/treasury/transaction_entries/{id}`
   */
  void getTreasuryTransactionEntriesId(
      GetTreasuryTransactionEntriesIdParams params,
      GetTreasuryTransactionEntriesIdResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.GET,
        Servers.getServerUrl(),
        "/v1/treasury/transaction_entries/{id}");
    if (!params.expand.isNull)
      requestor.setQueryParam!("deepObject")("expand", params.expand);
    if (!params.id.isNull)
      requestor.setPathParam("id", params.id);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

}

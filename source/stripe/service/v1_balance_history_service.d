// File automatically generated from OpenAPI spec.
module stripe.service.v1_balance_history_service;

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

public import stripe.model.balance_transaction : BalanceTransaction;
public import stripe.model.error : Error_;

/**
 * Service to make REST API calls to paths beginning with: /v1/balance/history
 */
class V1BalanceHistoryService {
  static class GetBalanceHistoryParams {
    /**
     */
    Json created;

    /**
     * Only return transactions in a certain currency. Three-letter [ISO currency
     * code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported
     * currency](https://stripe.com/docs/currencies).
     */
    string currency;

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
     * For automatic Stripe payouts only, only returns transactions that were paid out on the
     * specified payout ID.
     */
    string payout;

    /**
     * Only returns the original transaction.
     */
    string source;

    /**
     * A cursor for use in pagination. `starting_after` is an object ID that defines your place in
     * the list. For instance, if you make a list request and receive 100 objects, ending with
     * `obj_foo`, your subsequent call can include `starting_after=obj_foo` in order to fetch the
     * next page of the list.
     */
    string starting_after;

    /**
     * Only returns transactions of the given type. One of: `adjustment`, `advance`,
     * `advance_funding`, `anticipation_repayment`, `application_fee`, `application_fee_refund`,
     * `charge`, `connect_collection_transfer`, `contribution`, `issuing_authorization_hold`,
     * `issuing_authorization_release`, `issuing_dispute`, `issuing_transaction`, `payment`,
     * `payment_failure_refund`, `payment_refund`, `payout`, `payout_cancel`, `payout_failure`,
     * `refund`, `refund_failure`, `reserve_transaction`, `reserved_funds`, `stripe_fee`,
     * `stripe_fx_fee`, `tax_fee`, `topup`, `topup_reversal`, `transfer`, `transfer_cancel`,
     * `transfer_failure`, or `transfer_refund`.
     */
    string type;

    mixin AddBuilder!(typeof(this));

  }

  static class GetBalanceHistoryResponseHandler : ResponseHandler {

    static class BalanceTransactionsList {
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

      @optional
      BalanceTransaction[] data;

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
    void delegate(BalanceTransactionsList response) handleResponse200;

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
        handleResponse200(deserializeJson!(BalanceTransactionsList)(res.readJson()));
        return;
      }
      if (handleResponsedefault is null) throw new Exception("Unhandled response status code default");
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

  }

  /**
   * <p>Returns a list of transactions that have contributed to the Stripe account balance (e.g.,
   * charges, transfers, and so forth). The transactions are returned in sorted order, with the most
   * recent transactions appearing first.</p>
   * <p>Note that this endpoint was previously called “Balance history” and used the path
   * <code>/v1/balance/history</code>.</p>
   * See_Also: HTTP GET `/v1/balance/history`
   */
  void getBalanceHistory(
      GetBalanceHistoryParams params,
      GetBalanceHistoryResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.GET,
        Servers.getServerUrl(),
        "/v1/balance/history");
    if (!params.created.isNull)
      requestor.setQueryParam!("deepObject")("created", params.created);
    if (!params.currency.isNull)
      requestor.setQueryParam!("deepObject")("currency", params.currency);
    if (!params.ending_before.isNull)
      requestor.setQueryParam!("deepObject")("ending_before", params.ending_before);
    if (!params.expand.isNull)
      requestor.setQueryParam!("deepObject")("expand", params.expand);
    if (!params.limit.isNull)
      requestor.setQueryParam!("deepObject")("limit", params.limit);
    if (!params.payout.isNull)
      requestor.setQueryParam!("deepObject")("payout", params.payout);
    if (!params.source.isNull)
      requestor.setQueryParam!("deepObject")("source", params.source);
    if (!params.starting_after.isNull)
      requestor.setQueryParam!("deepObject")("starting_after", params.starting_after);
    if (!params.type.isNull)
      requestor.setQueryParam!("deepObject")("type", params.type);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class GetBalanceHistoryIdParams {
    /**
     * Specifies which fields in the response should be expanded.
     */
    string[] expand;

    /**
     */
    string id;

    mixin AddBuilder!(typeof(this));

  }

  static class GetBalanceHistoryIdResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(BalanceTransaction response) handleResponse200;

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
        handleResponse200(deserializeJson!(BalanceTransaction)(res.readJson()));
        return;
      }
      if (handleResponsedefault is null) throw new Exception("Unhandled response status code default");
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

  }

  /**
   * <p>Retrieves the balance transaction with the given ID.</p>
   * <p>Note that this endpoint previously used the path <code>/v1/balance/history/:id</code>.</p>
   * See_Also: HTTP GET `/v1/balance/history/{id}`
   */
  void getBalanceHistoryId(
      GetBalanceHistoryIdParams params,
      GetBalanceHistoryIdResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.GET,
        Servers.getServerUrl(),
        "/v1/balance/history/{id}");
    if (!params.expand.isNull)
      requestor.setQueryParam!("deepObject")("expand", params.expand);
    if (!params.id.isNull)
      requestor.setPathParam("id", params.id);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  mixin AddBuilder!(typeof(this));

}

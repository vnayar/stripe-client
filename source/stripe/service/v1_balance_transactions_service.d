// File automatically generated from OpenAPI spec.
module stripe.service.v1_balance_transactions_service;

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

public import stripe.model.balance_transaction : BalanceTransaction;
public import stripe.model.error : Error_;

/**
 * Service to make REST API calls to paths beginning with: /v1/balance_transactions
 */
class V1BalanceTransactionsService {
  static class GetBalanceTransactionsParams {
    /**
     */
    Nullable!(Json) created;

    /**
     * Only return transactions in a certain currency. Three-letter [ISO currency
     * code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported
     * currency](https://stripe.com/docs/currencies).
     */
    Nullable!(Nullable!(string)) currency;

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
     * For automatic Stripe payouts only, only returns transactions that were paid out on the
     * specified payout ID.
     */
    Nullable!(Nullable!(string)) payout;

    /**
     * Only returns the original transaction.
     */
    Nullable!(Nullable!(string)) source;

    /**
     * A cursor for use in pagination. `starting_after` is an object ID that defines your place in
     * the list. For instance, if you make a list request and receive 100 objects, ending with
     * `obj_foo`, your subsequent call can include `starting_after=obj_foo` in order to fetch the
     * next page of the list.
     */
    Nullable!(Nullable!(string)) starting_after;

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
    Nullable!(Nullable!(string)) type;

  }

  static class GetBalanceTransactionsResponseHandler : ResponseHandler {

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
      Nullable!(string) object;

      @optional
      BalanceTransaction[] data;

      /**
       * The URL where this list can be accessed.
       */
      @optional
      Nullable!(string) url;

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
        handleResponse200(deserializeJson!(BalanceTransactionsList)(res.readJson()));
        return;
      }
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   * <p>Returns a list of transactions that have contributed to the Stripe account balance (e.g.,
   * charges, transfers, and so forth). The transactions are returned in sorted order, with the most
   * recent transactions appearing first.</p>
   * <p>Note that this endpoint was previously called “Balance history” and used the path
   * <code>/v1/balance/history</code>.</p>
   * See_Also: HTTP GET `/v1/balance_transactions`
   */
  void getBalanceTransactions(
      GetBalanceTransactionsParams params,
      GetBalanceTransactionsResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.GET,
        Servers.getServerUrl(),
        "/v1/balance_transactions");
    if (!params.created.isNull)
      requestor.setQueryParam("created", params.created.get.to!string);
    if (!params.currency.isNull)
      requestor.setQueryParam("currency", params.currency.get.to!string);
    if (!params.ending_before.isNull)
      requestor.setQueryParam("ending_before", params.ending_before.get.to!string);
    if (!params.expand.isNull)
      requestor.setQueryParam("expand", params.expand.get.to!string);
    if (!params.limit.isNull)
      requestor.setQueryParam("limit", params.limit.get.to!string);
    if (!params.payout.isNull)
      requestor.setQueryParam("payout", params.payout.get.to!string);
    if (!params.source.isNull)
      requestor.setQueryParam("source", params.source.get.to!string);
    if (!params.starting_after.isNull)
      requestor.setQueryParam("starting_after", params.starting_after.get.to!string);
    if (!params.type.isNull)
      requestor.setQueryParam("type", params.type.get.to!string);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class GetBalanceTransactionsIdParams {
    /**
     * Specifies which fields in the response should be expanded.
     */
    Nullable!(Nullable!(string)[]) expand;

    /**
     */
    Nullable!(Nullable!(string)) id;

  }

  static class GetBalanceTransactionsIdResponseHandler : ResponseHandler {

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
        handleResponse200(deserializeJson!(BalanceTransaction)(res.readJson()));
        return;
      }
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   * <p>Retrieves the balance transaction with the given ID.</p>
   * <p>Note that this endpoint previously used the path <code>/v1/balance/history/:id</code>.</p>
   * See_Also: HTTP GET `/v1/balance_transactions/{id}`
   */
  void getBalanceTransactionsId(
      GetBalanceTransactionsIdParams params,
      GetBalanceTransactionsIdResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.GET,
        Servers.getServerUrl(),
        "/v1/balance_transactions/{id}");
    if (!params.expand.isNull)
      requestor.setQueryParam("expand", params.expand.get.to!string);
    if (!params.id.isNull)
      requestor.setPathParam("id", params.id.get.to!string);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

}

// File automatically generated from OpenAPI spec.
module stripe.service.v1_payouts_service;

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
public import stripe.model.payout : Payout;
/**
 * Service to make REST API calls to paths beginning with: /v1/payouts
 */
class V1PayoutsService {
  static class PostPayoutsPayoutCancelParams {
    /**
     */
    Nullable!(Nullable!(string)) payout;

  }

  static class PostPayoutsPayoutCancelResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(Payout response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponsedefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        handleResponse200(deserializeJson!(Payout)(res.readJson()));
        return;
      }
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   */
  void postPayoutsPayoutCancel(
      PostPayoutsPayoutCancelParams params,
      PostPayoutsPayoutCancelResponseHandler responseHandler = null,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/payouts/{payout}/cancel");
    if (!params.payout.isNull)
      requestor.setPathParam("payout", params.payout.get.to!string);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class GetPayoutsPayoutParams {
    /**
     * Specifies which fields in the response should be expanded.
     */
    Nullable!(Nullable!(string)[]) expand;

    /**
     */
    Nullable!(Nullable!(string)) payout;

  }

  static class GetPayoutsPayoutResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(Payout response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponsedefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        handleResponse200(deserializeJson!(Payout)(res.readJson()));
        return;
      }
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   */
  void getPayoutsPayout(
      GetPayoutsPayoutParams params,
      GetPayoutsPayoutResponseHandler responseHandler = null,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.GET,
        Servers.getServerUrl(),
        "/v1/payouts/{payout}");
    if (!params.expand.isNull)
      requestor.setQueryParam("expand", params.expand.get.to!string);
    if (!params.payout.isNull)
      requestor.setPathParam("payout", params.payout.get.to!string);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class PostPayoutsPayoutParams {
    /**
     */
    Nullable!(Nullable!(string)) payout;

  }

  static class PostPayoutsPayoutResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(Payout response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponsedefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        handleResponse200(deserializeJson!(Payout)(res.readJson()));
        return;
      }
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   */
  void postPayoutsPayout(
      PostPayoutsPayoutParams params,
      PostPayoutsPayoutResponseHandler responseHandler = null,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/payouts/{payout}");
    if (!params.payout.isNull)
      requestor.setPathParam("payout", params.payout.get.to!string);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class GetPayoutsParams {
    /**
     */
    Nullable!(Json) arrival_date;

    /**
     */
    Nullable!(Json) created;

    /**
     * The ID of an external account - only return payouts sent to this external account.
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
     * Only return payouts that have the given status: `pending`, `paid`, `failed`, or `canceled`.
     */
    Nullable!(Nullable!(string)) status;

  }

  static class GetPayoutsResponseHandler : ResponseHandler {

    static class PayoutList {
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
      Payout[] data;

      /**
       * The URL where this list can be accessed.
       */
      @optional
      Nullable!(string) url;

    }

    /**
     * Successful response.
     */
    void delegate(PayoutList response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponsedefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        handleResponse200(deserializeJson!(PayoutList)(res.readJson()));
        return;
      }
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   */
  void getPayouts(
      GetPayoutsParams params,
      GetPayoutsResponseHandler responseHandler = null,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.GET,
        Servers.getServerUrl(),
        "/v1/payouts");
    if (!params.arrival_date.isNull)
      requestor.setQueryParam("arrival_date", params.arrival_date.get.to!string);
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
    if (!params.status.isNull)
      requestor.setQueryParam("status", params.status.get.to!string);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class PostPayoutsBody {
    /**
     * A positive integer in cents representing how much to payout.
     */
    @optional
    Nullable!(int) amount;

    /**
     * A string to be displayed on the recipient's bank or card statement. This may be at most 22
     * characters. Attempting to use a `statement_descriptor` longer than 22 characters will return
     * an error. Note: Most banks will truncate this information and/or display it inconsistently.
     * Some may not display it at all.
     */
    @optional
    Nullable!(string) statement_descriptor;

    /**
     * The balance type of your Stripe balance to draw this payout from. Balances for different
     * payment sources are kept separately. You can find the amounts with the balances API. One of
     * `bank_account`, `card`, or `fpx`.
     */
    @optional
    Nullable!(string) source_type;

    /**
     * The ID of a bank account or a card to send the payout to. If no destination is supplied, the
     * default external account for the specified currency will be used.
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
     * Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in
     * lowercase. Must be a [supported currency](https://stripe.com/docs/currencies).
     */
    @optional
    Nullable!(string) currency;

    /**
     * The method used to send this payout, which can be `standard` or `instant`. `instant` is only
     * supported for payouts to debit cards. (See [Instant payouts for marketplaces for more
     * information](https://stripe.com/blog/instant-payouts-for-marketplaces).)
     */
    @optional
    Nullable!(string) method;

    /**
     * Specifies which fields in the response should be expanded.
     */
    @optional
    Nullable!(string)[] expand;

    /**
     * An arbitrary string attached to the object. Often useful for displaying to users.
     */
    @optional
    Nullable!(string) description;

  }

  static class PostPayoutsResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(Payout response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponsedefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        handleResponse200(deserializeJson!(Payout)(res.readJson()));
        return;
      }
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   */
  void postPayouts(
      PostPayoutsBody requestBody,
      PostPayoutsResponseHandler responseHandler = null,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/payouts");
    Security.apply(requestor);
    requestor.makeRequest(requestBody, responseHandler);
  }

  static class PostPayoutsPayoutReverseParams {
    /**
     */
    Nullable!(Nullable!(string)) payout;

  }

  static class PostPayoutsPayoutReverseResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(Payout response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponsedefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        handleResponse200(deserializeJson!(Payout)(res.readJson()));
        return;
      }
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   */
  void postPayoutsPayoutReverse(
      PostPayoutsPayoutReverseParams params,
      PostPayoutsPayoutReverseResponseHandler responseHandler = null,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/payouts/{payout}/reverse");
    if (!params.payout.isNull)
      requestor.setPathParam("payout", params.payout.get.to!string);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

}

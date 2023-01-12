// File automatically generated from OpenAPI spec.
module stripe.service.v1_payouts_service;

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
public import stripe.model.payout : Payout;

/**
 * Service to make REST API calls to paths beginning with: /v1/payouts
 */
class V1PayoutsService {
  static class PostPayoutsPayoutCancelParams {
    /**
     */
    string payout;

    mixin AddBuilder!(typeof(this));

  }

  static class PostPayoutsPayoutCancelBody {
    /**
     * Specifies which fields in the response should be expanded.
     */
    @optional
    string[] expand;

    mixin AddBuilder!(typeof(this));

  }

  static class PostPayoutsPayoutCancelResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(Payout response) handleResponse200;

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
        handleResponse200(deserializeJson!(Payout)(res.readJson()));
        return;
      }
      if (handleResponseDefault is null) throw new Exception("Unhandled response status code default");
      handleResponseDefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

  }

  /**
   * <p>A previously created payout can be canceled if it has not yet been paid out. Funds will be
   * refunded to your available balance. You may not cancel automatic Stripe payouts.</p>
   * See_Also: HTTP POST `/v1/payouts/{payout}/cancel`
   */
  void postPayoutsPayoutCancel(
      PostPayoutsPayoutCancelParams params,
      PostPayoutsPayoutCancelBody requestBody,
      PostPayoutsPayoutCancelResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/payouts/{payout}/cancel");
    if (!params.payout.isNull)
      requestor.setPathParam("payout", params.payout);
    requestor.setHeaderParam("Content-Type", "application/x-www-form-urlencoded");
    Security.apply(requestor);
    requestor.makeRequest(requestBody, responseHandler);
  }

  static class GetPayoutsPayoutParams {
    /**
     * Specifies which fields in the response should be expanded.
     */
    string[] expand;

    /**
     */
    string payout;

    mixin AddBuilder!(typeof(this));

  }

  static class GetPayoutsPayoutResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(Payout response) handleResponse200;

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
        handleResponse200(deserializeJson!(Payout)(res.readJson()));
        return;
      }
      if (handleResponseDefault is null) throw new Exception("Unhandled response status code default");
      handleResponseDefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

  }

  /**
   * <p>Retrieves the details of an existing payout. Supply the unique payout ID from either a
   * payout creation request or the payout list, and Stripe will return the corresponding payout
   * information.</p>
   * See_Also: HTTP GET `/v1/payouts/{payout}`
   */
  void getPayoutsPayout(
      GetPayoutsPayoutParams params,
      GetPayoutsPayoutResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.GET,
        Servers.getServerUrl(),
        "/v1/payouts/{payout}");
    if (!params.expand.isNull)
      requestor.setQueryParam!("deepObject")("expand", params.expand);
    if (!params.payout.isNull)
      requestor.setPathParam("payout", params.payout);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class PostPayoutsPayoutParams {
    /**
     */
    string payout;

    mixin AddBuilder!(typeof(this));

  }

  static class PostPayoutsPayoutBody {
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

  static class PostPayoutsPayoutResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(Payout response) handleResponse200;

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
        handleResponse200(deserializeJson!(Payout)(res.readJson()));
        return;
      }
      if (handleResponseDefault is null) throw new Exception("Unhandled response status code default");
      handleResponseDefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

  }

  /**
   * <p>Updates the specified payout by setting the values of the parameters passed. Any parameters
   * not provided will be left unchanged. This request accepts only the metadata as arguments.</p>
   * See_Also: HTTP POST `/v1/payouts/{payout}`
   */
  void postPayoutsPayout(
      PostPayoutsPayoutParams params,
      PostPayoutsPayoutBody requestBody,
      PostPayoutsPayoutResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/payouts/{payout}");
    if (!params.payout.isNull)
      requestor.setPathParam("payout", params.payout);
    requestor.setHeaderParam("Content-Type", "application/x-www-form-urlencoded");
    Security.apply(requestor);
    requestor.makeRequest(requestBody, responseHandler);
  }

  static class GetPayoutsParams {
    /**
     */
    Json arrival_date;

    /**
     */
    Json created;

    /**
     * The ID of an external account - only return payouts sent to this external account.
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
     * Only return payouts that have the given status: `pending`, `paid`, `failed`, or `canceled`.
     */
    string status;

    mixin AddBuilder!(typeof(this));

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
      string object;

      @optional
      Payout[] data;

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
    void delegate(PayoutList response) handleResponse200;

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
        handleResponse200(deserializeJson!(PayoutList)(res.readJson()));
        return;
      }
      if (handleResponseDefault is null) throw new Exception("Unhandled response status code default");
      handleResponseDefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

  }

  /**
   * <p>Returns a list of existing payouts sent to third-party bank accounts or that Stripe has sent
   * you. The payouts are returned in sorted order, with the most recently created payouts appearing
   * first.</p>
   * See_Also: HTTP GET `/v1/payouts`
   */
  void getPayouts(
      GetPayoutsParams params,
      GetPayoutsResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.GET,
        Servers.getServerUrl(),
        "/v1/payouts");
    if (!params.arrival_date.isNull)
      requestor.setQueryParam!("deepObject")("arrival_date", params.arrival_date);
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
    if (!params.status.isNull)
      requestor.setQueryParam!("deepObject")("status", params.status);
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
    string statement_descriptor;

    /**
     * The balance type of your Stripe balance to draw this payout from. Balances for different
     * payment sources are kept separately. You can find the amounts with the balances API. One of
     * `bank_account`, `card`, or `fpx`.
     */
    @optional
    string source_type;

    /**
     * The ID of a bank account or a card to send the payout to. If no destination is supplied, the
     * default external account for the specified currency will be used.
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
     * Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in
     * lowercase. Must be a [supported currency](https://stripe.com/docs/currencies).
     */
    @optional
    string currency;

    /**
     * The method used to send this payout, which can be `standard` or `instant`. `instant` is only
     * supported for payouts to debit cards. (See [Instant payouts for marketplaces for more
     * information](https://stripe.com/blog/instant-payouts-for-marketplaces).)
     */
    @optional
    string method;

    /**
     * Specifies which fields in the response should be expanded.
     */
    @optional
    string[] expand;

    /**
     * An arbitrary string attached to the object. Often useful for displaying to users.
     */
    @optional
    string description;

    mixin AddBuilder!(typeof(this));

  }

  static class PostPayoutsResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(Payout response) handleResponse200;

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
        handleResponse200(deserializeJson!(Payout)(res.readJson()));
        return;
      }
      if (handleResponseDefault is null) throw new Exception("Unhandled response status code default");
      handleResponseDefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

  }

  /**
   * <p>To send funds to your own bank account, you create a new payout object. Your <a
   * href="#balance">Stripe balance</a> must be able to cover the payout amount, or you’ll receive
   * an “Insufficient Funds” error.</p>
   * <p>If your API key is in test mode, money won’t actually be sent, though everything else will
   * occur as if in live mode.</p>
   * <p>If you are creating a manual payout on a Stripe account that uses multiple payment source
   * types, you’ll need to specify the source type balance that the payout should draw from. The
   * <a href="#balance_object">balance object</a> details available and pending amounts by source
   * type.</p>
   * See_Also: HTTP POST `/v1/payouts`
   */
  void postPayouts(
      PostPayoutsBody requestBody,
      PostPayoutsResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/payouts");
    requestor.setHeaderParam("Content-Type", "application/x-www-form-urlencoded");
    Security.apply(requestor);
    requestor.makeRequest(requestBody, responseHandler);
  }

  static class PostPayoutsPayoutReverseParams {
    /**
     */
    string payout;

    mixin AddBuilder!(typeof(this));

  }

  static class PostPayoutsPayoutReverseBody {
    /**
     * Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an
     * object. This can be useful for storing additional information about the object in a
     * structured format. Individual keys can be unset by posting an empty value to them. All keys
     * can be unset by posting an empty value to `metadata`.
     */
    @optional
    string[string] metadata;

    /**
     * Specifies which fields in the response should be expanded.
     */
    @optional
    string[] expand;

    mixin AddBuilder!(typeof(this));

  }

  static class PostPayoutsPayoutReverseResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(Payout response) handleResponse200;

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
        handleResponse200(deserializeJson!(Payout)(res.readJson()));
        return;
      }
      if (handleResponseDefault is null) throw new Exception("Unhandled response status code default");
      handleResponseDefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

  }

  /**
   * <p>Reverses a payout by debiting the destination bank account. Only payouts for connected
   * accounts to US bank accounts may be reversed at this time. If the payout is in the
   * <code>pending</code> status, <code>/v1/payouts/:id/cancel</code> should be used instead.</p>
   * <p>By requesting a reversal via <code>/v1/payouts/:id/reverse</code>, you confirm that the
   * authorized signatory of the selected bank account has authorized the debit on the bank account
   * and that no other authorization is required.</p>
   * See_Also: HTTP POST `/v1/payouts/{payout}/reverse`
   */
  void postPayoutsPayoutReverse(
      PostPayoutsPayoutReverseParams params,
      PostPayoutsPayoutReverseBody requestBody,
      PostPayoutsPayoutReverseResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/payouts/{payout}/reverse");
    if (!params.payout.isNull)
      requestor.setPathParam("payout", params.payout);
    requestor.setHeaderParam("Content-Type", "application/x-www-form-urlencoded");
    Security.apply(requestor);
    requestor.makeRequest(requestBody, responseHandler);
  }

  mixin AddBuilder!(typeof(this));

}

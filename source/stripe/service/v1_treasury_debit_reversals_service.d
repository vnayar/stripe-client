// File automatically generated from OpenAPI spec.
module stripe.service.v1_treasury_debit_reversals_service;

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
public import stripe.model.treasury.debit_reversal : TreasuryDebitReversal;
/**
 * Service to make REST API calls to paths beginning with: /v1/treasury/debit_reversals
 */
class V1TreasuryDebitReversalsService {
  static class GetTreasuryDebitReversalsDebitReversalParams {
    /**
     */
    Nullable!(Nullable!(string)) debit_reversal;

    /**
     * Specifies which fields in the response should be expanded.
     */
    Nullable!(Nullable!(string)[]) expand;

  }

  static class GetTreasuryDebitReversalsDebitReversalResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(TreasuryDebitReversal response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponsedefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        handleResponse200(deserializeJson!(TreasuryDebitReversal)(res.readJson()));
        return;
      }
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   */
  void getTreasuryDebitReversalsDebitReversal(
      GetTreasuryDebitReversalsDebitReversalParams params,
      GetTreasuryDebitReversalsDebitReversalResponseHandler responseHandler = null,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.GET,
        Servers.getServerUrl(),
        "/v1/treasury/debit_reversals/{debit_reversal}");
    if (!params.debit_reversal.isNull)
      requestor.setPathParam("debit_reversal", params.debit_reversal.get.to!string);
    if (!params.expand.isNull)
      requestor.setQueryParam("expand", params.expand.get.to!string);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class GetTreasuryDebitReversalsParams {
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
     * Only return DebitReversals for the ReceivedDebit ID.
     */
    Nullable!(Nullable!(string)) received_debit;

    /**
     * Only return DebitReversals for a given resolution.
     */
    Nullable!(Nullable!(string)) resolution;

    /**
     * A cursor for use in pagination. `starting_after` is an object ID that defines your place in
     * the list. For instance, if you make a list request and receive 100 objects, ending with
     * `obj_foo`, your subsequent call can include `starting_after=obj_foo` in order to fetch the
     * next page of the list.
     */
    Nullable!(Nullable!(string)) starting_after;

    /**
     * Only return DebitReversals for a given status.
     */
    Nullable!(Nullable!(string)) status;

  }

  static class GetTreasuryDebitReversalsResponseHandler : ResponseHandler {

    static class TreasuryReceivedDebitsResourceDebitReversalList {
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
      TreasuryDebitReversal[] data;

      /**
       * The URL where this list can be accessed.
       */
      @optional
      Nullable!(string) url;

    }

    /**
     * Successful response.
     */
    void delegate(TreasuryReceivedDebitsResourceDebitReversalList response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponsedefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        handleResponse200(deserializeJson!(TreasuryReceivedDebitsResourceDebitReversalList)(res.readJson()));
        return;
      }
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   */
  void getTreasuryDebitReversals(
      GetTreasuryDebitReversalsParams params,
      GetTreasuryDebitReversalsResponseHandler responseHandler = null,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.GET,
        Servers.getServerUrl(),
        "/v1/treasury/debit_reversals");
    if (!params.ending_before.isNull)
      requestor.setQueryParam("ending_before", params.ending_before.get.to!string);
    if (!params.expand.isNull)
      requestor.setQueryParam("expand", params.expand.get.to!string);
    if (!params.financial_account.isNull)
      requestor.setQueryParam("financial_account", params.financial_account.get.to!string);
    if (!params.limit.isNull)
      requestor.setQueryParam("limit", params.limit.get.to!string);
    if (!params.received_debit.isNull)
      requestor.setQueryParam("received_debit", params.received_debit.get.to!string);
    if (!params.resolution.isNull)
      requestor.setQueryParam("resolution", params.resolution.get.to!string);
    if (!params.starting_after.isNull)
      requestor.setQueryParam("starting_after", params.starting_after.get.to!string);
    if (!params.status.isNull)
      requestor.setQueryParam("status", params.status.get.to!string);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class PostTreasuryDebitReversalsBody {
    /**
     * Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an
     * object. This can be useful for storing additional information about the object in a
     * structured format. Individual keys can be unset by posting an empty value to them. All keys
     * can be unset by posting an empty value to `metadata`.
     */
    @optional
    Nullable!(string)[string] metadata;

    /**
     * Specifies which fields in the response should be expanded.
     */
    @optional
    Nullable!(string)[] expand;

    /**
     * The ReceivedDebit to reverse.
     */
    @optional
    Nullable!(string) received_debit;

  }

  static class PostTreasuryDebitReversalsResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(TreasuryDebitReversal response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponsedefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        handleResponse200(deserializeJson!(TreasuryDebitReversal)(res.readJson()));
        return;
      }
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   */
  void postTreasuryDebitReversals(
      PostTreasuryDebitReversalsBody requestBody,
      PostTreasuryDebitReversalsResponseHandler responseHandler = null,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/treasury/debit_reversals");
    Security.apply(requestor);
    requestor.makeRequest(requestBody, responseHandler);
  }

}

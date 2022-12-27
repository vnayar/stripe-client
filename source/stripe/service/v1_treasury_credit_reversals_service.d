// File automatically generated from OpenAPI spec.
module stripe.service.v1_treasury_credit_reversals_service;

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
public import stripe.model.treasury.credit_reversal : TreasuryCreditReversal;
/**
 * Service to make REST API calls to paths beginning with: /v1/treasury/credit_reversals
 */
class V1TreasuryCreditReversalsService {
  static class GetTreasuryCreditReversalsParams {
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
     * Only return CreditReversals for the ReceivedCredit ID.
     */
    Nullable!(Nullable!(string)) received_credit;

    /**
     * A cursor for use in pagination. `starting_after` is an object ID that defines your place in
     * the list. For instance, if you make a list request and receive 100 objects, ending with
     * `obj_foo`, your subsequent call can include `starting_after=obj_foo` in order to fetch the
     * next page of the list.
     */
    Nullable!(Nullable!(string)) starting_after;

    /**
     * Only return CreditReversals for a given status.
     */
    Nullable!(Nullable!(string)) status;

  }

  static class GetTreasuryCreditReversalsResponseHandler : ResponseHandler {

    static class TreasuryReceivedCreditsResourceCreditReversalList {
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
      TreasuryCreditReversal[] data;

      /**
       * The URL where this list can be accessed.
       */
      @optional
      Nullable!(string) url;

    }

    /**
     * Successful response.
     */
    void delegate(TreasuryReceivedCreditsResourceCreditReversalList response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponsedefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        handleResponse200(deserializeJson!(TreasuryReceivedCreditsResourceCreditReversalList)(res.readJson()));
        return;
      }
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   */
  void getTreasuryCreditReversals(
      GetTreasuryCreditReversalsParams params,
      GetTreasuryCreditReversalsResponseHandler responseHandler = null,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.GET,
        Servers.getServerUrl(),
        "/v1/treasury/credit_reversals");
    if (!params.ending_before.isNull)
      requestor.setQueryParam("ending_before", params.ending_before.get.to!string);
    if (!params.expand.isNull)
      requestor.setQueryParam("expand", params.expand.get.to!string);
    if (!params.financial_account.isNull)
      requestor.setQueryParam("financial_account", params.financial_account.get.to!string);
    if (!params.limit.isNull)
      requestor.setQueryParam("limit", params.limit.get.to!string);
    if (!params.received_credit.isNull)
      requestor.setQueryParam("received_credit", params.received_credit.get.to!string);
    if (!params.starting_after.isNull)
      requestor.setQueryParam("starting_after", params.starting_after.get.to!string);
    if (!params.status.isNull)
      requestor.setQueryParam("status", params.status.get.to!string);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class PostTreasuryCreditReversalsBody {
    /**
     * Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an
     * object. This can be useful for storing additional information about the object in a
     * structured format. Individual keys can be unset by posting an empty value to them. All keys
     * can be unset by posting an empty value to `metadata`.
     */
    @optional
    Nullable!(string)[string] metadata;

    /**
     * The ReceivedCredit to reverse.
     */
    @optional
    Nullable!(string) received_credit;

    /**
     * Specifies which fields in the response should be expanded.
     */
    @optional
    Nullable!(string)[] expand;

  }

  static class PostTreasuryCreditReversalsResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(TreasuryCreditReversal response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponsedefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        handleResponse200(deserializeJson!(TreasuryCreditReversal)(res.readJson()));
        return;
      }
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   */
  void postTreasuryCreditReversals(
      PostTreasuryCreditReversalsBody requestBody,
      PostTreasuryCreditReversalsResponseHandler responseHandler = null,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/treasury/credit_reversals");
    Security.apply(requestor);
    requestor.makeRequest(requestBody, responseHandler);
  }

  static class GetTreasuryCreditReversalsCreditReversalParams {
    /**
     */
    Nullable!(Nullable!(string)) credit_reversal;

    /**
     * Specifies which fields in the response should be expanded.
     */
    Nullable!(Nullable!(string)[]) expand;

  }

  static class GetTreasuryCreditReversalsCreditReversalResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(TreasuryCreditReversal response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponsedefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        handleResponse200(deserializeJson!(TreasuryCreditReversal)(res.readJson()));
        return;
      }
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   */
  void getTreasuryCreditReversalsCreditReversal(
      GetTreasuryCreditReversalsCreditReversalParams params,
      GetTreasuryCreditReversalsCreditReversalResponseHandler responseHandler = null,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.GET,
        Servers.getServerUrl(),
        "/v1/treasury/credit_reversals/{credit_reversal}");
    if (!params.credit_reversal.isNull)
      requestor.setPathParam("credit_reversal", params.credit_reversal.get.to!string);
    if (!params.expand.isNull)
      requestor.setQueryParam("expand", params.expand.get.to!string);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

}

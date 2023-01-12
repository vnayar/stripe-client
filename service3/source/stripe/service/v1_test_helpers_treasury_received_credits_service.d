// File automatically generated from OpenAPI spec.
module stripe.service.v1_test_helpers_treasury_received_credits_service;

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
public import stripe.model.treasury.received_credit : TreasuryReceivedCredit;

/**
 * Service to make REST API calls to paths beginning with: /v1/test_helpers/treasury/received_credits
 */
class V1TestHelpersTreasuryReceivedCreditsService {
  static class PostTestHelpersTreasuryReceivedCreditsBody {
    /**
     * Amount (in cents) to be transferred.
     */
    @optional
    Nullable!(int) amount;

    /**
     * Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in
     * lowercase. Must be a [supported currency](https://stripe.com/docs/currencies).
     */
    @optional
    string currency;

    /**
     * Specifies which fields in the response should be expanded.
     */
    @optional
    string[] expand;

    /**
     * The rails used for the object.
     */
    @optional
    string network;

    /**
     * The FinancialAccount to send funds to.
     */
    @optional
    string financial_account;

    /**
     * An arbitrary string attached to the object. Often useful for displaying to users.
     */
    @optional
    string description;

    static class SourceParams {
      @optional
      string type;

      static class UsBankAccountSourceParams {
        @optional
        string account_holder_name;

        @optional
        string routing_number;

        @optional
        string account_number;

        mixin AddBuilder!(typeof(this));

      }

      @optional
      UsBankAccountSourceParams us_bank_account;

      mixin AddBuilder!(typeof(this));

    }

    /**
     * Initiating payment method details for the object.
     */
    @optional
    SourceParams initiating_payment_method_details;

    mixin AddBuilder!(typeof(this));

  }

  static class PostTestHelpersTreasuryReceivedCreditsResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(TreasuryReceivedCredit response) handleResponse200;

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
        handleResponse200(deserializeJson!(TreasuryReceivedCredit)(res.readJson()));
        return;
      }
      if (handleResponseDefault is null) throw new Exception("Unhandled response status code default");
      handleResponseDefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

  }

  /**
   * <p>Use this endpoint to simulate a test mode ReceivedCredit initiated by a third party. In live
   * mode, you can’t directly create ReceivedCredits initiated by third parties.</p>
   * See_Also: HTTP POST `/v1/test_helpers/treasury/received_credits`
   */
  void postTestHelpersTreasuryReceivedCredits(
      PostTestHelpersTreasuryReceivedCreditsBody requestBody,
      PostTestHelpersTreasuryReceivedCreditsResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/test_helpers/treasury/received_credits");
    requestor.setHeaderParam("Content-Type", "application/x-www-form-urlencoded");
    Security.apply(requestor);
    requestor.makeRequest(requestBody, responseHandler);
  }

  mixin AddBuilder!(typeof(this));

}

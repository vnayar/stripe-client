// File automatically generated from OpenAPI spec.
module stripe.service.v1_test_helpers_treasury_received_debits_service;

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
public import stripe.model.treasury.received_debit : TreasuryReceivedDebit;
/**
 * Service to make REST API calls to paths beginning with: /v1/test_helpers/treasury/received_debits
 */
class V1TestHelpersTreasuryReceivedDebitsService {
  static class PostTestHelpersTreasuryReceivedDebitsBody {
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
    Nullable!(string) currency;

    /**
     * Specifies which fields in the response should be expanded.
     */
    @optional
    Nullable!(string)[] expand;

    /**
     * The rails used for the object.
     */
    @optional
    Nullable!(string) network;

    /**
     * The FinancialAccount to pull funds from.
     */
    @optional
    Nullable!(string) financial_account;

    /**
     * An arbitrary string attached to the object. Often useful for displaying to users.
     */
    @optional
    Nullable!(string) description;

    static class SourceParams {
      @optional
      Nullable!(string) type;

      static class UsBankAccountSourceParams {
        @optional
        Nullable!(string) account_holder_name;

        @optional
        Nullable!(string) routing_number;

        @optional
        Nullable!(string) account_number;

      }

      @optional
      UsBankAccountSourceParams us_bank_account;

    }

    /**
     * Initiating payment method details for the object.
     */
    @optional
    SourceParams initiating_payment_method_details;

  }

  static class PostTestHelpersTreasuryReceivedDebitsResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(TreasuryReceivedDebit response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponsedefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        handleResponse200(deserializeJson!(TreasuryReceivedDebit)(res.readJson()));
        return;
      }
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   */
  void postTestHelpersTreasuryReceivedDebits(
      PostTestHelpersTreasuryReceivedDebitsBody requestBody,
      PostTestHelpersTreasuryReceivedDebitsResponseHandler responseHandler = null,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/test_helpers/treasury/received_debits");
    Security.apply(requestor);
    requestor.makeRequest(requestBody, responseHandler);
  }

}
// File automatically generated from OpenAPI spec.
module stripe.service.v1_test_helpers_customers_service;

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

public import stripe.model.customer_cash_balance_transaction : CustomerCashBalanceTransaction;
public import stripe.model.error : Error_;

/**
 * Service to make REST API calls to paths beginning with: /v1/test_helpers/customers
 */
class V1TestHelpersCustomersService {
  static class PostTestHelpersCustomersCustomerFundCashBalanceParams {
    /**
     */
    string customer;

    mixin AddBuilder!(typeof(this));

  }

  static class PostTestHelpersCustomersCustomerFundCashBalanceBody {
    /**
     * Amount to be used for this test cash balance transaction. A positive integer representing how
     * much to fund in the [smallest currency unit](https://stripe.com/docs/currencies#zero-decimal)
     * (e.g., 100 cents to fund $1.00 or 100 to fund ¥100, a zero-decimal currency).
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
     * A description of the test funding. This simulates free-text references supplied by customers
     * when making bank transfers to their cash balance. You can use this to test how Stripe's
     * [reconciliation algorithm](https://stripe.com/docs/payments/customer-balance/reconciliation)
     * applies to different user inputs.
     */
    @optional
    string reference;

    mixin AddBuilder!(typeof(this));

  }

  static class PostTestHelpersCustomersCustomerFundCashBalanceResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(CustomerCashBalanceTransaction response) handleResponse200;

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
        handleResponse200(deserializeJson!(CustomerCashBalanceTransaction)(res.readJson()));
        return;
      }
      if (handleResponseDefault is null) throw new Exception("Unhandled response status code default");
      handleResponseDefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

  }

  /**
   * <p>Create an incoming testmode bank transfer</p>
   * See_Also: HTTP POST `/v1/test_helpers/customers/{customer}/fund_cash_balance`
   */
  void postTestHelpersCustomersCustomerFundCashBalance(
      PostTestHelpersCustomersCustomerFundCashBalanceParams params,
      PostTestHelpersCustomersCustomerFundCashBalanceBody requestBody,
      PostTestHelpersCustomersCustomerFundCashBalanceResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/test_helpers/customers/{customer}/fund_cash_balance");
    if (!params.customer.isNull)
      requestor.setPathParam("customer", params.customer);
    requestor.setHeaderParam("Content-Type", "application/x-www-form-urlencoded");
    Security.apply(requestor);
    requestor.makeRequest(requestBody, responseHandler);
  }

  mixin AddBuilder!(typeof(this));

}

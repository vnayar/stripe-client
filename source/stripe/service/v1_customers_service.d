// File automatically generated from OpenAPI spec.
module stripe.service.v1_customers_service;

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

public import stripe.model.bank_account : BankAccount;
public import stripe.model.card : Card;
public import stripe.model.cash_balance : CashBalance;
public import stripe.model.customer : Customer;
public import stripe.model.customer_balance_transaction : CustomerBalanceTransaction;
public import stripe.model.customer_cash_balance_transaction : CustomerCashBalanceTransaction;
public import stripe.model.deleted_customer : DeletedCustomer;
public import stripe.model.deleted_discount : DeletedDiscount;
public import stripe.model.deleted_payment_source : DeletedPaymentSource;
public import stripe.model.deleted_tax_id : DeletedTaxId;
public import stripe.model.discount : Discount;
public import stripe.model.error : Error_;
public import stripe.model.funding_instructions : FundingInstructions;
public import stripe.model.payment_method : PaymentMethod;
public import stripe.model.payment_source : PaymentSource;
public import stripe.model.source : Source;
public import stripe.model.subscription : Subscription;
public import stripe.model.tax_id : TaxId;
/**
 * Service to make REST API calls to paths beginning with: /v1/customers
 */
class V1CustomersService {
  static class GetCustomersCustomerSubscriptionsSubscriptionExposedIdParams {
    /**
     */
    Nullable!(Nullable!(string)) customer;

    /**
     * Specifies which fields in the response should be expanded.
     */
    Nullable!(Nullable!(string)[]) expand;

    /**
     */
    Nullable!(Nullable!(string)) subscription_exposed_id;

  }

  static class GetCustomersCustomerSubscriptionsSubscriptionExposedIdResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(Subscription response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponsedefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        handleResponse200(deserializeJson!(Subscription)(res.readJson()));
        return;
      }
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   */
  void getCustomersCustomerSubscriptionsSubscriptionExposedId(
      GetCustomersCustomerSubscriptionsSubscriptionExposedIdParams params,
      GetCustomersCustomerSubscriptionsSubscriptionExposedIdResponseHandler responseHandler = null,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.GET,
        Servers.getServerUrl(),
        "/v1/customers/{customer}/subscriptions/{subscription_exposed_id}");
    if (!params.customer.isNull)
      requestor.setPathParam("customer", params.customer.get.to!string);
    if (!params.expand.isNull)
      requestor.setQueryParam("expand", params.expand.get.to!string);
    if (!params.subscription_exposed_id.isNull)
      requestor.setPathParam("subscription_exposed_id", params.subscription_exposed_id.get.to!string);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class PostCustomersCustomerSubscriptionsSubscriptionExposedIdParams {
    /**
     */
    Nullable!(Nullable!(string)) customer;

    /**
     */
    Nullable!(Nullable!(string)) subscription_exposed_id;

  }

  static class PostCustomersCustomerSubscriptionsSubscriptionExposedIdResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(Subscription response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponsedefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        handleResponse200(deserializeJson!(Subscription)(res.readJson()));
        return;
      }
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   */
  void postCustomersCustomerSubscriptionsSubscriptionExposedId(
      PostCustomersCustomerSubscriptionsSubscriptionExposedIdParams params,
      PostCustomersCustomerSubscriptionsSubscriptionExposedIdResponseHandler responseHandler = null,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/customers/{customer}/subscriptions/{subscription_exposed_id}");
    if (!params.customer.isNull)
      requestor.setPathParam("customer", params.customer.get.to!string);
    if (!params.subscription_exposed_id.isNull)
      requestor.setPathParam("subscription_exposed_id", params.subscription_exposed_id.get.to!string);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class DeleteCustomersCustomerSubscriptionsSubscriptionExposedIdParams {
    /**
     */
    Nullable!(Nullable!(string)) customer;

    /**
     */
    Nullable!(Nullable!(string)) subscription_exposed_id;

  }

  static class DeleteCustomersCustomerSubscriptionsSubscriptionExposedIdResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(Subscription response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponsedefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        handleResponse200(deserializeJson!(Subscription)(res.readJson()));
        return;
      }
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   */
  void deleteCustomersCustomerSubscriptionsSubscriptionExposedId(
      DeleteCustomersCustomerSubscriptionsSubscriptionExposedIdParams params,
      DeleteCustomersCustomerSubscriptionsSubscriptionExposedIdResponseHandler responseHandler = null,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.DELETE,
        Servers.getServerUrl(),
        "/v1/customers/{customer}/subscriptions/{subscription_exposed_id}");
    if (!params.customer.isNull)
      requestor.setPathParam("customer", params.customer.get.to!string);
    if (!params.subscription_exposed_id.isNull)
      requestor.setPathParam("subscription_exposed_id", params.subscription_exposed_id.get.to!string);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class GetCustomersParams {
    /**
     */
    Nullable!(Json) created;

    /**
     * A case-sensitive filter on the list based on the customer's `email` field. The value must be
     * a string.
     */
    Nullable!(Nullable!(string)) email;

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
     * Provides a list of customers that are associated with the specified test clock. The response
     * will not include customers with test clocks if this parameter is not set.
     */
    Nullable!(Nullable!(string)) test_clock;

  }

  static class GetCustomersResponseHandler : ResponseHandler {

    static class CustomerResourceCustomerList {
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
      Customer[] data;

      /**
       * The URL where this list can be accessed.
       */
      @optional
      Nullable!(string) url;

    }

    /**
     * Successful response.
     */
    void delegate(CustomerResourceCustomerList response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponsedefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        handleResponse200(deserializeJson!(CustomerResourceCustomerList)(res.readJson()));
        return;
      }
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   */
  void getCustomers(
      GetCustomersParams params,
      GetCustomersResponseHandler responseHandler = null,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.GET,
        Servers.getServerUrl(),
        "/v1/customers");
    if (!params.created.isNull)
      requestor.setQueryParam("created", params.created.get.to!string);
    if (!params.email.isNull)
      requestor.setQueryParam("email", params.email.get.to!string);
    if (!params.ending_before.isNull)
      requestor.setQueryParam("ending_before", params.ending_before.get.to!string);
    if (!params.expand.isNull)
      requestor.setQueryParam("expand", params.expand.get.to!string);
    if (!params.limit.isNull)
      requestor.setQueryParam("limit", params.limit.get.to!string);
    if (!params.starting_after.isNull)
      requestor.setQueryParam("starting_after", params.starting_after.get.to!string);
    if (!params.test_clock.isNull)
      requestor.setQueryParam("test_clock", params.test_clock.get.to!string);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class PostCustomersResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(Customer response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponsedefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        handleResponse200(deserializeJson!(Customer)(res.readJson()));
        return;
      }
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   */
  void postCustomers(
      PostCustomersResponseHandler responseHandler = null,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/customers");
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class GetCustomersCustomerBalanceTransactionsTransactionParams {
    /**
     */
    Nullable!(Nullable!(string)) customer;

    /**
     * Specifies which fields in the response should be expanded.
     */
    Nullable!(Nullable!(string)[]) expand;

    /**
     */
    Nullable!(Nullable!(string)) transaction;

  }

  static class GetCustomersCustomerBalanceTransactionsTransactionResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(CustomerBalanceTransaction response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponsedefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        handleResponse200(deserializeJson!(CustomerBalanceTransaction)(res.readJson()));
        return;
      }
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   */
  void getCustomersCustomerBalanceTransactionsTransaction(
      GetCustomersCustomerBalanceTransactionsTransactionParams params,
      GetCustomersCustomerBalanceTransactionsTransactionResponseHandler responseHandler = null,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.GET,
        Servers.getServerUrl(),
        "/v1/customers/{customer}/balance_transactions/{transaction}");
    if (!params.customer.isNull)
      requestor.setPathParam("customer", params.customer.get.to!string);
    if (!params.expand.isNull)
      requestor.setQueryParam("expand", params.expand.get.to!string);
    if (!params.transaction.isNull)
      requestor.setPathParam("transaction", params.transaction.get.to!string);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class PostCustomersCustomerBalanceTransactionsTransactionParams {
    /**
     */
    Nullable!(Nullable!(string)) customer;

    /**
     */
    Nullable!(Nullable!(string)) transaction;

  }

  static class PostCustomersCustomerBalanceTransactionsTransactionResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(CustomerBalanceTransaction response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponsedefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        handleResponse200(deserializeJson!(CustomerBalanceTransaction)(res.readJson()));
        return;
      }
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   */
  void postCustomersCustomerBalanceTransactionsTransaction(
      PostCustomersCustomerBalanceTransactionsTransactionParams params,
      PostCustomersCustomerBalanceTransactionsTransactionResponseHandler responseHandler = null,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/customers/{customer}/balance_transactions/{transaction}");
    if (!params.customer.isNull)
      requestor.setPathParam("customer", params.customer.get.to!string);
    if (!params.transaction.isNull)
      requestor.setPathParam("transaction", params.transaction.get.to!string);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class GetCustomersCustomerDiscountParams {
    /**
     */
    Nullable!(Nullable!(string)) customer;

    /**
     * Specifies which fields in the response should be expanded.
     */
    Nullable!(Nullable!(string)[]) expand;

  }

  static class GetCustomersCustomerDiscountResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(Discount response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponsedefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        handleResponse200(deserializeJson!(Discount)(res.readJson()));
        return;
      }
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   */
  void getCustomersCustomerDiscount(
      GetCustomersCustomerDiscountParams params,
      GetCustomersCustomerDiscountResponseHandler responseHandler = null,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.GET,
        Servers.getServerUrl(),
        "/v1/customers/{customer}/discount");
    if (!params.customer.isNull)
      requestor.setPathParam("customer", params.customer.get.to!string);
    if (!params.expand.isNull)
      requestor.setQueryParam("expand", params.expand.get.to!string);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class DeleteCustomersCustomerDiscountParams {
    /**
     */
    Nullable!(Nullable!(string)) customer;

  }

  static class DeleteCustomersCustomerDiscountResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(DeletedDiscount response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponsedefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        handleResponse200(deserializeJson!(DeletedDiscount)(res.readJson()));
        return;
      }
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   */
  void deleteCustomersCustomerDiscount(
      DeleteCustomersCustomerDiscountParams params,
      DeleteCustomersCustomerDiscountResponseHandler responseHandler = null,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.DELETE,
        Servers.getServerUrl(),
        "/v1/customers/{customer}/discount");
    if (!params.customer.isNull)
      requestor.setPathParam("customer", params.customer.get.to!string);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class GetCustomersCustomerCardsParams {
    /**
     */
    Nullable!(Nullable!(string)) customer;

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

  }

  static class GetCustomersCustomerCardsResponseHandler : ResponseHandler {

    static class CardList {
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
      Card[] data;

      /**
       * The URL where this list can be accessed.
       */
      @optional
      Nullable!(string) url;

    }

    /**
     * Successful response.
     */
    void delegate(CardList response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponsedefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        handleResponse200(deserializeJson!(CardList)(res.readJson()));
        return;
      }
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   */
  void getCustomersCustomerCards(
      GetCustomersCustomerCardsParams params,
      GetCustomersCustomerCardsResponseHandler responseHandler = null,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.GET,
        Servers.getServerUrl(),
        "/v1/customers/{customer}/cards");
    if (!params.customer.isNull)
      requestor.setPathParam("customer", params.customer.get.to!string);
    if (!params.ending_before.isNull)
      requestor.setQueryParam("ending_before", params.ending_before.get.to!string);
    if (!params.expand.isNull)
      requestor.setQueryParam("expand", params.expand.get.to!string);
    if (!params.limit.isNull)
      requestor.setQueryParam("limit", params.limit.get.to!string);
    if (!params.starting_after.isNull)
      requestor.setQueryParam("starting_after", params.starting_after.get.to!string);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class PostCustomersCustomerCardsParams {
    /**
     */
    Nullable!(Nullable!(string)) customer;

  }

  static class PostCustomersCustomerCardsResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(PaymentSource response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponsedefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        handleResponse200(deserializeJson!(PaymentSource)(res.readJson()));
        return;
      }
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   */
  void postCustomersCustomerCards(
      PostCustomersCustomerCardsParams params,
      PostCustomersCustomerCardsResponseHandler responseHandler = null,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/customers/{customer}/cards");
    if (!params.customer.isNull)
      requestor.setPathParam("customer", params.customer.get.to!string);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class GetCustomersCustomerSubscriptionsParams {
    /**
     */
    Nullable!(Nullable!(string)) customer;

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

  }

  static class GetCustomersCustomerSubscriptionsResponseHandler : ResponseHandler {

    static class SubscriptionList {
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
      Subscription[] data;

      /**
       * The URL where this list can be accessed.
       */
      @optional
      Nullable!(string) url;

    }

    /**
     * Successful response.
     */
    void delegate(SubscriptionList response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponsedefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        handleResponse200(deserializeJson!(SubscriptionList)(res.readJson()));
        return;
      }
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   */
  void getCustomersCustomerSubscriptions(
      GetCustomersCustomerSubscriptionsParams params,
      GetCustomersCustomerSubscriptionsResponseHandler responseHandler = null,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.GET,
        Servers.getServerUrl(),
        "/v1/customers/{customer}/subscriptions");
    if (!params.customer.isNull)
      requestor.setPathParam("customer", params.customer.get.to!string);
    if (!params.ending_before.isNull)
      requestor.setQueryParam("ending_before", params.ending_before.get.to!string);
    if (!params.expand.isNull)
      requestor.setQueryParam("expand", params.expand.get.to!string);
    if (!params.limit.isNull)
      requestor.setQueryParam("limit", params.limit.get.to!string);
    if (!params.starting_after.isNull)
      requestor.setQueryParam("starting_after", params.starting_after.get.to!string);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class PostCustomersCustomerSubscriptionsParams {
    /**
     */
    Nullable!(Nullable!(string)) customer;

  }

  static class PostCustomersCustomerSubscriptionsResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(Subscription response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponsedefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        handleResponse200(deserializeJson!(Subscription)(res.readJson()));
        return;
      }
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   */
  void postCustomersCustomerSubscriptions(
      PostCustomersCustomerSubscriptionsParams params,
      PostCustomersCustomerSubscriptionsResponseHandler responseHandler = null,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/customers/{customer}/subscriptions");
    if (!params.customer.isNull)
      requestor.setPathParam("customer", params.customer.get.to!string);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class GetCustomersCustomerSourcesParams {
    /**
     */
    Nullable!(Nullable!(string)) customer;

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
     * Filter sources according to a particular object type.
     */
    Nullable!(Nullable!(string)) object;

    /**
     * A cursor for use in pagination. `starting_after` is an object ID that defines your place in
     * the list. For instance, if you make a list request and receive 100 objects, ending with
     * `obj_foo`, your subsequent call can include `starting_after=obj_foo` in order to fetch the
     * next page of the list.
     */
    Nullable!(Nullable!(string)) starting_after;

  }

  static class GetCustomersCustomerSourcesResponseHandler : ResponseHandler {

    static class ApmsSourcesSourceList {
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
      Json[] data;

      /**
       * The URL where this list can be accessed.
       */
      @optional
      Nullable!(string) url;

    }

    /**
     * Successful response.
     */
    void delegate(ApmsSourcesSourceList response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponsedefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        handleResponse200(deserializeJson!(ApmsSourcesSourceList)(res.readJson()));
        return;
      }
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   */
  void getCustomersCustomerSources(
      GetCustomersCustomerSourcesParams params,
      GetCustomersCustomerSourcesResponseHandler responseHandler = null,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.GET,
        Servers.getServerUrl(),
        "/v1/customers/{customer}/sources");
    if (!params.customer.isNull)
      requestor.setPathParam("customer", params.customer.get.to!string);
    if (!params.ending_before.isNull)
      requestor.setQueryParam("ending_before", params.ending_before.get.to!string);
    if (!params.expand.isNull)
      requestor.setQueryParam("expand", params.expand.get.to!string);
    if (!params.limit.isNull)
      requestor.setQueryParam("limit", params.limit.get.to!string);
    if (!params.object.isNull)
      requestor.setQueryParam("object", params.object.get.to!string);
    if (!params.starting_after.isNull)
      requestor.setQueryParam("starting_after", params.starting_after.get.to!string);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class PostCustomersCustomerSourcesParams {
    /**
     */
    Nullable!(Nullable!(string)) customer;

  }

  static class PostCustomersCustomerSourcesResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(PaymentSource response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponsedefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        handleResponse200(deserializeJson!(PaymentSource)(res.readJson()));
        return;
      }
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   */
  void postCustomersCustomerSources(
      PostCustomersCustomerSourcesParams params,
      PostCustomersCustomerSourcesResponseHandler responseHandler = null,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/customers/{customer}/sources");
    if (!params.customer.isNull)
      requestor.setPathParam("customer", params.customer.get.to!string);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class GetCustomersCustomerBankAccountsIdParams {
    /**
     */
    Nullable!(Nullable!(string)) customer;

    /**
     * Specifies which fields in the response should be expanded.
     */
    Nullable!(Nullable!(string)[]) expand;

    /**
     */
    Nullable!(Nullable!(string)) id;

  }

  static class GetCustomersCustomerBankAccountsIdResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(BankAccount response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponsedefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        handleResponse200(deserializeJson!(BankAccount)(res.readJson()));
        return;
      }
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   */
  void getCustomersCustomerBankAccountsId(
      GetCustomersCustomerBankAccountsIdParams params,
      GetCustomersCustomerBankAccountsIdResponseHandler responseHandler = null,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.GET,
        Servers.getServerUrl(),
        "/v1/customers/{customer}/bank_accounts/{id}");
    if (!params.customer.isNull)
      requestor.setPathParam("customer", params.customer.get.to!string);
    if (!params.expand.isNull)
      requestor.setQueryParam("expand", params.expand.get.to!string);
    if (!params.id.isNull)
      requestor.setPathParam("id", params.id.get.to!string);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class PostCustomersCustomerBankAccountsIdParams {
    /**
     */
    Nullable!(Nullable!(string)) customer;

    /**
     */
    Nullable!(Nullable!(string)) id;

  }

  static class PostCustomersCustomerBankAccountsIdResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(Json response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponsedefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        handleResponse200(deserializeJson!(Json)(res.readJson()));
        return;
      }
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   */
  void postCustomersCustomerBankAccountsId(
      PostCustomersCustomerBankAccountsIdParams params,
      PostCustomersCustomerBankAccountsIdResponseHandler responseHandler = null,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/customers/{customer}/bank_accounts/{id}");
    if (!params.customer.isNull)
      requestor.setPathParam("customer", params.customer.get.to!string);
    if (!params.id.isNull)
      requestor.setPathParam("id", params.id.get.to!string);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class DeleteCustomersCustomerBankAccountsIdParams {
    /**
     */
    Nullable!(Nullable!(string)) customer;

    /**
     */
    Nullable!(Nullable!(string)) id;

  }

  static class DeleteCustomersCustomerBankAccountsIdResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(Json response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponsedefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        handleResponse200(deserializeJson!(Json)(res.readJson()));
        return;
      }
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   */
  void deleteCustomersCustomerBankAccountsId(
      DeleteCustomersCustomerBankAccountsIdParams params,
      DeleteCustomersCustomerBankAccountsIdResponseHandler responseHandler = null,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.DELETE,
        Servers.getServerUrl(),
        "/v1/customers/{customer}/bank_accounts/{id}");
    if (!params.customer.isNull)
      requestor.setPathParam("customer", params.customer.get.to!string);
    if (!params.id.isNull)
      requestor.setPathParam("id", params.id.get.to!string);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class GetCustomersCustomerPaymentMethodsPaymentMethodParams {
    /**
     */
    Nullable!(Nullable!(string)) customer;

    /**
     * Specifies which fields in the response should be expanded.
     */
    Nullable!(Nullable!(string)[]) expand;

    /**
     */
    Nullable!(Nullable!(string)) payment_method;

  }

  static class GetCustomersCustomerPaymentMethodsPaymentMethodResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(PaymentMethod response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponsedefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        handleResponse200(deserializeJson!(PaymentMethod)(res.readJson()));
        return;
      }
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   */
  void getCustomersCustomerPaymentMethodsPaymentMethod(
      GetCustomersCustomerPaymentMethodsPaymentMethodParams params,
      GetCustomersCustomerPaymentMethodsPaymentMethodResponseHandler responseHandler = null,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.GET,
        Servers.getServerUrl(),
        "/v1/customers/{customer}/payment_methods/{payment_method}");
    if (!params.customer.isNull)
      requestor.setPathParam("customer", params.customer.get.to!string);
    if (!params.expand.isNull)
      requestor.setQueryParam("expand", params.expand.get.to!string);
    if (!params.payment_method.isNull)
      requestor.setPathParam("payment_method", params.payment_method.get.to!string);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class GetCustomersCustomerCardsIdParams {
    /**
     */
    Nullable!(Nullable!(string)) customer;

    /**
     * Specifies which fields in the response should be expanded.
     */
    Nullable!(Nullable!(string)[]) expand;

    /**
     */
    Nullable!(Nullable!(string)) id;

  }

  static class GetCustomersCustomerCardsIdResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(Card response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponsedefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        handleResponse200(deserializeJson!(Card)(res.readJson()));
        return;
      }
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   */
  void getCustomersCustomerCardsId(
      GetCustomersCustomerCardsIdParams params,
      GetCustomersCustomerCardsIdResponseHandler responseHandler = null,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.GET,
        Servers.getServerUrl(),
        "/v1/customers/{customer}/cards/{id}");
    if (!params.customer.isNull)
      requestor.setPathParam("customer", params.customer.get.to!string);
    if (!params.expand.isNull)
      requestor.setQueryParam("expand", params.expand.get.to!string);
    if (!params.id.isNull)
      requestor.setPathParam("id", params.id.get.to!string);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class PostCustomersCustomerCardsIdParams {
    /**
     */
    Nullable!(Nullable!(string)) customer;

    /**
     */
    Nullable!(Nullable!(string)) id;

  }

  static class PostCustomersCustomerCardsIdResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(Json response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponsedefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        handleResponse200(deserializeJson!(Json)(res.readJson()));
        return;
      }
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   */
  void postCustomersCustomerCardsId(
      PostCustomersCustomerCardsIdParams params,
      PostCustomersCustomerCardsIdResponseHandler responseHandler = null,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/customers/{customer}/cards/{id}");
    if (!params.customer.isNull)
      requestor.setPathParam("customer", params.customer.get.to!string);
    if (!params.id.isNull)
      requestor.setPathParam("id", params.id.get.to!string);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class DeleteCustomersCustomerCardsIdParams {
    /**
     */
    Nullable!(Nullable!(string)) customer;

    /**
     */
    Nullable!(Nullable!(string)) id;

  }

  static class DeleteCustomersCustomerCardsIdResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(Json response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponsedefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        handleResponse200(deserializeJson!(Json)(res.readJson()));
        return;
      }
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   */
  void deleteCustomersCustomerCardsId(
      DeleteCustomersCustomerCardsIdParams params,
      DeleteCustomersCustomerCardsIdResponseHandler responseHandler = null,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.DELETE,
        Servers.getServerUrl(),
        "/v1/customers/{customer}/cards/{id}");
    if (!params.customer.isNull)
      requestor.setPathParam("customer", params.customer.get.to!string);
    if (!params.id.isNull)
      requestor.setPathParam("id", params.id.get.to!string);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class PostCustomersCustomerBankAccountsIdVerifyParams {
    /**
     */
    Nullable!(Nullable!(string)) customer;

    /**
     */
    Nullable!(Nullable!(string)) id;

  }

  static class PostCustomersCustomerBankAccountsIdVerifyResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(BankAccount response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponsedefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        handleResponse200(deserializeJson!(BankAccount)(res.readJson()));
        return;
      }
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   */
  void postCustomersCustomerBankAccountsIdVerify(
      PostCustomersCustomerBankAccountsIdVerifyParams params,
      PostCustomersCustomerBankAccountsIdVerifyResponseHandler responseHandler = null,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/customers/{customer}/bank_accounts/{id}/verify");
    if (!params.customer.isNull)
      requestor.setPathParam("customer", params.customer.get.to!string);
    if (!params.id.isNull)
      requestor.setPathParam("id", params.id.get.to!string);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class GetCustomersCustomerCashBalanceParams {
    /**
     */
    Nullable!(Nullable!(string)) customer;

    /**
     * Specifies which fields in the response should be expanded.
     */
    Nullable!(Nullable!(string)[]) expand;

  }

  static class GetCustomersCustomerCashBalanceResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(CashBalance response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponsedefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        handleResponse200(deserializeJson!(CashBalance)(res.readJson()));
        return;
      }
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   */
  void getCustomersCustomerCashBalance(
      GetCustomersCustomerCashBalanceParams params,
      GetCustomersCustomerCashBalanceResponseHandler responseHandler = null,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.GET,
        Servers.getServerUrl(),
        "/v1/customers/{customer}/cash_balance");
    if (!params.customer.isNull)
      requestor.setPathParam("customer", params.customer.get.to!string);
    if (!params.expand.isNull)
      requestor.setQueryParam("expand", params.expand.get.to!string);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class PostCustomersCustomerCashBalanceParams {
    /**
     */
    Nullable!(Nullable!(string)) customer;

  }

  static class PostCustomersCustomerCashBalanceResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(CashBalance response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponsedefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        handleResponse200(deserializeJson!(CashBalance)(res.readJson()));
        return;
      }
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   */
  void postCustomersCustomerCashBalance(
      PostCustomersCustomerCashBalanceParams params,
      PostCustomersCustomerCashBalanceResponseHandler responseHandler = null,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/customers/{customer}/cash_balance");
    if (!params.customer.isNull)
      requestor.setPathParam("customer", params.customer.get.to!string);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class GetCustomersCustomerCashBalanceTransactionsTransactionParams {
    /**
     */
    Nullable!(Nullable!(string)) customer;

    /**
     * Specifies which fields in the response should be expanded.
     */
    Nullable!(Nullable!(string)[]) expand;

    /**
     */
    Nullable!(Nullable!(string)) transaction;

  }

  static class GetCustomersCustomerCashBalanceTransactionsTransactionResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(CustomerCashBalanceTransaction response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponsedefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        handleResponse200(deserializeJson!(CustomerCashBalanceTransaction)(res.readJson()));
        return;
      }
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   */
  void getCustomersCustomerCashBalanceTransactionsTransaction(
      GetCustomersCustomerCashBalanceTransactionsTransactionParams params,
      GetCustomersCustomerCashBalanceTransactionsTransactionResponseHandler responseHandler = null,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.GET,
        Servers.getServerUrl(),
        "/v1/customers/{customer}/cash_balance_transactions/{transaction}");
    if (!params.customer.isNull)
      requestor.setPathParam("customer", params.customer.get.to!string);
    if (!params.expand.isNull)
      requestor.setQueryParam("expand", params.expand.get.to!string);
    if (!params.transaction.isNull)
      requestor.setPathParam("transaction", params.transaction.get.to!string);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class GetCustomersCustomerCashBalanceTransactionsParams {
    /**
     */
    Nullable!(Nullable!(string)) customer;

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

  }

  static class GetCustomersCustomerCashBalanceTransactionsResponseHandler : ResponseHandler {

    static class CustomerCashBalanceTransactionList {
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
      CustomerCashBalanceTransaction[] data;

      /**
       * The URL where this list can be accessed.
       */
      @optional
      Nullable!(string) url;

    }

    /**
     * Successful response.
     */
    void delegate(CustomerCashBalanceTransactionList response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponsedefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        handleResponse200(deserializeJson!(CustomerCashBalanceTransactionList)(res.readJson()));
        return;
      }
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   */
  void getCustomersCustomerCashBalanceTransactions(
      GetCustomersCustomerCashBalanceTransactionsParams params,
      GetCustomersCustomerCashBalanceTransactionsResponseHandler responseHandler = null,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.GET,
        Servers.getServerUrl(),
        "/v1/customers/{customer}/cash_balance_transactions");
    if (!params.customer.isNull)
      requestor.setPathParam("customer", params.customer.get.to!string);
    if (!params.ending_before.isNull)
      requestor.setQueryParam("ending_before", params.ending_before.get.to!string);
    if (!params.expand.isNull)
      requestor.setQueryParam("expand", params.expand.get.to!string);
    if (!params.limit.isNull)
      requestor.setQueryParam("limit", params.limit.get.to!string);
    if (!params.starting_after.isNull)
      requestor.setQueryParam("starting_after", params.starting_after.get.to!string);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class GetCustomersCustomerSourcesIdParams {
    /**
     */
    Nullable!(Nullable!(string)) customer;

    /**
     * Specifies which fields in the response should be expanded.
     */
    Nullable!(Nullable!(string)[]) expand;

    /**
     */
    Nullable!(Nullable!(string)) id;

  }

  static class GetCustomersCustomerSourcesIdResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(PaymentSource response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponsedefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        handleResponse200(deserializeJson!(PaymentSource)(res.readJson()));
        return;
      }
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   */
  void getCustomersCustomerSourcesId(
      GetCustomersCustomerSourcesIdParams params,
      GetCustomersCustomerSourcesIdResponseHandler responseHandler = null,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.GET,
        Servers.getServerUrl(),
        "/v1/customers/{customer}/sources/{id}");
    if (!params.customer.isNull)
      requestor.setPathParam("customer", params.customer.get.to!string);
    if (!params.expand.isNull)
      requestor.setQueryParam("expand", params.expand.get.to!string);
    if (!params.id.isNull)
      requestor.setPathParam("id", params.id.get.to!string);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class PostCustomersCustomerSourcesIdParams {
    /**
     */
    Nullable!(Nullable!(string)) customer;

    /**
     */
    Nullable!(Nullable!(string)) id;

  }

  static class PostCustomersCustomerSourcesIdResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(Json response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponsedefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        handleResponse200(deserializeJson!(Json)(res.readJson()));
        return;
      }
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   */
  void postCustomersCustomerSourcesId(
      PostCustomersCustomerSourcesIdParams params,
      PostCustomersCustomerSourcesIdResponseHandler responseHandler = null,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/customers/{customer}/sources/{id}");
    if (!params.customer.isNull)
      requestor.setPathParam("customer", params.customer.get.to!string);
    if (!params.id.isNull)
      requestor.setPathParam("id", params.id.get.to!string);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class DeleteCustomersCustomerSourcesIdParams {
    /**
     */
    Nullable!(Nullable!(string)) customer;

    /**
     */
    Nullable!(Nullable!(string)) id;

  }

  static class DeleteCustomersCustomerSourcesIdResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(Json response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponsedefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        handleResponse200(deserializeJson!(Json)(res.readJson()));
        return;
      }
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   */
  void deleteCustomersCustomerSourcesId(
      DeleteCustomersCustomerSourcesIdParams params,
      DeleteCustomersCustomerSourcesIdResponseHandler responseHandler = null,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.DELETE,
        Servers.getServerUrl(),
        "/v1/customers/{customer}/sources/{id}");
    if (!params.customer.isNull)
      requestor.setPathParam("customer", params.customer.get.to!string);
    if (!params.id.isNull)
      requestor.setPathParam("id", params.id.get.to!string);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class GetCustomersCustomerBankAccountsParams {
    /**
     */
    Nullable!(Nullable!(string)) customer;

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

  }

  static class GetCustomersCustomerBankAccountsResponseHandler : ResponseHandler {

    static class BankAccountList {
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
      BankAccount[] data;

      /**
       * The URL where this list can be accessed.
       */
      @optional
      Nullable!(string) url;

    }

    /**
     * Successful response.
     */
    void delegate(BankAccountList response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponsedefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        handleResponse200(deserializeJson!(BankAccountList)(res.readJson()));
        return;
      }
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   */
  void getCustomersCustomerBankAccounts(
      GetCustomersCustomerBankAccountsParams params,
      GetCustomersCustomerBankAccountsResponseHandler responseHandler = null,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.GET,
        Servers.getServerUrl(),
        "/v1/customers/{customer}/bank_accounts");
    if (!params.customer.isNull)
      requestor.setPathParam("customer", params.customer.get.to!string);
    if (!params.ending_before.isNull)
      requestor.setQueryParam("ending_before", params.ending_before.get.to!string);
    if (!params.expand.isNull)
      requestor.setQueryParam("expand", params.expand.get.to!string);
    if (!params.limit.isNull)
      requestor.setQueryParam("limit", params.limit.get.to!string);
    if (!params.starting_after.isNull)
      requestor.setQueryParam("starting_after", params.starting_after.get.to!string);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class PostCustomersCustomerBankAccountsParams {
    /**
     */
    Nullable!(Nullable!(string)) customer;

  }

  static class PostCustomersCustomerBankAccountsResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(PaymentSource response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponsedefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        handleResponse200(deserializeJson!(PaymentSource)(res.readJson()));
        return;
      }
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   */
  void postCustomersCustomerBankAccounts(
      PostCustomersCustomerBankAccountsParams params,
      PostCustomersCustomerBankAccountsResponseHandler responseHandler = null,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/customers/{customer}/bank_accounts");
    if (!params.customer.isNull)
      requestor.setPathParam("customer", params.customer.get.to!string);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class PostCustomersCustomerSourcesIdVerifyParams {
    /**
     */
    Nullable!(Nullable!(string)) customer;

    /**
     */
    Nullable!(Nullable!(string)) id;

  }

  static class PostCustomersCustomerSourcesIdVerifyResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(BankAccount response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponsedefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        handleResponse200(deserializeJson!(BankAccount)(res.readJson()));
        return;
      }
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   */
  void postCustomersCustomerSourcesIdVerify(
      PostCustomersCustomerSourcesIdVerifyParams params,
      PostCustomersCustomerSourcesIdVerifyResponseHandler responseHandler = null,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/customers/{customer}/sources/{id}/verify");
    if (!params.customer.isNull)
      requestor.setPathParam("customer", params.customer.get.to!string);
    if (!params.id.isNull)
      requestor.setPathParam("id", params.id.get.to!string);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class GetCustomersCustomerTaxIdsIdParams {
    /**
     */
    Nullable!(Nullable!(string)) customer;

    /**
     * Specifies which fields in the response should be expanded.
     */
    Nullable!(Nullable!(string)[]) expand;

    /**
     */
    Nullable!(Nullable!(string)) id;

  }

  static class GetCustomersCustomerTaxIdsIdResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(TaxId response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponsedefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        handleResponse200(deserializeJson!(TaxId)(res.readJson()));
        return;
      }
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   */
  void getCustomersCustomerTaxIdsId(
      GetCustomersCustomerTaxIdsIdParams params,
      GetCustomersCustomerTaxIdsIdResponseHandler responseHandler = null,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.GET,
        Servers.getServerUrl(),
        "/v1/customers/{customer}/tax_ids/{id}");
    if (!params.customer.isNull)
      requestor.setPathParam("customer", params.customer.get.to!string);
    if (!params.expand.isNull)
      requestor.setQueryParam("expand", params.expand.get.to!string);
    if (!params.id.isNull)
      requestor.setPathParam("id", params.id.get.to!string);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class DeleteCustomersCustomerTaxIdsIdParams {
    /**
     */
    Nullable!(Nullable!(string)) customer;

    /**
     */
    Nullable!(Nullable!(string)) id;

  }

  static class DeleteCustomersCustomerTaxIdsIdResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(DeletedTaxId response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponsedefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        handleResponse200(deserializeJson!(DeletedTaxId)(res.readJson()));
        return;
      }
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   */
  void deleteCustomersCustomerTaxIdsId(
      DeleteCustomersCustomerTaxIdsIdParams params,
      DeleteCustomersCustomerTaxIdsIdResponseHandler responseHandler = null,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.DELETE,
        Servers.getServerUrl(),
        "/v1/customers/{customer}/tax_ids/{id}");
    if (!params.customer.isNull)
      requestor.setPathParam("customer", params.customer.get.to!string);
    if (!params.id.isNull)
      requestor.setPathParam("id", params.id.get.to!string);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class GetCustomersCustomerPaymentMethodsParams {
    /**
     */
    Nullable!(Nullable!(string)) customer;

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
     * An optional filter on the list, based on the object `type` field. Without the filter, the
     * list includes all current and future payment method types. If your integration expects only
     * one type of payment method in the response, make sure to provide a type value in the request.
     */
    Nullable!(Nullable!(string)) type;

  }

  static class GetCustomersCustomerPaymentMethodsResponseHandler : ResponseHandler {

    static class CustomerPaymentMethodResourceList {
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
      PaymentMethod[] data;

      /**
       * The URL where this list can be accessed.
       */
      @optional
      Nullable!(string) url;

    }

    /**
     * Successful response.
     */
    void delegate(CustomerPaymentMethodResourceList response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponsedefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        handleResponse200(deserializeJson!(CustomerPaymentMethodResourceList)(res.readJson()));
        return;
      }
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   */
  void getCustomersCustomerPaymentMethods(
      GetCustomersCustomerPaymentMethodsParams params,
      GetCustomersCustomerPaymentMethodsResponseHandler responseHandler = null,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.GET,
        Servers.getServerUrl(),
        "/v1/customers/{customer}/payment_methods");
    if (!params.customer.isNull)
      requestor.setPathParam("customer", params.customer.get.to!string);
    if (!params.ending_before.isNull)
      requestor.setQueryParam("ending_before", params.ending_before.get.to!string);
    if (!params.expand.isNull)
      requestor.setQueryParam("expand", params.expand.get.to!string);
    if (!params.limit.isNull)
      requestor.setQueryParam("limit", params.limit.get.to!string);
    if (!params.starting_after.isNull)
      requestor.setQueryParam("starting_after", params.starting_after.get.to!string);
    if (!params.type.isNull)
      requestor.setQueryParam("type", params.type.get.to!string);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class GetCustomersCustomerSubscriptionsSubscriptionExposedIdDiscountParams {
    /**
     */
    Nullable!(Nullable!(string)) customer;

    /**
     * Specifies which fields in the response should be expanded.
     */
    Nullable!(Nullable!(string)[]) expand;

    /**
     */
    Nullable!(Nullable!(string)) subscription_exposed_id;

  }

  static class GetCustomersCustomerSubscriptionsSubscriptionExposedIdDiscountResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(Discount response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponsedefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        handleResponse200(deserializeJson!(Discount)(res.readJson()));
        return;
      }
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   */
  void getCustomersCustomerSubscriptionsSubscriptionExposedIdDiscount(
      GetCustomersCustomerSubscriptionsSubscriptionExposedIdDiscountParams params,
      GetCustomersCustomerSubscriptionsSubscriptionExposedIdDiscountResponseHandler responseHandler = null,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.GET,
        Servers.getServerUrl(),
        "/v1/customers/{customer}/subscriptions/{subscription_exposed_id}/discount");
    if (!params.customer.isNull)
      requestor.setPathParam("customer", params.customer.get.to!string);
    if (!params.expand.isNull)
      requestor.setQueryParam("expand", params.expand.get.to!string);
    if (!params.subscription_exposed_id.isNull)
      requestor.setPathParam("subscription_exposed_id", params.subscription_exposed_id.get.to!string);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class DeleteCustomersCustomerSubscriptionsSubscriptionExposedIdDiscountParams {
    /**
     */
    Nullable!(Nullable!(string)) customer;

    /**
     */
    Nullable!(Nullable!(string)) subscription_exposed_id;

  }

  static class DeleteCustomersCustomerSubscriptionsSubscriptionExposedIdDiscountResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(DeletedDiscount response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponsedefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        handleResponse200(deserializeJson!(DeletedDiscount)(res.readJson()));
        return;
      }
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   */
  void deleteCustomersCustomerSubscriptionsSubscriptionExposedIdDiscount(
      DeleteCustomersCustomerSubscriptionsSubscriptionExposedIdDiscountParams params,
      DeleteCustomersCustomerSubscriptionsSubscriptionExposedIdDiscountResponseHandler responseHandler = null,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.DELETE,
        Servers.getServerUrl(),
        "/v1/customers/{customer}/subscriptions/{subscription_exposed_id}/discount");
    if (!params.customer.isNull)
      requestor.setPathParam("customer", params.customer.get.to!string);
    if (!params.subscription_exposed_id.isNull)
      requestor.setPathParam("subscription_exposed_id", params.subscription_exposed_id.get.to!string);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class GetCustomersCustomerParams {
    /**
     */
    Nullable!(Nullable!(string)) customer;

    /**
     * Specifies which fields in the response should be expanded.
     */
    Nullable!(Nullable!(string)[]) expand;

  }

  static class GetCustomersCustomerResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(Json response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponsedefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        handleResponse200(deserializeJson!(Json)(res.readJson()));
        return;
      }
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   */
  void getCustomersCustomer(
      GetCustomersCustomerParams params,
      GetCustomersCustomerResponseHandler responseHandler = null,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.GET,
        Servers.getServerUrl(),
        "/v1/customers/{customer}");
    if (!params.customer.isNull)
      requestor.setPathParam("customer", params.customer.get.to!string);
    if (!params.expand.isNull)
      requestor.setQueryParam("expand", params.expand.get.to!string);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class PostCustomersCustomerParams {
    /**
     */
    Nullable!(Nullable!(string)) customer;

  }

  static class PostCustomersCustomerResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(Customer response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponsedefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        handleResponse200(deserializeJson!(Customer)(res.readJson()));
        return;
      }
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   */
  void postCustomersCustomer(
      PostCustomersCustomerParams params,
      PostCustomersCustomerResponseHandler responseHandler = null,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/customers/{customer}");
    if (!params.customer.isNull)
      requestor.setPathParam("customer", params.customer.get.to!string);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class DeleteCustomersCustomerParams {
    /**
     */
    Nullable!(Nullable!(string)) customer;

  }

  static class DeleteCustomersCustomerResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(DeletedCustomer response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponsedefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        handleResponse200(deserializeJson!(DeletedCustomer)(res.readJson()));
        return;
      }
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   */
  void deleteCustomersCustomer(
      DeleteCustomersCustomerParams params,
      DeleteCustomersCustomerResponseHandler responseHandler = null,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.DELETE,
        Servers.getServerUrl(),
        "/v1/customers/{customer}");
    if (!params.customer.isNull)
      requestor.setPathParam("customer", params.customer.get.to!string);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class PostCustomersCustomerFundingInstructionsParams {
    /**
     */
    Nullable!(Nullable!(string)) customer;

  }

  static class PostCustomersCustomerFundingInstructionsBody {
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
     * The `funding_type` to get the instructions for.
     */
    @optional
    Nullable!(string) funding_type;

    static class BankTransferParams {
      @optional
      Nullable!(string) type;

      @optional
      Nullable!(string)[] requested_address_types;

      static class EuBankAccountParams {
        @optional
        Nullable!(string) country;

      }

      @optional
      EuBankAccountParams eu_bank_transfer;

    }

    /**
     * Additional parameters for `bank_transfer` funding types
     */
    @optional
    BankTransferParams bank_transfer;

  }

  static class PostCustomersCustomerFundingInstructionsResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(FundingInstructions response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponsedefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        handleResponse200(deserializeJson!(FundingInstructions)(res.readJson()));
        return;
      }
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   */
  void postCustomersCustomerFundingInstructions(
      PostCustomersCustomerFundingInstructionsParams params,
      PostCustomersCustomerFundingInstructionsBody requestBody,
      PostCustomersCustomerFundingInstructionsResponseHandler responseHandler = null,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/customers/{customer}/funding_instructions");
    if (!params.customer.isNull)
      requestor.setPathParam("customer", params.customer.get.to!string);
    Security.apply(requestor);
    requestor.makeRequest(requestBody, responseHandler);
  }

  static class GetCustomersCustomerTaxIdsParams {
    /**
     */
    Nullable!(Nullable!(string)) customer;

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

  }

  static class GetCustomersCustomerTaxIdsResponseHandler : ResponseHandler {

    static class TaxIDsList {
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
      TaxId[] data;

      /**
       * The URL where this list can be accessed.
       */
      @optional
      Nullable!(string) url;

    }

    /**
     * Successful response.
     */
    void delegate(TaxIDsList response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponsedefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        handleResponse200(deserializeJson!(TaxIDsList)(res.readJson()));
        return;
      }
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   */
  void getCustomersCustomerTaxIds(
      GetCustomersCustomerTaxIdsParams params,
      GetCustomersCustomerTaxIdsResponseHandler responseHandler = null,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.GET,
        Servers.getServerUrl(),
        "/v1/customers/{customer}/tax_ids");
    if (!params.customer.isNull)
      requestor.setPathParam("customer", params.customer.get.to!string);
    if (!params.ending_before.isNull)
      requestor.setQueryParam("ending_before", params.ending_before.get.to!string);
    if (!params.expand.isNull)
      requestor.setQueryParam("expand", params.expand.get.to!string);
    if (!params.limit.isNull)
      requestor.setQueryParam("limit", params.limit.get.to!string);
    if (!params.starting_after.isNull)
      requestor.setQueryParam("starting_after", params.starting_after.get.to!string);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class PostCustomersCustomerTaxIdsParams {
    /**
     */
    Nullable!(Nullable!(string)) customer;

  }

  static class PostCustomersCustomerTaxIdsBody {
    /**
     * Type of the tax ID, one of `ae_trn`, `au_abn`, `au_arn`, `bg_uic`, `br_cnpj`, `br_cpf`,
     * `ca_bn`, `ca_gst_hst`, `ca_pst_bc`, `ca_pst_mb`, `ca_pst_sk`, `ca_qst`, `ch_vat`, `cl_tin`,
     * `eg_tin`, `es_cif`, `eu_oss_vat`, `eu_vat`, `gb_vat`, `ge_vat`, `hk_br`, `hu_tin`, `id_npwp`,
     * `il_vat`, `in_gst`, `is_vat`, `jp_cn`, `jp_rn`, `jp_trn`, `ke_pin`, `kr_brn`, `li_uid`,
     * `mx_rfc`, `my_frp`, `my_itn`, `my_sst`, `no_vat`, `nz_gst`, `ph_tin`, `ru_inn`, `ru_kpp`,
     * `sa_vat`, `sg_gst`, `sg_uen`, `si_tin`, `th_vat`, `tr_tin`, `tw_vat`, `ua_vat`, `us_ein`, or
     * `za_vat`
     */
    @optional
    Nullable!(string) type;

    /**
     * Specifies which fields in the response should be expanded.
     */
    @optional
    Nullable!(string)[] expand;

    /**
     * Value of the tax ID.
     */
    @optional
    Nullable!(string) value;

  }

  static class PostCustomersCustomerTaxIdsResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(TaxId response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponsedefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        handleResponse200(deserializeJson!(TaxId)(res.readJson()));
        return;
      }
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   */
  void postCustomersCustomerTaxIds(
      PostCustomersCustomerTaxIdsParams params,
      PostCustomersCustomerTaxIdsBody requestBody,
      PostCustomersCustomerTaxIdsResponseHandler responseHandler = null,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/customers/{customer}/tax_ids");
    if (!params.customer.isNull)
      requestor.setPathParam("customer", params.customer.get.to!string);
    Security.apply(requestor);
    requestor.makeRequest(requestBody, responseHandler);
  }

  static class GetCustomersCustomerBalanceTransactionsParams {
    /**
     */
    Nullable!(Nullable!(string)) customer;

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

  }

  static class GetCustomersCustomerBalanceTransactionsResponseHandler : ResponseHandler {

    static class CustomerBalanceTransactionList {
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
      CustomerBalanceTransaction[] data;

      /**
       * The URL where this list can be accessed.
       */
      @optional
      Nullable!(string) url;

    }

    /**
     * Successful response.
     */
    void delegate(CustomerBalanceTransactionList response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponsedefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        handleResponse200(deserializeJson!(CustomerBalanceTransactionList)(res.readJson()));
        return;
      }
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   */
  void getCustomersCustomerBalanceTransactions(
      GetCustomersCustomerBalanceTransactionsParams params,
      GetCustomersCustomerBalanceTransactionsResponseHandler responseHandler = null,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.GET,
        Servers.getServerUrl(),
        "/v1/customers/{customer}/balance_transactions");
    if (!params.customer.isNull)
      requestor.setPathParam("customer", params.customer.get.to!string);
    if (!params.ending_before.isNull)
      requestor.setQueryParam("ending_before", params.ending_before.get.to!string);
    if (!params.expand.isNull)
      requestor.setQueryParam("expand", params.expand.get.to!string);
    if (!params.limit.isNull)
      requestor.setQueryParam("limit", params.limit.get.to!string);
    if (!params.starting_after.isNull)
      requestor.setQueryParam("starting_after", params.starting_after.get.to!string);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class PostCustomersCustomerBalanceTransactionsParams {
    /**
     */
    Nullable!(Nullable!(string)) customer;

  }

  static class PostCustomersCustomerBalanceTransactionsBody {
    /**
     * An arbitrary string attached to the object. Often useful for displaying to users.
     */
    @optional
    Nullable!(string) description;

    /**
     * Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an
     * object. This can be useful for storing additional information about the object in a
     * structured format. Individual keys can be unset by posting an empty value to them. All keys
     * can be unset by posting an empty value to `metadata`.
     */
    @optional
    Json metadata;

    /**
     * The integer amount in **cents (or local equivalent)** to apply to the customer's credit
     * balance.
     */
    @optional
    Nullable!(int) amount;

    /**
     * Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in
     * lowercase. Must be a [supported currency](https://stripe.com/docs/currencies). Specifies the
     * [`invoice_credit_balance`](https://stripe.com/docs/api/customers/object#customer_object-invoi
     * ce_credit_balance) that this transaction will apply to. If the customer's `currency` is not
     * set, it will be updated to this value.
     */
    @optional
    Nullable!(string) currency;

    /**
     * Specifies which fields in the response should be expanded.
     */
    @optional
    Nullable!(string)[] expand;

  }

  static class PostCustomersCustomerBalanceTransactionsResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(CustomerBalanceTransaction response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponsedefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        handleResponse200(deserializeJson!(CustomerBalanceTransaction)(res.readJson()));
        return;
      }
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   */
  void postCustomersCustomerBalanceTransactions(
      PostCustomersCustomerBalanceTransactionsParams params,
      PostCustomersCustomerBalanceTransactionsBody requestBody,
      PostCustomersCustomerBalanceTransactionsResponseHandler responseHandler = null,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/customers/{customer}/balance_transactions");
    if (!params.customer.isNull)
      requestor.setPathParam("customer", params.customer.get.to!string);
    Security.apply(requestor);
    requestor.makeRequest(requestBody, responseHandler);
  }

}

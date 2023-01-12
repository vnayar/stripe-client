// File automatically generated from OpenAPI spec.
module stripe.service.v1_payment_methods_service;

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
public import stripe.model.payment_method : PaymentMethod;

/**
 * Service to make REST API calls to paths beginning with: /v1/payment_methods
 */
class V1PaymentMethodsService {
  static class PostPaymentMethodsPaymentMethodDetachParams {
    /**
     */
    string payment_method;

    mixin AddBuilder!(typeof(this));

  }

  static class PostPaymentMethodsPaymentMethodDetachBody {
    /**
     * Specifies which fields in the response should be expanded.
     */
    @optional
    string[] expand;

    mixin AddBuilder!(typeof(this));

  }

  static class PostPaymentMethodsPaymentMethodDetachResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(PaymentMethod response) handleResponse200;

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
        handleResponse200(deserializeJson!(PaymentMethod)(res.readJson()));
        return;
      }
      if (handleResponseDefault is null) throw new Exception("Unhandled response status code default");
      handleResponseDefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

  }

  /**
   * <p>Detaches a PaymentMethod object from a Customer. After a PaymentMethod is detached, it can
   * no longer be used for a payment or re-attached to a Customer.</p>
   * See_Also: HTTP POST `/v1/payment_methods/{payment_method}/detach`
   */
  void postPaymentMethodsPaymentMethodDetach(
      PostPaymentMethodsPaymentMethodDetachParams params,
      PostPaymentMethodsPaymentMethodDetachBody requestBody,
      PostPaymentMethodsPaymentMethodDetachResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/payment_methods/{payment_method}/detach");
    if (!params.payment_method.isNull)
      requestor.setPathParam("payment_method", params.payment_method);
    requestor.setHeaderParam("Content-Type", "application/x-www-form-urlencoded");
    Security.apply(requestor);
    requestor.makeRequest(requestBody, responseHandler);
  }

  static class GetPaymentMethodsPaymentMethodParams {
    /**
     * Specifies which fields in the response should be expanded.
     */
    string[] expand;

    /**
     */
    string payment_method;

    mixin AddBuilder!(typeof(this));

  }

  static class GetPaymentMethodsPaymentMethodResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(PaymentMethod response) handleResponse200;

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
        handleResponse200(deserializeJson!(PaymentMethod)(res.readJson()));
        return;
      }
      if (handleResponseDefault is null) throw new Exception("Unhandled response status code default");
      handleResponseDefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

  }

  /**
   * <p>Retrieves a PaymentMethod object attached to the StripeAccount. To retrieve a payment method
   * attached to a Customer, you should use <a href="/docs/api/payment_methods/customer">Retrieve a
   * Customer’s PaymentMethods</a></p>
   * See_Also: HTTP GET `/v1/payment_methods/{payment_method}`
   */
  void getPaymentMethodsPaymentMethod(
      GetPaymentMethodsPaymentMethodParams params,
      GetPaymentMethodsPaymentMethodResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.GET,
        Servers.getServerUrl(),
        "/v1/payment_methods/{payment_method}");
    if (!params.expand.isNull)
      requestor.setQueryParam!("deepObject")("expand", params.expand);
    if (!params.payment_method.isNull)
      requestor.setPathParam("payment_method", params.payment_method);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class PostPaymentMethodsPaymentMethodParams {
    /**
     */
    string payment_method;

    mixin AddBuilder!(typeof(this));

  }

  static class PostPaymentMethodsPaymentMethodBody {
    static class UpdateApiParam {
      @optional
      Nullable!(int) exp_month;

      @optional
      Nullable!(int) exp_year;

      mixin AddBuilder!(typeof(this));

    }

    /**
     * If this is a `card` PaymentMethod, this hash contains the user's card details.
     */
    @optional
    UpdateApiParam card;

    /**
     * If this is an `Link` PaymentMethod, this hash contains details about the Link payment method.
     */
    @optional
    Json link;

    static class BillingDetailsInnerParams {
      @optional
      Json email;

      @optional
      string phone;

      @optional
      Json address;

      @optional
      string name;

      mixin AddBuilder!(typeof(this));

    }

    /**
     * Billing information associated with the PaymentMethod that may be used or required by
     * particular types of payment methods.
     */
    @optional
    BillingDetailsInnerParams billing_details;

    /**
     * Specifies which fields in the response should be expanded.
     */
    @optional
    string[] expand;

    /**
     * Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an
     * object. This can be useful for storing additional information about the object in a
     * structured format. Individual keys can be unset by posting an empty value to them. All keys
     * can be unset by posting an empty value to `metadata`.
     */
    @optional
    Json metadata;

    static class UpdateParam {
      @optional
      string account_holder_type;

      mixin AddBuilder!(typeof(this));

    }

    /**
     * If this is an `us_bank_account` PaymentMethod, this hash contains details about the US bank
     * account payment method.
     */
    @optional
    UpdateParam us_bank_account;

    mixin AddBuilder!(typeof(this));

  }

  static class PostPaymentMethodsPaymentMethodResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(PaymentMethod response) handleResponse200;

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
        handleResponse200(deserializeJson!(PaymentMethod)(res.readJson()));
        return;
      }
      if (handleResponseDefault is null) throw new Exception("Unhandled response status code default");
      handleResponseDefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

  }

  /**
   * <p>Updates a PaymentMethod object. A PaymentMethod must be attached a customer to be
   * updated.</p>
   * See_Also: HTTP POST `/v1/payment_methods/{payment_method}`
   */
  void postPaymentMethodsPaymentMethod(
      PostPaymentMethodsPaymentMethodParams params,
      PostPaymentMethodsPaymentMethodBody requestBody,
      PostPaymentMethodsPaymentMethodResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/payment_methods/{payment_method}");
    if (!params.payment_method.isNull)
      requestor.setPathParam("payment_method", params.payment_method);
    requestor.setHeaderParam("Content-Type", "application/x-www-form-urlencoded");
    Security.apply(requestor);
    requestor.makeRequest(requestBody, responseHandler);
  }

  static class PostPaymentMethodsPaymentMethodAttachParams {
    /**
     */
    string payment_method;

    mixin AddBuilder!(typeof(this));

  }

  static class PostPaymentMethodsPaymentMethodAttachBody {
    /**
     * The ID of the customer to which to attach the PaymentMethod.
     */
    @optional
    string customer;

    /**
     * Specifies which fields in the response should be expanded.
     */
    @optional
    string[] expand;

    mixin AddBuilder!(typeof(this));

  }

  static class PostPaymentMethodsPaymentMethodAttachResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(PaymentMethod response) handleResponse200;

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
        handleResponse200(deserializeJson!(PaymentMethod)(res.readJson()));
        return;
      }
      if (handleResponseDefault is null) throw new Exception("Unhandled response status code default");
      handleResponseDefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

  }

  /**
   * <p>Attaches a PaymentMethod object to a Customer.</p>
   * <p>To attach a new PaymentMethod to a customer for future payments, we recommend you use a <a
   * href="/docs/api/setup_intents">SetupIntent</a>
   * or a PaymentIntent with <a
   * href="/docs/api/payment_intents/create#create_payment_intent-setup_future_usage">setup_future_u
   * sage</a>.
   * These approaches will perform any necessary steps to set up the PaymentMethod for future
   * payments. Using the <code>/v1/payment_methods/:id/attach</code>
   * endpoint without first using a SetupIntent or PaymentIntent with
   * <code>setup_future_usage</code> does not optimize the PaymentMethod for
   * future use, which makes later declines and payment friction more likely.
   * See <a href="/docs/payments/payment-intents#future-usage">Optimizing cards for future
   * payments</a> for more information about setting up
   * future payments.</p>
   * <p>To use this PaymentMethod as the default for invoice or subscription payments,
   * set <a
   * href="/docs/api/customers/update#update_customer-invoice_settings-default_payment_method"><code
   * >invoice_settings.default_payment_method</code></a>,
   * on the Customer to the PaymentMethod’s ID.</p>
   * See_Also: HTTP POST `/v1/payment_methods/{payment_method}/attach`
   */
  void postPaymentMethodsPaymentMethodAttach(
      PostPaymentMethodsPaymentMethodAttachParams params,
      PostPaymentMethodsPaymentMethodAttachBody requestBody,
      PostPaymentMethodsPaymentMethodAttachResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/payment_methods/{payment_method}/attach");
    if (!params.payment_method.isNull)
      requestor.setPathParam("payment_method", params.payment_method);
    requestor.setHeaderParam("Content-Type", "application/x-www-form-urlencoded");
    Security.apply(requestor);
    requestor.makeRequest(requestBody, responseHandler);
  }

  static class GetPaymentMethodsParams {
    /**
     * The ID of the customer whose PaymentMethods will be retrieved.
     */
    string customer;

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
     * An optional filter on the list, based on the object `type` field. Without the filter, the
     * list includes all current and future payment method types. If your integration expects only
     * one type of payment method in the response, make sure to provide a type value in the request.
     */
    string type;

    mixin AddBuilder!(typeof(this));

  }

  static class GetPaymentMethodsResponseHandler : ResponseHandler {

    static class PaymentFlowsPaymentMethodList {
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
      PaymentMethod[] data;

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
    void delegate(PaymentFlowsPaymentMethodList response) handleResponse200;

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
        handleResponse200(deserializeJson!(PaymentFlowsPaymentMethodList)(res.readJson()));
        return;
      }
      if (handleResponseDefault is null) throw new Exception("Unhandled response status code default");
      handleResponseDefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

  }

  /**
   * <p>Returns a list of PaymentMethods for Treasury flows. If you want to list the PaymentMethods
   * attached to a Customer for payments, you should use the <a
   * href="/docs/api/payment_methods/customer_list">List a Customer’s PaymentMethods</a> API
   * instead.</p>
   * See_Also: HTTP GET `/v1/payment_methods`
   */
  void getPaymentMethods(
      GetPaymentMethodsParams params,
      GetPaymentMethodsResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.GET,
        Servers.getServerUrl(),
        "/v1/payment_methods");
    if (!params.customer.isNull)
      requestor.setQueryParam!("deepObject")("customer", params.customer);
    if (!params.ending_before.isNull)
      requestor.setQueryParam!("deepObject")("ending_before", params.ending_before);
    if (!params.expand.isNull)
      requestor.setQueryParam!("deepObject")("expand", params.expand);
    if (!params.limit.isNull)
      requestor.setQueryParam!("deepObject")("limit", params.limit);
    if (!params.starting_after.isNull)
      requestor.setQueryParam!("deepObject")("starting_after", params.starting_after);
    if (!params.type.isNull)
      requestor.setQueryParam!("deepObject")("type", params.type);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class PostPaymentMethodsBody {
    /**
     * If this is an `wechat_pay` PaymentMethod, this hash contains details about the wechat_pay
     * payment method.
     */
    @optional
    Json wechat_pay;

    /**
     * If this is a `giropay` PaymentMethod, this hash contains details about the Giropay payment
     * method.
     */
    @optional
    Json giropay;

    static class Param {
      @optional
      string bank;

      mixin AddBuilder!(typeof(this));

    }

    /**
     * If this is an `ideal` PaymentMethod, this hash contains details about the iDEAL payment
     * method.
     */
    @optional
    Param ideal;

    /**
     * If this is a `bacs_debit` PaymentMethod, this hash contains details about the Bacs Direct
     * Debit bank account.
     */
    @optional
    Param bacs_debit;

    /**
     * If this is a `card` PaymentMethod, this hash contains the user's card details. For backwards
     * compatibility, you can alternatively provide a Stripe token (e.g., for Apple Pay, Amex
     * Express Checkout, or legacy Checkout) into the card hash with format `card: {token:
     * "tok_visa"}`. When providing a card number, you must meet the requirements for [PCI
     * compliance](https://stripe.com/docs/security#validating-pci-compliance). We strongly
     * recommend using Stripe.js instead of interacting with this API directly.
     */
    @optional
    Json card;

    static class PaymentMethodParam {
      @optional
      string transit_number;

      @optional
      string institution_number;

      @optional
      string account_number;

      mixin AddBuilder!(typeof(this));

    }

    /**
     * If this is an `acss_debit` PaymentMethod, this hash contains details about the ACSS Debit
     * payment method.
     */
    @optional
    PaymentMethodParam acss_debit;

    /**
     * If this is a `bancontact` PaymentMethod, this hash contains details about the Bancontact
     * payment method.
     */
    @optional
    Json bancontact;

    /**
     * If this is a `customer_balance` PaymentMethod, this hash contains details about the
     * CustomerBalance payment method.
     */
    @optional
    Json customer_balance;

    /**
     * If this is an `Alipay` PaymentMethod, this hash contains details about the Alipay payment
     * method.
     */
    @optional
    Json alipay;

    /**
     * If this is an `eps` PaymentMethod, this hash contains details about the EPS payment method.
     */
    @optional
    Param eps;

    /**
     * The `Customer` to whom the original PaymentMethod is attached.
     */
    @optional
    string customer;

    /**
     * If this is an `us_bank_account` PaymentMethod, this hash contains details about the US bank
     * account payment method.
     */
    @optional
    PaymentMethodParam us_bank_account;

    /**
     * If this is a `promptpay` PaymentMethod, this hash contains details about the PromptPay
     * payment method.
     */
    @optional
    Json promptpay;

    /**
     * If this is a `boleto` PaymentMethod, this hash contains details about the Boleto payment
     * method.
     */
    @optional
    Param boleto;

    /**
     * If this is a `sofort` PaymentMethod, this hash contains details about the SOFORT payment
     * method.
     */
    @optional
    Param sofort;

    /**
     * If this is a `konbini` PaymentMethod, this hash contains details about the Konbini payment
     * method.
     */
    @optional
    Json konbini;

    /**
     * If this is an `fpx` PaymentMethod, this hash contains details about the FPX payment method.
     */
    @optional
    Param fpx;

    /**
     * If this is a `blik` PaymentMethod, this hash contains details about the BLIK payment method.
     */
    @optional
    Json blik;

    /**
     * If this is a `paynow` PaymentMethod, this hash contains details about the PayNow payment
     * method.
     */
    @optional
    Json paynow;

    static class RadarOptions {
      @optional
      string session;

      mixin AddBuilder!(typeof(this));

    }

    /**
     * Options to configure Radar. See [Radar Session](https://stripe.com/docs/radar/radar-session)
     * for more information.
     */
    @optional
    RadarOptions radar_options;

    /**
     * If this is a `p24` PaymentMethod, this hash contains details about the P24 payment method.
     */
    @optional
    Param p24;

    /**
     * If this is a `pix` PaymentMethod, this hash contains details about the Pix payment method.
     */
    @optional
    Json pix;

    /**
     * Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an
     * object. This can be useful for storing additional information about the object in a
     * structured format. Individual keys can be unset by posting an empty value to them. All keys
     * can be unset by posting an empty value to `metadata`.
     */
    @optional
    string[string] metadata;

    /**
     * If this is an `Link` PaymentMethod, this hash contains details about the Link payment method.
     */
    @optional
    Json link;

    /**
     * The PaymentMethod to share.
     */
    @optional
    string payment_method;

    /**
     * Specifies which fields in the response should be expanded.
     */
    @optional
    string[] expand;

    /**
     * The type of the PaymentMethod. An additional hash is included on the PaymentMethod with a
     * name matching this value. It contains additional information specific to the PaymentMethod
     * type.
     */
    @optional
    string type;

    static class BillingDetailsInnerParams {
      @optional
      Json email;

      @optional
      string phone;

      @optional
      Json address;

      @optional
      string name;

      mixin AddBuilder!(typeof(this));

    }

    /**
     * Billing information associated with the PaymentMethod that may be used or required by
     * particular types of payment methods.
     */
    @optional
    BillingDetailsInnerParams billing_details;

    /**
     * If this is an `au_becs_debit` PaymentMethod, this hash contains details about the bank
     * account.
     */
    @optional
    Param au_becs_debit;

    /**
     * If this is a `klarna` PaymentMethod, this hash contains details about the Klarna payment
     * method.
     */
    @optional
    Param klarna;

    /**
     * If this is a `sepa_debit` PaymentMethod, this hash contains details about the SEPA debit bank
     * account.
     */
    @optional
    Param sepa_debit;

    /**
     * If this is an `AfterpayClearpay` PaymentMethod, this hash contains details about the
     * AfterpayClearpay payment method.
     */
    @optional
    Json afterpay_clearpay;

    /**
     * If this is an `affirm` PaymentMethod, this hash contains details about the Affirm payment
     * method.
     */
    @optional
    Json affirm;

    /**
     * If this is an `interac_present` PaymentMethod, this hash contains details about the Interac
     * Present payment method.
     */
    @optional
    Json interac_present;

    /**
     * If this is an `oxxo` PaymentMethod, this hash contains details about the OXXO payment method.
     */
    @optional
    Json oxxo;

    /**
     * If this is a `grabpay` PaymentMethod, this hash contains details about the GrabPay payment
     * method.
     */
    @optional
    Json grabpay;

    mixin AddBuilder!(typeof(this));

  }

  static class PostPaymentMethodsResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(PaymentMethod response) handleResponse200;

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
        handleResponse200(deserializeJson!(PaymentMethod)(res.readJson()));
        return;
      }
      if (handleResponseDefault is null) throw new Exception("Unhandled response status code default");
      handleResponseDefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

  }

  /**
   * <p>Creates a PaymentMethod object. Read the <a
   * href="/docs/stripe-js/reference#stripe-create-payment-method">Stripe.js reference</a> to learn
   * how to create PaymentMethods via Stripe.js.</p>
   * <p>Instead of creating a PaymentMethod directly, we recommend using the <a
   * href="/docs/payments/accept-a-payment">PaymentIntents</a> API to accept a payment immediately
   * or the <a href="/docs/payments/save-and-reuse">SetupIntent</a> API to collect payment method
   * details ahead of a future payment.</p>
   * See_Also: HTTP POST `/v1/payment_methods`
   */
  void postPaymentMethods(
      PostPaymentMethodsBody requestBody,
      PostPaymentMethodsResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/payment_methods");
    requestor.setHeaderParam("Content-Type", "application/x-www-form-urlencoded");
    Security.apply(requestor);
    requestor.makeRequest(requestBody, responseHandler);
  }

  mixin AddBuilder!(typeof(this));

}

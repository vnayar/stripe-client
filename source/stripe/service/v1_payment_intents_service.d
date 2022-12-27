// File automatically generated from OpenAPI spec.
module stripe.service.v1_payment_intents_service;

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
public import stripe.model.payment_intent : PaymentIntent;
/**
 * Service to make REST API calls to paths beginning with: /v1/payment_intents
 */
class V1PaymentIntentsService {
  static class PostPaymentIntentsIntentIncrementAuthorizationParams {
    /**
     */
    Nullable!(Nullable!(string)) intent;

  }

  static class PostPaymentIntentsIntentIncrementAuthorizationBody {
    /**
     * The updated total amount you intend to collect from the cardholder. This amount must be
     * greater than the currently authorized amount.
     */
    @optional
    Nullable!(int) amount;

    /**
     * For non-card charges, you can use this value as the complete description that appears on your
     * customers’ statements. Must contain at least one letter, maximum 22 characters.
     */
    @optional
    Nullable!(string) statement_descriptor;

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
     * An arbitrary string attached to the object. Often useful for displaying to users.
     */
    @optional
    Nullable!(string) description;

    static class TransferDataUpdateParams {
      @optional
      Nullable!(int) amount;

    }

    /**
     * The parameters used to automatically create a Transfer when the payment is captured.
     * For more information, see the PaymentIntents [use case for connected
     * accounts](https://stripe.com/docs/payments/connected-accounts).
     */
    @optional
    TransferDataUpdateParams transfer_data;

    /**
     * The amount of the application fee (if any) that will be requested to be applied to the
     * payment and transferred to the application owner's Stripe account. The amount of the
     * application fee collected will be capped at the total payment amount. For more information,
     * see the PaymentIntents [use case for connected
     * accounts](https://stripe.com/docs/payments/connected-accounts).
     */
    @optional
    Nullable!(int) application_fee_amount;

  }

  static class PostPaymentIntentsIntentIncrementAuthorizationResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(PaymentIntent response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponsedefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        handleResponse200(deserializeJson!(PaymentIntent)(res.readJson()));
        return;
      }
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   */
  void postPaymentIntentsIntentIncrementAuthorization(
      PostPaymentIntentsIntentIncrementAuthorizationParams params,
      PostPaymentIntentsIntentIncrementAuthorizationBody requestBody,
      PostPaymentIntentsIntentIncrementAuthorizationResponseHandler responseHandler = null,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/payment_intents/{intent}/increment_authorization");
    if (!params.intent.isNull)
      requestor.setPathParam("intent", params.intent.get.to!string);
    Security.apply(requestor);
    requestor.makeRequest(requestBody, responseHandler);
  }

  static class PostPaymentIntentsIntentVerifyMicrodepositsParams {
    /**
     */
    Nullable!(Nullable!(string)) intent;

  }

  static class PostPaymentIntentsIntentVerifyMicrodepositsResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(PaymentIntent response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponsedefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        handleResponse200(deserializeJson!(PaymentIntent)(res.readJson()));
        return;
      }
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   */
  void postPaymentIntentsIntentVerifyMicrodeposits(
      PostPaymentIntentsIntentVerifyMicrodepositsParams params,
      PostPaymentIntentsIntentVerifyMicrodepositsResponseHandler responseHandler = null,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/payment_intents/{intent}/verify_microdeposits");
    if (!params.intent.isNull)
      requestor.setPathParam("intent", params.intent.get.to!string);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class PostPaymentIntentsIntentConfirmParams {
    /**
     */
    Nullable!(Nullable!(string)) intent;

  }

  static class PostPaymentIntentsIntentConfirmResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(PaymentIntent response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponsedefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        handleResponse200(deserializeJson!(PaymentIntent)(res.readJson()));
        return;
      }
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   */
  void postPaymentIntentsIntentConfirm(
      PostPaymentIntentsIntentConfirmParams params,
      PostPaymentIntentsIntentConfirmResponseHandler responseHandler = null,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/payment_intents/{intent}/confirm");
    if (!params.intent.isNull)
      requestor.setPathParam("intent", params.intent.get.to!string);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class GetPaymentIntentsIntentParams {
    /**
     * The client secret of the PaymentIntent. Required if a publishable key is used to retrieve the
     * source.
     */
    Nullable!(Nullable!(string)) client_secret;

    /**
     * Specifies which fields in the response should be expanded.
     */
    Nullable!(Nullable!(string)[]) expand;

    /**
     */
    Nullable!(Nullable!(string)) intent;

  }

  static class GetPaymentIntentsIntentResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(PaymentIntent response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponsedefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        handleResponse200(deserializeJson!(PaymentIntent)(res.readJson()));
        return;
      }
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   */
  void getPaymentIntentsIntent(
      GetPaymentIntentsIntentParams params,
      GetPaymentIntentsIntentResponseHandler responseHandler = null,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.GET,
        Servers.getServerUrl(),
        "/v1/payment_intents/{intent}");
    if (!params.client_secret.isNull)
      requestor.setQueryParam("client_secret", params.client_secret.get.to!string);
    if (!params.expand.isNull)
      requestor.setQueryParam("expand", params.expand.get.to!string);
    if (!params.intent.isNull)
      requestor.setPathParam("intent", params.intent.get.to!string);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class PostPaymentIntentsIntentParams {
    /**
     */
    Nullable!(Nullable!(string)) intent;

  }

  static class PostPaymentIntentsIntentResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(PaymentIntent response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponsedefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        handleResponse200(deserializeJson!(PaymentIntent)(res.readJson()));
        return;
      }
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   */
  void postPaymentIntentsIntent(
      PostPaymentIntentsIntentParams params,
      PostPaymentIntentsIntentResponseHandler responseHandler = null,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/payment_intents/{intent}");
    if (!params.intent.isNull)
      requestor.setPathParam("intent", params.intent.get.to!string);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class PostPaymentIntentsIntentCaptureParams {
    /**
     */
    Nullable!(Nullable!(string)) intent;

  }

  static class PostPaymentIntentsIntentCaptureResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(PaymentIntent response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponsedefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        handleResponse200(deserializeJson!(PaymentIntent)(res.readJson()));
        return;
      }
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   */
  void postPaymentIntentsIntentCapture(
      PostPaymentIntentsIntentCaptureParams params,
      PostPaymentIntentsIntentCaptureResponseHandler responseHandler = null,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/payment_intents/{intent}/capture");
    if (!params.intent.isNull)
      requestor.setPathParam("intent", params.intent.get.to!string);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class PostPaymentIntentsIntentCancelParams {
    /**
     */
    Nullable!(Nullable!(string)) intent;

  }

  static class PostPaymentIntentsIntentCancelResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(PaymentIntent response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponsedefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        handleResponse200(deserializeJson!(PaymentIntent)(res.readJson()));
        return;
      }
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   */
  void postPaymentIntentsIntentCancel(
      PostPaymentIntentsIntentCancelParams params,
      PostPaymentIntentsIntentCancelResponseHandler responseHandler = null,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/payment_intents/{intent}/cancel");
    if (!params.intent.isNull)
      requestor.setPathParam("intent", params.intent.get.to!string);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class PostPaymentIntentsIntentApplyCustomerBalanceParams {
    /**
     */
    Nullable!(Nullable!(string)) intent;

  }

  static class PostPaymentIntentsIntentApplyCustomerBalanceResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(PaymentIntent response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponsedefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        handleResponse200(deserializeJson!(PaymentIntent)(res.readJson()));
        return;
      }
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   */
  void postPaymentIntentsIntentApplyCustomerBalance(
      PostPaymentIntentsIntentApplyCustomerBalanceParams params,
      PostPaymentIntentsIntentApplyCustomerBalanceResponseHandler responseHandler = null,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/payment_intents/{intent}/apply_customer_balance");
    if (!params.intent.isNull)
      requestor.setPathParam("intent", params.intent.get.to!string);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class GetPaymentIntentsParams {
    /**
     * A filter on the list, based on the object `created` field. The value can be a string with an
     * integer Unix timestamp, or it can be a dictionary with a number of different query options.
     */
    Nullable!(Json) created;

    /**
     * Only return PaymentIntents for the customer specified by this customer ID.
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

  static class GetPaymentIntentsResponseHandler : ResponseHandler {

    static class PaymentFlowsPaymentIntentList {
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
      PaymentIntent[] data;

      /**
       * The URL where this list can be accessed.
       */
      @optional
      Nullable!(string) url;

    }

    /**
     * Successful response.
     */
    void delegate(PaymentFlowsPaymentIntentList response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponsedefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        handleResponse200(deserializeJson!(PaymentFlowsPaymentIntentList)(res.readJson()));
        return;
      }
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   */
  void getPaymentIntents(
      GetPaymentIntentsParams params,
      GetPaymentIntentsResponseHandler responseHandler = null,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.GET,
        Servers.getServerUrl(),
        "/v1/payment_intents");
    if (!params.created.isNull)
      requestor.setQueryParam("created", params.created.get.to!string);
    if (!params.customer.isNull)
      requestor.setQueryParam("customer", params.customer.get.to!string);
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

  static class PostPaymentIntentsBody {
    /**
     * Set to `true` to attempt to [confirm](https://stripe.com/docs/api/payment_intents/confirm)
     * this PaymentIntent immediately. This parameter defaults to `false`. When creating and
     * confirming a PaymentIntent at the same time, parameters available in the
     * [confirm](https://stripe.com/docs/api/payment_intents/confirm) API may also be provided.
     */
    @optional
    Nullable!(bool) confirm;

    /**
     * A string that identifies the resulting payment as part of a group. See the PaymentIntents
     * [use case for connected accounts](https://stripe.com/docs/payments/connected-accounts) for
     * details.
     */
    @optional
    Nullable!(string) transfer_group;

    static class SecretKeyParam {
      static class CustomerAcceptanceParam {
        @optional
        Nullable!(long) accepted_at;

        @optional
        Nullable!(string) type;

        @optional
        Json offline;

        static class OnlineParam {
          @optional
          Nullable!(string) user_agent;

          @optional
          Nullable!(string) ip_address;

        }

        @optional
        OnlineParam online;

      }

      @optional
      CustomerAcceptanceParam customer_acceptance;

    }

    /**
     * This hash contains details about the Mandate to create. This parameter can only be used with
     * [`confirm=true`](https://stripe.com/docs/api/payment_intents/create#create_payment_intent-con
     * firm).
     */
    @optional
    SecretKeyParam mandate_data;

    /**
     * The URL to redirect your customer back to after they authenticate or cancel their payment on
     * the payment method's app or site. If you'd prefer to redirect to a mobile application, you
     * can alternatively supply an application URI scheme. This parameter can only be used with
     * [`confirm=true`](https://stripe.com/docs/api/payment_intents/create#create_payment_intent-con
     * firm).
     */
    @optional
    Nullable!(string) return_url;

    /**
     * Email address that the receipt for the resulting payment will be sent to. If `receipt_email`
     * is specified for a payment in live mode, a receipt will be sent regardless of your [email
     * settings](https://dashboard.stripe.com/account/emails).
     */
    @optional
    Nullable!(string) receipt_email;

    static class PaymentMethodDataParams {
      @optional
      Json wechat_pay;

      @optional
      Json giropay;

      static class Param {
        @optional
        Nullable!(string) bank;

      }

      @optional
      Param ideal;

      @optional
      Param bacs_debit;

      static class PaymentMethodParam {
        @optional
        Nullable!(string) transit_number;

        @optional
        Nullable!(string) institution_number;

        @optional
        Nullable!(string) account_number;

      }

      @optional
      PaymentMethodParam acss_debit;

      @optional
      Json bancontact;

      @optional
      Json customer_balance;

      @optional
      Json alipay;

      @optional
      Param eps;

      @optional
      PaymentMethodParam us_bank_account;

      @optional
      Json promptpay;

      @optional
      Param boleto;

      @optional
      Param sofort;

      @optional
      Json konbini;

      @optional
      Param fpx;

      @optional
      Json blik;

      @optional
      Json paynow;

      static class RadarOptions {
        @optional
        Nullable!(string) session;

      }

      @optional
      RadarOptions radar_options;

      @optional
      Param p24;

      @optional
      Json pix;

      @optional
      Nullable!(string)[string] metadata;

      @optional
      Json link;

      @optional
      Nullable!(string) type;

      static class BillingDetailsInnerParams {
        @optional
        Json email;

        @optional
        Nullable!(string) phone;

        @optional
        Json address;

        @optional
        Nullable!(string) name;

      }

      @optional
      BillingDetailsInnerParams billing_details;

      @optional
      Param au_becs_debit;

      @optional
      Param klarna;

      @optional
      Param sepa_debit;

      @optional
      Json afterpay_clearpay;

      @optional
      Json affirm;

      @optional
      Json interac_present;

      @optional
      Json oxxo;

      @optional
      Json grabpay;

    }

    /**
     * If provided, this hash will be used to create a PaymentMethod. The new PaymentMethod will
     * appear
     * in the
     * [payment_method](https://stripe.com/docs/api/payment_intents/object#payment_intent_object-pay
     * ment_method)
     * property on the PaymentIntent.
     */
    @optional
    PaymentMethodDataParams payment_method_data;

    static class AutomaticPaymentMethodsParam {
      @optional
      Nullable!(bool) enabled;

    }

    /**
     * When enabled, this PaymentIntent will accept payment methods that you have enabled in the
     * Dashboard and are compatible with this PaymentIntent's other parameters.
     */
    @optional
    AutomaticPaymentMethodsParam automatic_payment_methods;

    /**
     * The Stripe account ID for which these funds are intended. For details, see the PaymentIntents
     * [use case for connected accounts](https://stripe.com/docs/payments/connected-accounts).
     */
    @optional
    Nullable!(string) on_behalf_of;

    /**
     * Controls when the funds will be captured from the customer's account.
     */
    @optional
    Nullable!(string) capture_method;

    /**
     * ID of the Customer this PaymentIntent belongs to, if one exists.
     * Payment methods attached to other Customers cannot be used with this PaymentIntent.
     * If present in combination with
     * [setup_future_usage](https://stripe.com/docs/api#payment_intent_object-setup_future_usage),
     * this PaymentIntent's payment method will be attached to the Customer after the PaymentIntent
     * has been confirmed and any required actions from the user are complete.
     */
    @optional
    Nullable!(string) customer;

    /**
     * Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in
     * lowercase. Must be a [supported currency](https://stripe.com/docs/currencies).
     */
    @optional
    Nullable!(string) currency;

    /**
     * Set to `true` to fail the payment attempt if the PaymentIntent transitions into
     * `requires_action`. This parameter is intended for simpler integrations that do not handle
     * customer actions, like [saving cards without
     * authentication](https://stripe.com/docs/payments/save-card-without-authentication). This
     * parameter can only be used with
     * [`confirm=true`](https://stripe.com/docs/api/payment_intents/create#create_payment_intent-con
     * firm).
     */
    @optional
    Nullable!(bool) error_on_requires_action;

    static class RadarOptions {
      @optional
      Nullable!(string) session;

    }

    /**
     * Options to configure Radar. See [Radar Session](https://stripe.com/docs/radar/radar-session)
     * for more information.
     */
    @optional
    RadarOptions radar_options;

    static class TransferDataCreationParams {
      @optional
      Nullable!(int) amount;

      @optional
      Nullable!(string) destination;

    }

    /**
     * The parameters used to automatically create a Transfer when the payment succeeds.
     * For more information, see the PaymentIntents [use case for connected
     * accounts](https://stripe.com/docs/payments/connected-accounts).
     */
    @optional
    TransferDataCreationParams transfer_data;

    /**
     * ID of the mandate to be used for this payment. This parameter can only be used with
     * [`confirm=true`](https://stripe.com/docs/api/payment_intents/create#create_payment_intent-con
     * firm).
     */
    @optional
    Nullable!(string) mandate;

    /**
     * Amount intended to be collected by this PaymentIntent. A positive integer representing how
     * much to charge in the [smallest currency
     * unit](https://stripe.com/docs/currencies#zero-decimal) (e.g., 100 cents to charge $1.00 or
     * 100 to charge ¥100, a zero-decimal currency). The minimum amount is $0.50 US or [equivalent
     * in charge currency](https://stripe.com/docs/currencies#minimum-and-maximum-charge-amounts).
     * The amount value supports up to eight digits (e.g., a value of 99999999 for a USD charge of
     * $999,999.99).
     */
    @optional
    Nullable!(int) amount;

    /**
     * Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an
     * object. This can be useful for storing additional information about the object in a
     * structured format. Individual keys can be unset by posting an empty value to them. All keys
     * can be unset by posting an empty value to `metadata`.
     */
    @optional
    Nullable!(string)[string] metadata;

    /**
     * Set to `true` only when using manual confirmation and the iOS or Android SDKs to handle
     * additional authentication steps.
     */
    @optional
    Nullable!(bool) use_stripe_sdk;

    /**
     * ID of the payment method (a PaymentMethod, Card, or [compatible
     * Source](https://stripe.com/docs/payments/payment-methods/transitioning#compatibility) object)
     * to attach to this PaymentIntent.
     * If this parameter is omitted with `confirm=true`, `customer.default_source` will be attached
     * as this PaymentIntent's payment instrument to improve the migration experience for users of
     * the Charges API. We recommend that you explicitly provide the `payment_method` going forward.
     */
    @optional
    Nullable!(string) payment_method;

    /**
     * Specifies which fields in the response should be expanded.
     */
    @optional
    Nullable!(string)[] expand;

    /**
     * The amount of the application fee (if any) that will be requested to be applied to the
     * payment and transferred to the application owner's Stripe account. The amount of the
     * application fee collected will be capped at the total payment amount. For more information,
     * see the PaymentIntents [use case for connected
     * accounts](https://stripe.com/docs/payments/connected-accounts).
     */
    @optional
    Nullable!(int) application_fee_amount;

    /**
     * For non-card charges, you can use this value as the complete description that appears on your
     * customers’ statements. Must contain at least one letter, maximum 22 characters.
     */
    @optional
    Nullable!(string) statement_descriptor;

    static class PaymentMethodOptionsParam {
      @optional
      Json wechat_pay;

      @optional
      Json giropay;

      @optional
      Json ideal;

      @optional
      Json bacs_debit;

      @optional
      Json card;

      @optional
      Json card_present;

      @optional
      Json acss_debit;

      @optional
      Json bancontact;

      @optional
      Json customer_balance;

      @optional
      Json alipay;

      @optional
      Json eps;

      @optional
      Json us_bank_account;

      @optional
      Json promptpay;

      @optional
      Json boleto;

      @optional
      Json sofort;

      @optional
      Json konbini;

      @optional
      Json fpx;

      @optional
      Json blik;

      @optional
      Json paynow;

      @optional
      Json p24;

      @optional
      Json pix;

      @optional
      Json link;

      @optional
      Json au_becs_debit;

      @optional
      Json klarna;

      @optional
      Json sepa_debit;

      @optional
      Json afterpay_clearpay;

      @optional
      Json affirm;

      @optional
      Json interac_present;

      @optional
      Json oxxo;

      @optional
      Json grabpay;

    }

    /**
     * Payment-method-specific configuration for this PaymentIntent.
     */
    @optional
    PaymentMethodOptionsParam payment_method_options;

    @optional
    Nullable!(string) confirmation_method;

    /**
     * Set to `true` to indicate that the customer is not in your checkout flow during this payment
     * attempt, and therefore is unable to authenticate. This parameter is intended for scenarios
     * where you collect card details and [charge them
     * later](https://stripe.com/docs/payments/cards/charging-saved-cards). This parameter can only
     * be used with
     * [`confirm=true`](https://stripe.com/docs/api/payment_intents/create#create_payment_intent-con
     * firm).
     */
    @optional
    Json off_session;

    /**
     * Provides information about a card payment that customers see on their statements.
     * Concatenated with the prefix (shortened descriptor) or statement descriptor that’s set on
     * the account to form the complete statement descriptor. Maximum 22 characters for the
     * concatenated descriptor.
     */
    @optional
    Nullable!(string) statement_descriptor_suffix;

    /**
     * Indicates that you intend to make future payments with this PaymentIntent's payment method.
     * Providing this parameter will [attach the payment
     * method](https://stripe.com/docs/payments/save-during-payment) to the PaymentIntent's
     * Customer, if present, after the PaymentIntent is confirmed and any required actions from the
     * user are complete. If no Customer was provided, the payment method can still be
     * [attached](https://stripe.com/docs/api/payment_methods/attach) to a Customer after the
     * transaction completes.
     * When processing card payments, Stripe also uses `setup_future_usage` to dynamically optimize
     * your payment flow and comply with regional legislation and network rules, such as
     * [SCA](https://stripe.com/docs/strong-customer-authentication).
     */
    @optional
    Nullable!(string) setup_future_usage;

    /**
     * An arbitrary string attached to the object. Often useful for displaying to users.
     */
    @optional
    Nullable!(string) description;

    static class OptionalFieldsShipping {
      @optional
      Nullable!(string) phone;

      @optional
      Nullable!(string) carrier;

      static class OptionalFieldsAddress {
        @optional
        Nullable!(string) line1;

        @optional
        Nullable!(string) line2;

        @optional
        Nullable!(string) country;

        @optional
        Nullable!(string) postal_code;

        @optional
        Nullable!(string) city;

        @optional
        Nullable!(string) state;

      }

      @optional
      OptionalFieldsAddress address;

      @optional
      Nullable!(string) tracking_number;

      @optional
      Nullable!(string) name;

    }

    /**
     * Shipping information for this PaymentIntent.
     */
    @optional
    OptionalFieldsShipping shipping;

    /**
     * The list of payment method types (e.g. card) that this PaymentIntent is allowed to use. If
     * this is not provided, defaults to ["card"]. Use automatic_payment_methods to manage payment
     * methods from the [Stripe Dashboard](https://dashboard.stripe.com/settings/payment_methods).
     */
    @optional
    Nullable!(string)[] payment_method_types;

  }

  static class PostPaymentIntentsResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(PaymentIntent response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponsedefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        handleResponse200(deserializeJson!(PaymentIntent)(res.readJson()));
        return;
      }
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   */
  void postPaymentIntents(
      PostPaymentIntentsBody requestBody,
      PostPaymentIntentsResponseHandler responseHandler = null,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/payment_intents");
    Security.apply(requestor);
    requestor.makeRequest(requestBody, responseHandler);
  }

}
// File automatically generated from OpenAPI spec.
module stripe.service.v1_payment_intents_service;

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
public import stripe.model.payment_intent : PaymentIntent;

/**
 * Service to make REST API calls to paths beginning with: /v1/payment_intents
 */
class V1PaymentIntentsService {
  static class PostPaymentIntentsIntentIncrementAuthorizationParams {
    /**
     */
    string intent;

    mixin AddBuilder!(typeof(this));

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
     * customersâ€™ statements. Must contain at least one letter, maximum 22 characters.
     */
    @optional
    string statement_descriptor;

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

    /**
     * An arbitrary string attached to the object. Often useful for displaying to users.
     */
    @optional
    string description;

    static class TransferDataUpdateParams {
      @optional
      Nullable!(int) amount;

      mixin AddBuilder!(typeof(this));

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

    mixin AddBuilder!(typeof(this));

  }

  static class PostPaymentIntentsIntentIncrementAuthorizationResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(PaymentIntent response) handleResponse200;

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
        handleResponse200(deserializeJson!(PaymentIntent)(res.readJson()));
        return;
      }
      if (handleResponseDefault is null) throw new Exception("Unhandled response status code default");
      handleResponseDefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

  }

  /**
   * <p>Perform an incremental authorization on an eligible
   * <a href="/docs/api/payment_intents/object">PaymentIntent</a>. To be eligible, the
   * PaymentIntentâ€™s status must be <code>requires_capture</code> and
   * <a
   * href="/docs/api/charges/object#charge_object-payment_method_details-card_present-incremental_au
   * thorization_supported">incremental_authorization_supported</a>
   * must be <code>true</code>.</p>
   * <p>Incremental authorizations attempt to increase the authorized amount on
   * your customerâ€™s card to the new, higher <code>amount</code> provided. As with the
   * initial authorization, incremental authorizations may be declined. A
   * single PaymentIntent can call this endpoint multiple times to further
   * increase the authorized amount.</p>
   * <p>If the incremental authorization succeeds, the PaymentIntent object is
   * returned with the updated
   * <a href="/docs/api/payment_intents/object#payment_intent_object-amount">amount</a>.
   * If the incremental authorization fails, a
   * <a href="/docs/error-codes#card-declined">card_declined</a> error is returned, and no
   * fields on the PaymentIntent or Charge are updated. The PaymentIntent
   * object remains capturable for the previously authorized amount.</p>
   * <p>Each PaymentIntent can have a maximum of 10 incremental authorization attempts, including
   * declines.
   * Once captured, a PaymentIntent can no longer be incremented.</p>
   * <p>Learn more about <a href="/docs/terminal/features/incremental-authorizations">incremental
   * authorizations</a>.</p>
   * See_Also: HTTP POST `/v1/payment_intents/{intent}/increment_authorization`
   */
  void postPaymentIntentsIntentIncrementAuthorization(
      PostPaymentIntentsIntentIncrementAuthorizationParams params,
      PostPaymentIntentsIntentIncrementAuthorizationBody requestBody,
      PostPaymentIntentsIntentIncrementAuthorizationResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/payment_intents/{intent}/increment_authorization");
    if (!params.intent.isNull)
      requestor.setPathParam("intent", params.intent);
    requestor.setHeaderParam("Content-Type", "application/x-www-form-urlencoded");
    Security.apply(requestor);
    requestor.makeRequest(requestBody, responseHandler);
  }

  static class PostPaymentIntentsIntentVerifyMicrodepositsParams {
    /**
     */
    string intent;

    mixin AddBuilder!(typeof(this));

  }

  static class PostPaymentIntentsIntentVerifyMicrodepositsBody {
    /**
     * A six-character code starting with SM present in the microdeposit sent to the bank account.
     */
    @optional
    string descriptor_code;

    /**
     * Specifies which fields in the response should be expanded.
     */
    @optional
    string[] expand;

    /**
     * Two positive integers, in *cents*, equal to the values of the microdeposits sent to the bank
     * account.
     */
    @optional
    Nullable!(int)[] amounts;

    /**
     * The client secret of the PaymentIntent.
     */
    @optional
    string client_secret;

    mixin AddBuilder!(typeof(this));

  }

  static class PostPaymentIntentsIntentVerifyMicrodepositsResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(PaymentIntent response) handleResponse200;

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
        handleResponse200(deserializeJson!(PaymentIntent)(res.readJson()));
        return;
      }
      if (handleResponseDefault is null) throw new Exception("Unhandled response status code default");
      handleResponseDefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

  }

  /**
   * <p>Verifies microdeposits on a PaymentIntent object.</p>
   * See_Also: HTTP POST `/v1/payment_intents/{intent}/verify_microdeposits`
   */
  void postPaymentIntentsIntentVerifyMicrodeposits(
      PostPaymentIntentsIntentVerifyMicrodepositsParams params,
      PostPaymentIntentsIntentVerifyMicrodepositsBody requestBody,
      PostPaymentIntentsIntentVerifyMicrodepositsResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/payment_intents/{intent}/verify_microdeposits");
    if (!params.intent.isNull)
      requestor.setPathParam("intent", params.intent);
    requestor.setHeaderParam("Content-Type", "application/x-www-form-urlencoded");
    Security.apply(requestor);
    requestor.makeRequest(requestBody, responseHandler);
  }

  static class PostPaymentIntentsIntentConfirmParams {
    /**
     */
    string intent;

    mixin AddBuilder!(typeof(this));

  }

  static class PostPaymentIntentsIntentConfirmBody {
    /**
     * This hash contains details about the Mandate to create
     */
    @optional
    Json mandate_data;

    /**
     * Controls when the funds will be captured from the customer's account.
     */
    @optional
    string capture_method;

    /**
     * The URL to redirect your customer back to after they authenticate or cancel their payment on
     * the payment method's app or site.
     * If you'd prefer to redirect to a mobile application, you can alternatively supply an
     * application URI scheme.
     * This parameter is only used for cards and other redirect-based payment methods.
     */
    @optional
    string return_url;

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

      mixin AddBuilder!(typeof(this));

    }

    /**
     * Payment-method-specific configuration for this PaymentIntent.
     */
    @optional
    PaymentMethodOptionsParam payment_method_options;

    /**
     * Set to `true` to fail the payment attempt if the PaymentIntent transitions into
     * `requires_action`. This parameter is intended for simpler integrations that do not handle
     * customer actions, like [saving cards without
     * authentication](https://stripe.com/docs/payments/save-card-without-authentication).
     */
    @optional
    Nullable!(bool) error_on_requires_action;

    /**
     * Email address that the receipt for the resulting payment will be sent to. If `receipt_email`
     * is specified for a payment in live mode, a receipt will be sent regardless of your [email
     * settings](https://dashboard.stripe.com/account/emails).
     */
    @optional
    Json receipt_email;

    /**
     * The client secret of the PaymentIntent.
     */
    @optional
    string client_secret;

    static class PaymentMethodDataParams {
      @optional
      Json wechat_pay;

      @optional
      Json giropay;

      static class Param {
        @optional
        string bank;

        mixin AddBuilder!(typeof(this));

      }

      @optional
      Param ideal;

      @optional
      Param bacs_debit;

      static class PaymentMethodParam {
        @optional
        string transit_number;

        @optional
        string institution_number;

        @optional
        string account_number;

        mixin AddBuilder!(typeof(this));

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
        string session;

        mixin AddBuilder!(typeof(this));

      }

      @optional
      RadarOptions radar_options;

      @optional
      Param p24;

      @optional
      Json pix;

      @optional
      string[string] metadata;

      @optional
      Json link;

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

      mixin AddBuilder!(typeof(this));

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

    /**
     * Set to `true` to indicate that the customer is not in your checkout flow during this payment
     * attempt, and therefore is unable to authenticate. This parameter is intended for scenarios
     * where you collect card details and [charge them
     * later](https://stripe.com/docs/payments/cards/charging-saved-cards).
     */
    @optional
    Json off_session;

    /**
     * ID of the payment method (a PaymentMethod, Card, or [compatible
     * Source](https://stripe.com/docs/payments/payment-methods/transitioning#compatibility) object)
     * to attach to this PaymentIntent.
     */
    @optional
    string payment_method;

    /**
     * Specifies which fields in the response should be expanded.
     */
    @optional
    string[] expand;

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
     * If `setup_future_usage` is already set and you are performing a request using a publishable
     * key, you may only update the value from `on_session` to `off_session`.
     */
    @optional
    string setup_future_usage;

    /**
     * The list of payment method types (e.g. card) that this PaymentIntent is allowed to use. Use
     * automatic_payment_methods to manage payment methods from the [Stripe
     * Dashboard](https://dashboard.stripe.com/settings/payment_methods).
     */
    @optional
    string[] payment_method_types;

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
     * Shipping information for this PaymentIntent.
     */
    @optional
    Json shipping;

    /**
     * ID of the mandate to be used for this payment.
     */
    @optional
    string mandate;

    /**
     * Set to `true` only when using manual confirmation and the iOS or Android SDKs to handle
     * additional authentication steps.
     */
    @optional
    Nullable!(bool) use_stripe_sdk;

    mixin AddBuilder!(typeof(this));

  }

  static class PostPaymentIntentsIntentConfirmResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(PaymentIntent response) handleResponse200;

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
        handleResponse200(deserializeJson!(PaymentIntent)(res.readJson()));
        return;
      }
      if (handleResponseDefault is null) throw new Exception("Unhandled response status code default");
      handleResponseDefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

  }

  /**
   * <p>Confirm that your customer intends to pay with current or provided
   * payment method. Upon confirmation, the PaymentIntent will attempt to initiate
   * a payment.
   * If the selected payment method requires additional authentication steps, the
   * PaymentIntent will transition to the <code>requires_action</code> status and
   * suggest additional actions via <code>next_action</code>. If payment fails,
   * the PaymentIntent will transition to the <code>requires_payment_method</code> status. If
   * payment succeeds, the PaymentIntent will transition to the <code>succeeded</code>
   * status (or <code>requires_capture</code>, if <code>capture_method</code> is set to
   * <code>manual</code>).
   * If the <code>confirmation_method</code> is <code>automatic</code>, payment may be attempted
   * using our <a href="/docs/stripe-js/reference#stripe-handle-card-payment">client SDKs</a>
   * and the PaymentIntentâ€™s <a href="#payment_intent_object-client_secret">client_secret</a>.
   * After <code>next_action</code>s are handled by the client, no additional
   * confirmation is required to complete the payment.
   * If the <code>confirmation_method</code> is <code>manual</code>, all payment attempts must be
   * initiated using a secret key.
   * If any actions are required for the payment, the PaymentIntent will
   * return to the <code>requires_confirmation</code> state
   * after those actions are completed. Your server needs to then
   * explicitly re-confirm the PaymentIntent to initiate the next payment
   * attempt. Read the <a href="/docs/payments/payment-intents/web-manual">expanded
   * documentation</a>
   * to learn more about manual confirmation.</p>
   * See_Also: HTTP POST `/v1/payment_intents/{intent}/confirm`
   */
  void postPaymentIntentsIntentConfirm(
      PostPaymentIntentsIntentConfirmParams params,
      PostPaymentIntentsIntentConfirmBody requestBody,
      PostPaymentIntentsIntentConfirmResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/payment_intents/{intent}/confirm");
    if (!params.intent.isNull)
      requestor.setPathParam("intent", params.intent);
    requestor.setHeaderParam("Content-Type", "application/x-www-form-urlencoded");
    Security.apply(requestor);
    requestor.makeRequest(requestBody, responseHandler);
  }

  static class GetPaymentIntentsIntentParams {
    /**
     * The client secret of the PaymentIntent. Required if a publishable key is used to retrieve the
     * source.
     */
    string client_secret;

    /**
     * Specifies which fields in the response should be expanded.
     */
    string[] expand;

    /**
     */
    string intent;

    mixin AddBuilder!(typeof(this));

  }

  static class GetPaymentIntentsIntentResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(PaymentIntent response) handleResponse200;

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
        handleResponse200(deserializeJson!(PaymentIntent)(res.readJson()));
        return;
      }
      if (handleResponseDefault is null) throw new Exception("Unhandled response status code default");
      handleResponseDefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

  }

  /**
   * <p>Retrieves the details of a PaymentIntent that has previously been created. </p>
   * <p>Client-side retrieval using a publishable key is allowed when the <code>client_secret</code>
   * is provided in the query string. </p>
   * <p>When retrieved with a publishable key, only a subset of properties will be returned. Please
   * refer to the <a href="#payment_intent_object">payment intent</a> object reference for more
   * details.</p>
   * See_Also: HTTP GET `/v1/payment_intents/{intent}`
   */
  void getPaymentIntentsIntent(
      GetPaymentIntentsIntentParams params,
      GetPaymentIntentsIntentResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.GET,
        Servers.getServerUrl(),
        "/v1/payment_intents/{intent}");
    if (!params.client_secret.isNull)
      requestor.setQueryParam!("deepObject")("client_secret", params.client_secret);
    if (!params.expand.isNull)
      requestor.setQueryParam!("deepObject")("expand", params.expand);
    if (!params.intent.isNull)
      requestor.setPathParam("intent", params.intent);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class PostPaymentIntentsIntentParams {
    /**
     */
    string intent;

    mixin AddBuilder!(typeof(this));

  }

  static class PostPaymentIntentsIntentBody {
    /**
     * Amount intended to be collected by this PaymentIntent. A positive integer representing how
     * much to charge in the [smallest currency
     * unit](https://stripe.com/docs/currencies#zero-decimal) (e.g., 100 cents to charge $1.00 or
     * 100 to charge ÂĄ100, a zero-decimal currency). The minimum amount is $0.50 US or [equivalent
     * in charge currency](https://stripe.com/docs/currencies#minimum-and-maximum-charge-amounts).
     * The amount value supports up to eight digits (e.g., a value of 99999999 for a USD charge of
     * $999,999.99).
     */
    @optional
    Nullable!(int) amount;

    /**
     * For non-card charges, you can use this value as the complete description that appears on your
     * customersâ€™ statements. Must contain at least one letter, maximum 22 characters.
     */
    @optional
    string statement_descriptor;

    /**
     * Controls when the funds will be captured from the customer's account.
     */
    @optional
    string capture_method;

    /**
     * A string that identifies the resulting payment as part of a group. `transfer_group` may only
     * be provided if it has not been set. See the PaymentIntents [use case for connected
     * accounts](https://stripe.com/docs/payments/connected-accounts) for details.
     */
    @optional
    string transfer_group;

    /**
     * ID of the Customer this PaymentIntent belongs to, if one exists.
     * Payment methods attached to other Customers cannot be used with this PaymentIntent.
     * If present in combination with
     * [setup_future_usage](https://stripe.com/docs/api#payment_intent_object-setup_future_usage),
     * this PaymentIntent's payment method will be attached to the Customer after the PaymentIntent
     * has been confirmed and any required actions from the user are complete.
     */
    @optional
    string customer;

    /**
     * Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an
     * object. This can be useful for storing additional information about the object in a
     * structured format. Individual keys can be unset by posting an empty value to them. All keys
     * can be unset by posting an empty value to `metadata`.
     */
    @optional
    Json metadata;

    /**
     * Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in
     * lowercase. Must be a [supported currency](https://stripe.com/docs/currencies).
     */
    @optional
    string currency;

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

      mixin AddBuilder!(typeof(this));

    }

    /**
     * Payment-method-specific configuration for this PaymentIntent.
     */
    @optional
    PaymentMethodOptionsParam payment_method_options;

    /**
     * Email address that the receipt for the resulting payment will be sent to. If `receipt_email`
     * is specified for a payment in live mode, a receipt will be sent regardless of your [email
     * settings](https://dashboard.stripe.com/account/emails).
     */
    @optional
    Json receipt_email;

    static class PaymentMethodDataParams {
      @optional
      Json wechat_pay;

      @optional
      Json giropay;

      static class Param {
        @optional
        string bank;

        mixin AddBuilder!(typeof(this));

      }

      @optional
      Param ideal;

      @optional
      Param bacs_debit;

      static class PaymentMethodParam {
        @optional
        string transit_number;

        @optional
        string institution_number;

        @optional
        string account_number;

        mixin AddBuilder!(typeof(this));

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
        string session;

        mixin AddBuilder!(typeof(this));

      }

      @optional
      RadarOptions radar_options;

      @optional
      Param p24;

      @optional
      Json pix;

      @optional
      string[string] metadata;

      @optional
      Json link;

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

      mixin AddBuilder!(typeof(this));

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

    /**
     * ID of the payment method (a PaymentMethod, Card, or [compatible
     * Source](https://stripe.com/docs/payments/payment-methods/transitioning#compatibility) object)
     * to attach to this PaymentIntent.
     */
    @optional
    string payment_method;

    /**
     * Specifies which fields in the response should be expanded.
     */
    @optional
    string[] expand;

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
     * If `setup_future_usage` is already set and you are performing a request using a publishable
     * key, you may only update the value from `on_session` to `off_session`.
     */
    @optional
    string setup_future_usage;

    /**
     * Provides information about a card payment that customers see on their statements.
     * Concatenated with the prefix (shortened descriptor) or statement descriptor thatâ€™s set on
     * the account to form the complete statement descriptor. Maximum 22 characters for the
     * concatenated descriptor.
     */
    @optional
    string statement_descriptor_suffix;

    /**
     * An arbitrary string attached to the object. Often useful for displaying to users.
     */
    @optional
    string description;

    /**
     * The list of payment method types (e.g. card) that this PaymentIntent is allowed to use. Use
     * automatic_payment_methods to manage payment methods from the [Stripe
     * Dashboard](https://dashboard.stripe.com/settings/payment_methods).
     */
    @optional
    string[] payment_method_types;

    /**
     * The amount of the application fee (if any) that will be requested to be applied to the
     * payment and transferred to the application owner's Stripe account. The amount of the
     * application fee collected will be capped at the total payment amount. For more information,
     * see the PaymentIntents [use case for connected
     * accounts](https://stripe.com/docs/payments/connected-accounts).
     */
    @optional
    Json application_fee_amount;

    /**
     * Shipping information for this PaymentIntent.
     */
    @optional
    Json shipping;

    static class TransferDataUpdateParams {
      @optional
      Nullable!(int) amount;

      mixin AddBuilder!(typeof(this));

    }

    /**
     * The parameters used to automatically create a Transfer when the payment succeeds. For more
     * information, see the PaymentIntents [use case for connected
     * accounts](https://stripe.com/docs/payments/connected-accounts).
     */
    @optional
    TransferDataUpdateParams transfer_data;

    mixin AddBuilder!(typeof(this));

  }

  static class PostPaymentIntentsIntentResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(PaymentIntent response) handleResponse200;

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
        handleResponse200(deserializeJson!(PaymentIntent)(res.readJson()));
        return;
      }
      if (handleResponseDefault is null) throw new Exception("Unhandled response status code default");
      handleResponseDefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

  }

  /**
   * <p>Updates properties on a PaymentIntent object without confirming.</p>
   * <p>Depending on which properties you update, you may need to confirm the
   * PaymentIntent again. For example, updating the <code>payment_method</code> will
   * always require you to confirm the PaymentIntent again. If you prefer to
   * update and confirm at the same time, we recommend updating properties via
   * the <a href="/docs/api/payment_intents/confirm">confirm API</a> instead.</p>
   * See_Also: HTTP POST `/v1/payment_intents/{intent}`
   */
  void postPaymentIntentsIntent(
      PostPaymentIntentsIntentParams params,
      PostPaymentIntentsIntentBody requestBody,
      PostPaymentIntentsIntentResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/payment_intents/{intent}");
    if (!params.intent.isNull)
      requestor.setPathParam("intent", params.intent);
    requestor.setHeaderParam("Content-Type", "application/x-www-form-urlencoded");
    Security.apply(requestor);
    requestor.makeRequest(requestBody, responseHandler);
  }

  static class PostPaymentIntentsIntentCaptureParams {
    /**
     */
    string intent;

    mixin AddBuilder!(typeof(this));

  }

  static class PostPaymentIntentsIntentCaptureBody {
    static class TransferDataUpdateParams {
      @optional
      Nullable!(int) amount;

      mixin AddBuilder!(typeof(this));

    }

    /**
     * The parameters used to automatically create a Transfer when the payment
     * is captured. For more information, see the PaymentIntents [use case for connected
     * accounts](https://stripe.com/docs/payments/connected-accounts).
     */
    @optional
    TransferDataUpdateParams transfer_data;

    /**
     * For non-card charges, you can use this value as the complete description that appears on your
     * customersâ€™ statements. Must contain at least one letter, maximum 22 characters.
     */
    @optional
    string statement_descriptor;

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
     * Specifies which fields in the response should be expanded.
     */
    @optional
    string[] expand;

    /**
     * The amount to capture from the PaymentIntent, which must be less than or equal to the
     * original amount. Any additional amount will be automatically refunded. Defaults to the full
     * `amount_capturable` if not provided.
     */
    @optional
    Nullable!(int) amount_to_capture;

    /**
     * Provides information about a card payment that customers see on their statements.
     * Concatenated with the prefix (shortened descriptor) or statement descriptor thatâ€™s set on
     * the account to form the complete statement descriptor. Maximum 22 characters for the
     * concatenated descriptor.
     */
    @optional
    string statement_descriptor_suffix;

    mixin AddBuilder!(typeof(this));

  }

  static class PostPaymentIntentsIntentCaptureResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(PaymentIntent response) handleResponse200;

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
        handleResponse200(deserializeJson!(PaymentIntent)(res.readJson()));
        return;
      }
      if (handleResponseDefault is null) throw new Exception("Unhandled response status code default");
      handleResponseDefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

  }

  /**
   * <p>Capture the funds of an existing uncaptured PaymentIntent when its status is
   * <code>requires_capture</code>.</p>
   * <p>Uncaptured PaymentIntents will be canceled a set number of days after they are created (7 by
   * default).</p>
   * <p>Learn more about <a href="/docs/payments/capture-later">separate authorization and
   * capture</a>.</p>
   * See_Also: HTTP POST `/v1/payment_intents/{intent}/capture`
   */
  void postPaymentIntentsIntentCapture(
      PostPaymentIntentsIntentCaptureParams params,
      PostPaymentIntentsIntentCaptureBody requestBody,
      PostPaymentIntentsIntentCaptureResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/payment_intents/{intent}/capture");
    if (!params.intent.isNull)
      requestor.setPathParam("intent", params.intent);
    requestor.setHeaderParam("Content-Type", "application/x-www-form-urlencoded");
    Security.apply(requestor);
    requestor.makeRequest(requestBody, responseHandler);
  }

  static class PostPaymentIntentsIntentCancelParams {
    /**
     */
    string intent;

    mixin AddBuilder!(typeof(this));

  }

  static class PostPaymentIntentsIntentCancelBody {
    /**
     * Reason for canceling this PaymentIntent. Possible values are `duplicate`, `fraudulent`,
     * `requested_by_customer`, or `abandoned`
     */
    @optional
    string cancellation_reason;

    /**
     * Specifies which fields in the response should be expanded.
     */
    @optional
    string[] expand;

    mixin AddBuilder!(typeof(this));

  }

  static class PostPaymentIntentsIntentCancelResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(PaymentIntent response) handleResponse200;

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
        handleResponse200(deserializeJson!(PaymentIntent)(res.readJson()));
        return;
      }
      if (handleResponseDefault is null) throw new Exception("Unhandled response status code default");
      handleResponseDefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

  }

  /**
   * <p>A PaymentIntent object can be canceled when it is in one of these statuses:
   * <code>requires_payment_method</code>, <code>requires_capture</code>,
   * <code>requires_confirmation</code>, <code>requires_action</code> or, <a
   * href="/docs/payments/intents">in rare cases</a>, <code>processing</code>. </p>
   * <p>Once canceled, no additional charges will be made by the PaymentIntent and any operations on
   * the PaymentIntent will fail with an error. For PaymentIntents with
   * <code>status=â€™requires_captureâ€™</code>, the remaining <code>amount_capturable</code> will
   * automatically be refunded. </p>
   * <p>You cannot cancel the PaymentIntent for a Checkout Session. <a
   * href="/docs/api/checkout/sessions/expire">Expire the Checkout Session</a> instead.</p>
   * See_Also: HTTP POST `/v1/payment_intents/{intent}/cancel`
   */
  void postPaymentIntentsIntentCancel(
      PostPaymentIntentsIntentCancelParams params,
      PostPaymentIntentsIntentCancelBody requestBody,
      PostPaymentIntentsIntentCancelResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/payment_intents/{intent}/cancel");
    if (!params.intent.isNull)
      requestor.setPathParam("intent", params.intent);
    requestor.setHeaderParam("Content-Type", "application/x-www-form-urlencoded");
    Security.apply(requestor);
    requestor.makeRequest(requestBody, responseHandler);
  }

  static class PostPaymentIntentsIntentApplyCustomerBalanceParams {
    /**
     */
    string intent;

    mixin AddBuilder!(typeof(this));

  }

  static class PostPaymentIntentsIntentApplyCustomerBalanceBody {
    /**
     * Amount intended to be applied to this PaymentIntent from the customerâ€™s cash balance.
     * A positive integer representing how much to charge in the [smallest currency
     * unit](https://stripe.com/docs/currencies#zero-decimal) (e.g., 100 cents to charge $1.00 or
     * 100 to charge ÂĄ100, a zero-decimal currency).
     * The maximum amount is the amount of the PaymentIntent.
     * When omitted, the amount defaults to the remaining amount requested on the PaymentIntent.
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

    mixin AddBuilder!(typeof(this));

  }

  static class PostPaymentIntentsIntentApplyCustomerBalanceResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(PaymentIntent response) handleResponse200;

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
        handleResponse200(deserializeJson!(PaymentIntent)(res.readJson()));
        return;
      }
      if (handleResponseDefault is null) throw new Exception("Unhandled response status code default");
      handleResponseDefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

  }

  /**
   * <p>Manually reconcile the remaining amount for a customer_balance PaymentIntent.</p>
   * See_Also: HTTP POST `/v1/payment_intents/{intent}/apply_customer_balance`
   */
  void postPaymentIntentsIntentApplyCustomerBalance(
      PostPaymentIntentsIntentApplyCustomerBalanceParams params,
      PostPaymentIntentsIntentApplyCustomerBalanceBody requestBody,
      PostPaymentIntentsIntentApplyCustomerBalanceResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/payment_intents/{intent}/apply_customer_balance");
    if (!params.intent.isNull)
      requestor.setPathParam("intent", params.intent);
    requestor.setHeaderParam("Content-Type", "application/x-www-form-urlencoded");
    Security.apply(requestor);
    requestor.makeRequest(requestBody, responseHandler);
  }

  static class GetPaymentIntentsParams {
    /**
     * A filter on the list, based on the object `created` field. The value can be a string with an
     * integer Unix timestamp, or it can be a dictionary with a number of different query options.
     */
    Json created;

    /**
     * Only return PaymentIntents for the customer specified by this customer ID.
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

    mixin AddBuilder!(typeof(this));

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
      string object;

      @optional
      PaymentIntent[] data;

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
    void delegate(PaymentFlowsPaymentIntentList response) handleResponse200;

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
        handleResponse200(deserializeJson!(PaymentFlowsPaymentIntentList)(res.readJson()));
        return;
      }
      if (handleResponseDefault is null) throw new Exception("Unhandled response status code default");
      handleResponseDefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

  }

  /**
   * <p>Returns a list of PaymentIntents.</p>
   * See_Also: HTTP GET `/v1/payment_intents`
   */
  void getPaymentIntents(
      GetPaymentIntentsParams params,
      GetPaymentIntentsResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.GET,
        Servers.getServerUrl(),
        "/v1/payment_intents");
    if (!params.created.isNull)
      requestor.setQueryParam!("deepObject")("created", params.created);
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
    string transfer_group;

    static class SecretKeyParam {
      static class CustomerAcceptanceParam {
        @optional
        Nullable!(long) accepted_at;

        @optional
        string type;

        @optional
        Json offline;

        static class OnlineParam {
          @optional
          string user_agent;

          @optional
          string ip_address;

          mixin AddBuilder!(typeof(this));

        }

        @optional
        OnlineParam online;

        mixin AddBuilder!(typeof(this));

      }

      @optional
      CustomerAcceptanceParam customer_acceptance;

      mixin AddBuilder!(typeof(this));

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
    string return_url;

    /**
     * Email address that the receipt for the resulting payment will be sent to. If `receipt_email`
     * is specified for a payment in live mode, a receipt will be sent regardless of your [email
     * settings](https://dashboard.stripe.com/account/emails).
     */
    @optional
    string receipt_email;

    static class PaymentMethodDataParams {
      @optional
      Json wechat_pay;

      @optional
      Json giropay;

      static class Param {
        @optional
        string bank;

        mixin AddBuilder!(typeof(this));

      }

      @optional
      Param ideal;

      @optional
      Param bacs_debit;

      static class PaymentMethodParam {
        @optional
        string transit_number;

        @optional
        string institution_number;

        @optional
        string account_number;

        mixin AddBuilder!(typeof(this));

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
        string session;

        mixin AddBuilder!(typeof(this));

      }

      @optional
      RadarOptions radar_options;

      @optional
      Param p24;

      @optional
      Json pix;

      @optional
      string[string] metadata;

      @optional
      Json link;

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

      mixin AddBuilder!(typeof(this));

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

      mixin AddBuilder!(typeof(this));

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
    string on_behalf_of;

    /**
     * Controls when the funds will be captured from the customer's account.
     */
    @optional
    string capture_method;

    /**
     * ID of the Customer this PaymentIntent belongs to, if one exists.
     * Payment methods attached to other Customers cannot be used with this PaymentIntent.
     * If present in combination with
     * [setup_future_usage](https://stripe.com/docs/api#payment_intent_object-setup_future_usage),
     * this PaymentIntent's payment method will be attached to the Customer after the PaymentIntent
     * has been confirmed and any required actions from the user are complete.
     */
    @optional
    string customer;

    /**
     * Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in
     * lowercase. Must be a [supported currency](https://stripe.com/docs/currencies).
     */
    @optional
    string currency;

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
      string session;

      mixin AddBuilder!(typeof(this));

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
      string destination;

      mixin AddBuilder!(typeof(this));

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
    string mandate;

    /**
     * Amount intended to be collected by this PaymentIntent. A positive integer representing how
     * much to charge in the [smallest currency
     * unit](https://stripe.com/docs/currencies#zero-decimal) (e.g., 100 cents to charge $1.00 or
     * 100 to charge ÂĄ100, a zero-decimal currency). The minimum amount is $0.50 US or [equivalent
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
    string[string] metadata;

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
    string payment_method;

    /**
     * Specifies which fields in the response should be expanded.
     */
    @optional
    string[] expand;

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
     * customersâ€™ statements. Must contain at least one letter, maximum 22 characters.
     */
    @optional
    string statement_descriptor;

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

      mixin AddBuilder!(typeof(this));

    }

    /**
     * Payment-method-specific configuration for this PaymentIntent.
     */
    @optional
    PaymentMethodOptionsParam payment_method_options;

    @optional
    string confirmation_method;

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
     * Concatenated with the prefix (shortened descriptor) or statement descriptor thatâ€™s set on
     * the account to form the complete statement descriptor. Maximum 22 characters for the
     * concatenated descriptor.
     */
    @optional
    string statement_descriptor_suffix;

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
    string setup_future_usage;

    /**
     * An arbitrary string attached to the object. Often useful for displaying to users.
     */
    @optional
    string description;

    static class OptionalFieldsShipping {
      @optional
      string phone;

      @optional
      string carrier;

      static class OptionalFieldsAddress {
        @optional
        string line1;

        @optional
        string line2;

        @optional
        string country;

        @optional
        string postal_code;

        @optional
        string city;

        @optional
        string state;

        mixin AddBuilder!(typeof(this));

      }

      @optional
      OptionalFieldsAddress address;

      @optional
      string tracking_number;

      @optional
      string name;

      mixin AddBuilder!(typeof(this));

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
    string[] payment_method_types;

    mixin AddBuilder!(typeof(this));

  }

  static class PostPaymentIntentsResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(PaymentIntent response) handleResponse200;

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
        handleResponse200(deserializeJson!(PaymentIntent)(res.readJson()));
        return;
      }
      if (handleResponseDefault is null) throw new Exception("Unhandled response status code default");
      handleResponseDefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

  }

  /**
   * <p>Creates a PaymentIntent object.</p>
   * <p>After the PaymentIntent is created, attach a payment method and <a
   * href="/docs/api/payment_intents/confirm">confirm</a>
   * to continue the payment. You can read more about the different payment flows
   * available via the Payment Intents API <a href="/docs/payments/payment-intents">here</a>.</p>
   * <p>When <code>confirm=true</code> is used during creation, it is equivalent to creating
   * and confirming the PaymentIntent in the same call. You may use any parameters
   * available in the <a href="/docs/api/payment_intents/confirm">confirm API</a> when
   * <code>confirm=true</code>
   * is supplied.</p>
   * See_Also: HTTP POST `/v1/payment_intents`
   */
  void postPaymentIntents(
      PostPaymentIntentsBody requestBody,
      PostPaymentIntentsResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/payment_intents");
    requestor.setHeaderParam("Content-Type", "application/x-www-form-urlencoded");
    Security.apply(requestor);
    requestor.makeRequest(requestBody, responseHandler);
  }

  mixin AddBuilder!(typeof(this));

}

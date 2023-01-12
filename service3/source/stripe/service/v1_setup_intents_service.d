// File automatically generated from OpenAPI spec.
module stripe.service.v1_setup_intents_service;

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
public import stripe.model.setup_intent : SetupIntent;

/**
 * Service to make REST API calls to paths beginning with: /v1/setup_intents
 */
class V1SetupIntentsService {
  static class GetSetupIntentsIntentParams {
    /**
     * The client secret of the SetupIntent. Required if a publishable key is used to retrieve the
     * SetupIntent.
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

  static class GetSetupIntentsIntentResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(SetupIntent response) handleResponse200;

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
        handleResponse200(deserializeJson!(SetupIntent)(res.readJson()));
        return;
      }
      if (handleResponseDefault is null) throw new Exception("Unhandled response status code default");
      handleResponseDefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

  }

  /**
   * <p>Retrieves the details of a SetupIntent that has previously been created. </p>
   * <p>Client-side retrieval using a publishable key is allowed when the <code>client_secret</code>
   * is provided in the query string. </p>
   * <p>When retrieved with a publishable key, only a subset of properties will be returned. Please
   * refer to the <a href="#setup_intent_object">SetupIntent</a> object reference for more
   * details.</p>
   * See_Also: HTTP GET `/v1/setup_intents/{intent}`
   */
  void getSetupIntentsIntent(
      GetSetupIntentsIntentParams params,
      GetSetupIntentsIntentResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.GET,
        Servers.getServerUrl(),
        "/v1/setup_intents/{intent}");
    if (!params.client_secret.isNull)
      requestor.setQueryParam!("deepObject")("client_secret", params.client_secret);
    if (!params.expand.isNull)
      requestor.setQueryParam!("deepObject")("expand", params.expand);
    if (!params.intent.isNull)
      requestor.setPathParam("intent", params.intent);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class PostSetupIntentsIntentParams {
    /**
     */
    string intent;

    mixin AddBuilder!(typeof(this));

  }

  static class PostSetupIntentsIntentBody {
    /**
     * ID of the Customer this SetupIntent belongs to, if one exists.
     * If present, the SetupIntent's payment method will be attached to the Customer on successful
     * setup. Payment methods attached to other Customers cannot be used with this SetupIntent.
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

    static class PaymentMethodOptionsParam {
      static class SetupIntentParam {
        @optional
        string request_three_d_secure;

        static class SetupIntentMandateOptionsParam {
          @optional
          Nullable!(int) amount;

          @optional
          Nullable!(long) start_date;

          @optional
          Nullable!(long) end_date;

          @optional
          string currency;

          @optional
          string amount_type;

          @optional
          Nullable!(int) interval_count;

          @optional
          string reference;

          @optional
          string[] supported_types;

          @optional
          string description;

          @optional
          string interval;

          mixin AddBuilder!(typeof(this));

        }

        @optional
        SetupIntentMandateOptionsParam mandate_options;

        @optional
        string network;

        mixin AddBuilder!(typeof(this));

      }

      @optional
      SetupIntentParam card;

      static class SetupIntentPaymentMethodOptionsParam {
        @optional
        string persistent_token;

        mixin AddBuilder!(typeof(this));

      }

      @optional
      SetupIntentPaymentMethodOptionsParam link;

      @optional
      SetupIntentPaymentMethodOptionsParam us_bank_account;

      @optional
      SetupIntentPaymentMethodOptionsParam acss_debit;

      @optional
      SetupIntentPaymentMethodOptionsParam blik;

      @optional
      SetupIntentPaymentMethodOptionsParam sepa_debit;

      mixin AddBuilder!(typeof(this));

    }

    /**
     * Payment-method-specific configuration for this SetupIntent.
     */
    @optional
    PaymentMethodOptionsParam payment_method_options;

    /**
     * If present, the SetupIntent's payment method will be attached to the in-context Stripe
     * Account.
     * It can only be used for this Stripe Account’s own money movement flows like InboundTransfer
     * and OutboundTransfers. It cannot be set to true when setting up a PaymentMethod for a
     * Customer, and defaults to false when attaching a PaymentMethod to a Customer.
     */
    @optional
    Nullable!(bool) attach_to_self;

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
     * When included, this hash creates a PaymentMethod that is set as the
     * [`payment_method`](https://stripe.com/docs/api/setup_intents/object#setup_intent_object-payme
     * nt_method)
     * value in the SetupIntent.
     */
    @optional
    PaymentMethodDataParams payment_method_data;

    /**
     * ID of the payment method (a PaymentMethod, Card, or saved Source object) to attach to this
     * SetupIntent.
     */
    @optional
    string payment_method;

    /**
     * Indicates the directions of money movement for which this payment method is intended to be
     * used.
     * Include `inbound` if you intend to use the payment method as the origin to pull funds from.
     * Include `outbound` if you intend to use the payment method as the destination to send funds
     * to. You can include both if you intend to use the payment method for both purposes.
     */
    @optional
    string[] flow_directions;

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

    /**
     * The list of payment method types (e.g. card) that this SetupIntent is allowed to set up. If
     * this is not provided, defaults to ["card"].
     */
    @optional
    string[] payment_method_types;

    mixin AddBuilder!(typeof(this));

  }

  static class PostSetupIntentsIntentResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(SetupIntent response) handleResponse200;

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
        handleResponse200(deserializeJson!(SetupIntent)(res.readJson()));
        return;
      }
      if (handleResponseDefault is null) throw new Exception("Unhandled response status code default");
      handleResponseDefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

  }

  /**
   * <p>Updates a SetupIntent object.</p>
   * See_Also: HTTP POST `/v1/setup_intents/{intent}`
   */
  void postSetupIntentsIntent(
      PostSetupIntentsIntentParams params,
      PostSetupIntentsIntentBody requestBody,
      PostSetupIntentsIntentResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/setup_intents/{intent}");
    if (!params.intent.isNull)
      requestor.setPathParam("intent", params.intent);
    requestor.setHeaderParam("Content-Type", "application/x-www-form-urlencoded");
    Security.apply(requestor);
    requestor.makeRequest(requestBody, responseHandler);
  }

  static class GetSetupIntentsParams {
    /**
     * If present, the SetupIntent's payment method will be attached to the in-context Stripe
     * Account.
     * It can only be used for this Stripe Account’s own money movement flows like InboundTransfer
     * and OutboundTransfers. It cannot be set to true when setting up a PaymentMethod for a
     * Customer, and defaults to false when attaching a PaymentMethod to a Customer.
     */
    Nullable!(bool) attach_to_self;

    /**
     * A filter on the list, based on the object `created` field. The value can be a string with an
     * integer Unix timestamp, or it can be a dictionary with a number of different query options.
     */
    Json created;

    /**
     * Only return SetupIntents for the customer specified by this customer ID.
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
     * Only return SetupIntents associated with the specified payment method.
     */
    string payment_method;

    /**
     * A cursor for use in pagination. `starting_after` is an object ID that defines your place in
     * the list. For instance, if you make a list request and receive 100 objects, ending with
     * `obj_foo`, your subsequent call can include `starting_after=obj_foo` in order to fetch the
     * next page of the list.
     */
    string starting_after;

    mixin AddBuilder!(typeof(this));

  }

  static class GetSetupIntentsResponseHandler : ResponseHandler {

    static class PaymentFlowsSetupIntentList {
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
      SetupIntent[] data;

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
    void delegate(PaymentFlowsSetupIntentList response) handleResponse200;

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
        handleResponse200(deserializeJson!(PaymentFlowsSetupIntentList)(res.readJson()));
        return;
      }
      if (handleResponseDefault is null) throw new Exception("Unhandled response status code default");
      handleResponseDefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

  }

  /**
   * <p>Returns a list of SetupIntents.</p>
   * See_Also: HTTP GET `/v1/setup_intents`
   */
  void getSetupIntents(
      GetSetupIntentsParams params,
      GetSetupIntentsResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.GET,
        Servers.getServerUrl(),
        "/v1/setup_intents");
    if (!params.attach_to_self.isNull)
      requestor.setQueryParam!("deepObject")("attach_to_self", params.attach_to_self);
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
    if (!params.payment_method.isNull)
      requestor.setQueryParam!("deepObject")("payment_method", params.payment_method);
    if (!params.starting_after.isNull)
      requestor.setQueryParam!("deepObject")("starting_after", params.starting_after);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class PostSetupIntentsBody {
    /**
     * Set to `true` to attempt to confirm this SetupIntent immediately. This parameter defaults to
     * `false`. If the payment method attached is a card, a return_url may be provided in case
     * additional authentication is required.
     */
    @optional
    Nullable!(bool) confirm;

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
     * [`confirm=true`](https://stripe.com/docs/api/setup_intents/create#create_setup_intent-confirm
     * ).
     */
    @optional
    SecretKeyParam mandate_data;

    /**
     * The URL to redirect your customer back to after they authenticate or cancel their payment on
     * the payment method's app or site. If you'd prefer to redirect to a mobile application, you
     * can alternatively supply an application URI scheme. This parameter can only be used with
     * [`confirm=true`](https://stripe.com/docs/api/setup_intents/create#create_setup_intent-confirm
     * ).
     */
    @optional
    string return_url;

    /**
     * ID of the Customer this SetupIntent belongs to, if one exists.
     * If present, the SetupIntent's payment method will be attached to the Customer on successful
     * setup. Payment methods attached to other Customers cannot be used with this SetupIntent.
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
    string[string] metadata;

    static class PaymentMethodOptionsParam {
      static class SetupIntentParam {
        @optional
        string request_three_d_secure;

        static class SetupIntentMandateOptionsParam {
          @optional
          Nullable!(int) amount;

          @optional
          Nullable!(long) start_date;

          @optional
          Nullable!(long) end_date;

          @optional
          string currency;

          @optional
          string amount_type;

          @optional
          Nullable!(int) interval_count;

          @optional
          string reference;

          @optional
          string[] supported_types;

          @optional
          string description;

          @optional
          string interval;

          mixin AddBuilder!(typeof(this));

        }

        @optional
        SetupIntentMandateOptionsParam mandate_options;

        @optional
        string network;

        mixin AddBuilder!(typeof(this));

      }

      @optional
      SetupIntentParam card;

      static class SetupIntentPaymentMethodOptionsParam {
        @optional
        string persistent_token;

        mixin AddBuilder!(typeof(this));

      }

      @optional
      SetupIntentPaymentMethodOptionsParam link;

      @optional
      SetupIntentPaymentMethodOptionsParam us_bank_account;

      @optional
      SetupIntentPaymentMethodOptionsParam acss_debit;

      @optional
      SetupIntentPaymentMethodOptionsParam blik;

      @optional
      SetupIntentPaymentMethodOptionsParam sepa_debit;

      mixin AddBuilder!(typeof(this));

    }

    /**
     * Payment-method-specific configuration for this SetupIntent.
     */
    @optional
    PaymentMethodOptionsParam payment_method_options;

    /**
     * Indicates how the payment method is intended to be used in the future. If not provided, this
     * value defaults to `off_session`.
     */
    @optional
    string usage;

    static class SetupIntentSingleUseParams {
      @optional
      Nullable!(int) amount;

      @optional
      string currency;

      mixin AddBuilder!(typeof(this));

    }

    /**
     * If this hash is populated, this SetupIntent will generate a single_use Mandate on success.
     */
    @optional
    SetupIntentSingleUseParams single_use;

    /**
     * If present, the SetupIntent's payment method will be attached to the in-context Stripe
     * Account.
     * It can only be used for this Stripe Account’s own money movement flows like InboundTransfer
     * and OutboundTransfers. It cannot be set to true when setting up a PaymentMethod for a
     * Customer, and defaults to false when attaching a PaymentMethod to a Customer.
     */
    @optional
    Nullable!(bool) attach_to_self;

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
     * When included, this hash creates a PaymentMethod that is set as the
     * [`payment_method`](https://stripe.com/docs/api/setup_intents/object#setup_intent_object-payme
     * nt_method)
     * value in the SetupIntent.
     */
    @optional
    PaymentMethodDataParams payment_method_data;

    /**
     * ID of the payment method (a PaymentMethod, Card, or saved Source object) to attach to this
     * SetupIntent.
     */
    @optional
    string payment_method;

    /**
     * Indicates the directions of money movement for which this payment method is intended to be
     * used.
     * Include `inbound` if you intend to use the payment method as the origin to pull funds from.
     * Include `outbound` if you intend to use the payment method as the destination to send funds
     * to. You can include both if you intend to use the payment method for both purposes.
     */
    @optional
    string[] flow_directions;

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

    /**
     * The list of payment method types (e.g. card) that this SetupIntent is allowed to use. If this
     * is not provided, defaults to ["card"].
     */
    @optional
    string[] payment_method_types;

    /**
     * The Stripe account ID for which this SetupIntent is created.
     */
    @optional
    string on_behalf_of;

    mixin AddBuilder!(typeof(this));

  }

  static class PostSetupIntentsResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(SetupIntent response) handleResponse200;

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
        handleResponse200(deserializeJson!(SetupIntent)(res.readJson()));
        return;
      }
      if (handleResponseDefault is null) throw new Exception("Unhandled response status code default");
      handleResponseDefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

  }

  /**
   * <p>Creates a SetupIntent object.</p>
   * <p>After the SetupIntent is created, attach a payment method and <a
   * href="/docs/api/setup_intents/confirm">confirm</a>
   * to collect any required permissions to charge the payment method later.</p>
   * See_Also: HTTP POST `/v1/setup_intents`
   */
  void postSetupIntents(
      PostSetupIntentsBody requestBody,
      PostSetupIntentsResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/setup_intents");
    requestor.setHeaderParam("Content-Type", "application/x-www-form-urlencoded");
    Security.apply(requestor);
    requestor.makeRequest(requestBody, responseHandler);
  }

  static class PostSetupIntentsIntentConfirmParams {
    /**
     */
    string intent;

    mixin AddBuilder!(typeof(this));

  }

  static class PostSetupIntentsIntentConfirmBody {
    /**
     * This hash contains details about the Mandate to create
     */
    @optional
    Json mandate_data;

    /**
     * The URL to redirect your customer back to after they authenticate on the payment method's app
     * or site.
     * If you'd prefer to redirect to a mobile application, you can alternatively supply an
     * application URI scheme.
     * This parameter is only used for cards and other redirect-based payment methods.
     */
    @optional
    string return_url;

    static class PaymentMethodOptionsParam {
      static class SetupIntentParam {
        @optional
        string request_three_d_secure;

        static class SetupIntentMandateOptionsParam {
          @optional
          Nullable!(int) amount;

          @optional
          Nullable!(long) start_date;

          @optional
          Nullable!(long) end_date;

          @optional
          string currency;

          @optional
          string amount_type;

          @optional
          Nullable!(int) interval_count;

          @optional
          string reference;

          @optional
          string[] supported_types;

          @optional
          string description;

          @optional
          string interval;

          mixin AddBuilder!(typeof(this));

        }

        @optional
        SetupIntentMandateOptionsParam mandate_options;

        @optional
        string network;

        mixin AddBuilder!(typeof(this));

      }

      @optional
      SetupIntentParam card;

      static class SetupIntentPaymentMethodOptionsParam {
        @optional
        string persistent_token;

        mixin AddBuilder!(typeof(this));

      }

      @optional
      SetupIntentPaymentMethodOptionsParam link;

      @optional
      SetupIntentPaymentMethodOptionsParam us_bank_account;

      @optional
      SetupIntentPaymentMethodOptionsParam acss_debit;

      @optional
      SetupIntentPaymentMethodOptionsParam blik;

      @optional
      SetupIntentPaymentMethodOptionsParam sepa_debit;

      mixin AddBuilder!(typeof(this));

    }

    /**
     * Payment-method-specific configuration for this SetupIntent.
     */
    @optional
    PaymentMethodOptionsParam payment_method_options;

    /**
     * The client secret of the SetupIntent.
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
     * When included, this hash creates a PaymentMethod that is set as the
     * [`payment_method`](https://stripe.com/docs/api/setup_intents/object#setup_intent_object-payme
     * nt_method)
     * value in the SetupIntent.
     */
    @optional
    PaymentMethodDataParams payment_method_data;

    /**
     * ID of the payment method (a PaymentMethod, Card, or saved Source object) to attach to this
     * SetupIntent.
     */
    @optional
    string payment_method;

    /**
     * Specifies which fields in the response should be expanded.
     */
    @optional
    string[] expand;

    mixin AddBuilder!(typeof(this));

  }

  static class PostSetupIntentsIntentConfirmResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(SetupIntent response) handleResponse200;

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
        handleResponse200(deserializeJson!(SetupIntent)(res.readJson()));
        return;
      }
      if (handleResponseDefault is null) throw new Exception("Unhandled response status code default");
      handleResponseDefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

  }

  /**
   * <p>Confirm that your customer intends to set up the current or
   * provided payment method. For example, you would confirm a SetupIntent
   * when a customer hits the “Save” button on a payment method management
   * page on your website.</p>
   * <p>If the selected payment method does not require any additional
   * steps from the customer, the SetupIntent will transition to the
   * <code>succeeded</code> status.</p>
   * <p>Otherwise, it will transition to the <code>requires_action</code> status and
   * suggest additional actions via <code>next_action</code>. If setup fails,
   * the SetupIntent will transition to the
   * <code>requires_payment_method</code> status.</p>
   * See_Also: HTTP POST `/v1/setup_intents/{intent}/confirm`
   */
  void postSetupIntentsIntentConfirm(
      PostSetupIntentsIntentConfirmParams params,
      PostSetupIntentsIntentConfirmBody requestBody,
      PostSetupIntentsIntentConfirmResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/setup_intents/{intent}/confirm");
    if (!params.intent.isNull)
      requestor.setPathParam("intent", params.intent);
    requestor.setHeaderParam("Content-Type", "application/x-www-form-urlencoded");
    Security.apply(requestor);
    requestor.makeRequest(requestBody, responseHandler);
  }

  static class PostSetupIntentsIntentCancelParams {
    /**
     */
    string intent;

    mixin AddBuilder!(typeof(this));

  }

  static class PostSetupIntentsIntentCancelBody {
    /**
     * Reason for canceling this SetupIntent. Possible values are `abandoned`,
     * `requested_by_customer`, or `duplicate`
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

  static class PostSetupIntentsIntentCancelResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(SetupIntent response) handleResponse200;

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
        handleResponse200(deserializeJson!(SetupIntent)(res.readJson()));
        return;
      }
      if (handleResponseDefault is null) throw new Exception("Unhandled response status code default");
      handleResponseDefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

  }

  /**
   * <p>A SetupIntent object can be canceled when it is in one of these statuses:
   * <code>requires_payment_method</code>, <code>requires_confirmation</code>, or
   * <code>requires_action</code>. </p>
   * <p>Once canceled, setup is abandoned and any operations on the SetupIntent will fail with an
   * error.</p>
   * See_Also: HTTP POST `/v1/setup_intents/{intent}/cancel`
   */
  void postSetupIntentsIntentCancel(
      PostSetupIntentsIntentCancelParams params,
      PostSetupIntentsIntentCancelBody requestBody,
      PostSetupIntentsIntentCancelResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/setup_intents/{intent}/cancel");
    if (!params.intent.isNull)
      requestor.setPathParam("intent", params.intent);
    requestor.setHeaderParam("Content-Type", "application/x-www-form-urlencoded");
    Security.apply(requestor);
    requestor.makeRequest(requestBody, responseHandler);
  }

  static class PostSetupIntentsIntentVerifyMicrodepositsParams {
    /**
     */
    string intent;

    mixin AddBuilder!(typeof(this));

  }

  static class PostSetupIntentsIntentVerifyMicrodepositsBody {
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
     * The client secret of the SetupIntent.
     */
    @optional
    string client_secret;

    mixin AddBuilder!(typeof(this));

  }

  static class PostSetupIntentsIntentVerifyMicrodepositsResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(SetupIntent response) handleResponse200;

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
        handleResponse200(deserializeJson!(SetupIntent)(res.readJson()));
        return;
      }
      if (handleResponseDefault is null) throw new Exception("Unhandled response status code default");
      handleResponseDefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

  }

  /**
   * <p>Verifies microdeposits on a SetupIntent object.</p>
   * See_Also: HTTP POST `/v1/setup_intents/{intent}/verify_microdeposits`
   */
  void postSetupIntentsIntentVerifyMicrodeposits(
      PostSetupIntentsIntentVerifyMicrodepositsParams params,
      PostSetupIntentsIntentVerifyMicrodepositsBody requestBody,
      PostSetupIntentsIntentVerifyMicrodepositsResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/setup_intents/{intent}/verify_microdeposits");
    if (!params.intent.isNull)
      requestor.setPathParam("intent", params.intent);
    requestor.setHeaderParam("Content-Type", "application/x-www-form-urlencoded");
    Security.apply(requestor);
    requestor.makeRequest(requestBody, responseHandler);
  }

  mixin AddBuilder!(typeof(this));

}

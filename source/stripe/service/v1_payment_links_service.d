// File automatically generated from OpenAPI spec.
module stripe.service.v1_payment_links_service;

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
public import stripe.model.item : Item;
public import stripe.model.payment_link : PaymentLink;

/**
 * Service to make REST API calls to paths beginning with: /v1/payment_links
 */
class V1PaymentLinksService {
  static class GetPaymentLinksParams {
    /**
     * Only return payment links that are active or inactive (e.g., pass `false` to list all
     * inactive payment links).
     */
    Nullable!(bool) active;

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

  static class GetPaymentLinksResponseHandler : ResponseHandler {

    static class PaymentLinksResourcePaymentLinkList {
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
      PaymentLink[] data;

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
    void delegate(PaymentLinksResourcePaymentLinkList response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponsedefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        if (handleResponse200 is null) throw new Exception("Unhandled response status code 200");
        handleResponse200(deserializeJson!(PaymentLinksResourcePaymentLinkList)(res.readJson()));
        return;
      }
      if (handleResponsedefault is null) throw new Exception("Unhandled response status code default");
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

  }

  /**
   * <p>Returns a list of your payment links.</p>
   * See_Also: HTTP GET `/v1/payment_links`
   */
  void getPaymentLinks(
      GetPaymentLinksParams params,
      GetPaymentLinksResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.GET,
        Servers.getServerUrl(),
        "/v1/payment_links");
    if (!params.active.isNull)
      requestor.setQueryParam!("deepObject")("active", params.active);
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

  static class PostPaymentLinksBody {
    /**
     * Configuration for collecting the customer's billing address.
     */
    @optional
    string billing_address_collection;

    static class CustomTextParam {
      @optional
      Json shipping_address;

      @optional
      Json submit;

      mixin AddBuilder!(typeof(this));

    }

    /**
     * Display additional text for your customers using custom text.
     */
    @optional
    CustomTextParam custom_text;

    static class ConsentCollectionParams {
      @optional
      string terms_of_service;

      @optional
      string promotions;

      mixin AddBuilder!(typeof(this));

    }

    /**
     * Configure fields to gather active consent from customers.
     */
    @optional
    ConsentCollectionParams consent_collection;

    /**
     * Specify whether Checkout should collect a payment method. When set to `if_required`, Checkout
     * will not collect a payment method when the total due for the session is 0.This may occur if
     * the Checkout Session includes a free trial or a discount.
     * Can only be set in `subscription` mode.
     * If you'd like information on how to collect a payment method outside of Checkout, read the
     * guide on [configuring subscriptions with a free
     * trial](https://stripe.com/docs/payments/checkout/free-trials).
     */
    @optional
    string payment_method_collection;

    static class AfterCompletionParams {
      @optional
      string type;

      static class AfterCompletionConfirmationPageParams {
        @optional
        string custom_message;

        mixin AddBuilder!(typeof(this));

      }

      @optional
      AfterCompletionConfirmationPageParams hosted_confirmation;

      static class AfterCompletionRedirectParams {
        @optional
        string url;

        mixin AddBuilder!(typeof(this));

      }

      @optional
      AfterCompletionRedirectParams redirect;

      mixin AddBuilder!(typeof(this));

    }

    /**
     * Behavior after the purchase is complete.
     */
    @optional
    AfterCompletionParams after_completion;

    /**
     * The account on behalf of which to charge.
     */
    @optional
    string on_behalf_of;

    static class ShippingOptionParams {
      @optional
      string shipping_rate;

      mixin AddBuilder!(typeof(this));

    }

    /**
     * The shipping rate options to apply to [checkout
     * sessions](https://stripe.com/docs/api/checkout/sessions) created by this payment link.
     */
    @optional
    ShippingOptionParams[] shipping_options;

    static class TaxIdCollectionParams {
      @optional
      Nullable!(bool) enabled;

      mixin AddBuilder!(typeof(this));

    }

    /**
     * Controls tax ID collection during checkout.
     */
    @optional
    TaxIdCollectionParams tax_id_collection;

    /**
     * Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an
     * object. This can be useful for storing additional information about the object in a
     * structured format. Individual keys can be unset by posting an empty value to them. All keys
     * can be unset by posting an empty value to `metadata`. Metadata associated with this Payment
     * Link will automatically be copied to [checkout
     * sessions](https://stripe.com/docs/api/checkout/sessions) created by this payment link.
     */
    @optional
    string[string] metadata;

    /**
     * Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in
     * lowercase. Must be a [supported currency](https://stripe.com/docs/currencies) and supported
     * by each line item's price.
     */
    @optional
    string currency;

    /**
     * Enables user redeemable promotion codes.
     */
    @optional
    Nullable!(bool) allow_promotion_codes;

    /**
     * A non-negative decimal between 0 and 100, with at most two decimal places. This represents
     * the percentage of the subscription invoice subtotal that will be transferred to the
     * application owner's Stripe account. There must be at least 1 line item with a recurring price
     * to use this field.
     */
    @optional
    Nullable!(float) application_fee_percent;

    static class LineItemsCreateParams {
      @optional
      Nullable!(int) quantity;

      @optional
      string price;

      static class AdjustableQuantityParams {
        @optional
        Nullable!(bool) enabled;

        @optional
        Nullable!(int) minimum;

        @optional
        Nullable!(int) maximum;

        mixin AddBuilder!(typeof(this));

      }

      @optional
      AdjustableQuantityParams adjustable_quantity;

      mixin AddBuilder!(typeof(this));

    }

    /**
     * The line items representing what is being sold. Each line item represents an item being sold.
     * Up to 20 line items are supported.
     */
    @optional
    LineItemsCreateParams[] line_items;

    static class PaymentIntentDataParams {
      @optional
      string setup_future_usage;

      @optional
      string capture_method;

      mixin AddBuilder!(typeof(this));

    }

    /**
     * A subset of parameters to be passed to PaymentIntent creation for Checkout Sessions in
     * `payment` mode.
     */
    @optional
    PaymentIntentDataParams payment_intent_data;

    /**
     * Specifies which fields in the response should be expanded.
     */
    @optional
    string[] expand;

    /**
     * Configures whether [checkout sessions](https://stripe.com/docs/api/checkout/sessions) created
     * by this payment link create a [Customer](https://stripe.com/docs/api/customers).
     */
    @optional
    string customer_creation;

    static class SubscriptionDataParams {
      @optional
      string description;

      @optional
      Nullable!(int) trial_period_days;

      mixin AddBuilder!(typeof(this));

    }

    /**
     * When creating a subscription, the specified configuration data will be used. There must be at
     * least one line item with a recurring price to use `subscription_data`.
     */
    @optional
    SubscriptionDataParams subscription_data;

    static class PhoneNumberCollectionParams {
      @optional
      Nullable!(bool) enabled;

      mixin AddBuilder!(typeof(this));

    }

    /**
     * Controls phone number collection settings during checkout.
     * We recommend that you review your privacy policy and check with your legal contacts.
     */
    @optional
    PhoneNumberCollectionParams phone_number_collection;

    static class TransferDataParams {
      @optional
      Nullable!(int) amount;

      @optional
      string destination;

      mixin AddBuilder!(typeof(this));

    }

    /**
     * The account (if any) the payments will be attributed to for tax reporting, and where funds
     * from each payment will be transferred to.
     */
    @optional
    TransferDataParams transfer_data;

    /**
     * The amount of the application fee (if any) that will be requested to be applied to the
     * payment and transferred to the application owner's Stripe account. Can only be applied when
     * there are no line items with recurring prices.
     */
    @optional
    Nullable!(int) application_fee_amount;

    /**
     * Describes the type of transaction being performed in order to customize relevant text on the
     * page, such as the submit button. Changing this value will also affect the hostname in the
     * [url](https://stripe.com/docs/api/payment_links/payment_links/object#url) property (example:
     * `donate.stripe.com`).
     */
    @optional
    string submit_type;

    static class ShippingAddressCollectionParams {
      @optional
      string[] allowed_countries;

      mixin AddBuilder!(typeof(this));

    }

    /**
     * Configuration for collecting the customer's shipping address.
     */
    @optional
    ShippingAddressCollectionParams shipping_address_collection;

    static class AutomaticTaxParams {
      @optional
      Nullable!(bool) enabled;

      mixin AddBuilder!(typeof(this));

    }

    /**
     * Configuration for automatic tax collection.
     */
    @optional
    AutomaticTaxParams automatic_tax;

    /**
     * The list of payment method types that customers can use. If no value is passed, Stripe will
     * dynamically show relevant payment methods from your [payment method
     * settings](https://dashboard.stripe.com/settings/payment_methods) (20+ payment methods
     * [supported](https://stripe.com/docs/payments/payment-methods/integration-options#payment-meth
     * od-product-support)).
     */
    @optional
    string[] payment_method_types;

    mixin AddBuilder!(typeof(this));

  }

  static class PostPaymentLinksResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(PaymentLink response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponsedefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        if (handleResponse200 is null) throw new Exception("Unhandled response status code 200");
        handleResponse200(deserializeJson!(PaymentLink)(res.readJson()));
        return;
      }
      if (handleResponsedefault is null) throw new Exception("Unhandled response status code default");
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

  }

  /**
   * <p>Creates a payment link.</p>
   * See_Also: HTTP POST `/v1/payment_links`
   */
  void postPaymentLinks(
      PostPaymentLinksBody requestBody,
      PostPaymentLinksResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/payment_links");
    requestor.setHeaderParam("Content-Type", "application/x-www-form-urlencoded");
    Security.apply(requestor);
    requestor.makeRequest(requestBody, responseHandler);
  }

  static class GetPaymentLinksPaymentLinkParams {
    /**
     * Specifies which fields in the response should be expanded.
     */
    string[] expand;

    /**
     */
    string payment_link;

    mixin AddBuilder!(typeof(this));

  }

  static class GetPaymentLinksPaymentLinkResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(PaymentLink response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponsedefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        if (handleResponse200 is null) throw new Exception("Unhandled response status code 200");
        handleResponse200(deserializeJson!(PaymentLink)(res.readJson()));
        return;
      }
      if (handleResponsedefault is null) throw new Exception("Unhandled response status code default");
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

  }

  /**
   * <p>Retrieve a payment link.</p>
   * See_Also: HTTP GET `/v1/payment_links/{payment_link}`
   */
  void getPaymentLinksPaymentLink(
      GetPaymentLinksPaymentLinkParams params,
      GetPaymentLinksPaymentLinkResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.GET,
        Servers.getServerUrl(),
        "/v1/payment_links/{payment_link}");
    if (!params.expand.isNull)
      requestor.setQueryParam!("deepObject")("expand", params.expand);
    if (!params.payment_link.isNull)
      requestor.setPathParam("payment_link", params.payment_link);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class PostPaymentLinksPaymentLinkParams {
    /**
     */
    string payment_link;

    mixin AddBuilder!(typeof(this));

  }

  static class PostPaymentLinksPaymentLinkResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(PaymentLink response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponsedefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        if (handleResponse200 is null) throw new Exception("Unhandled response status code 200");
        handleResponse200(deserializeJson!(PaymentLink)(res.readJson()));
        return;
      }
      if (handleResponsedefault is null) throw new Exception("Unhandled response status code default");
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

  }

  /**
   * <p>Updates a payment link.</p>
   * See_Also: HTTP POST `/v1/payment_links/{payment_link}`
   */
  void postPaymentLinksPaymentLink(
      PostPaymentLinksPaymentLinkParams params,
      PostPaymentLinksPaymentLinkResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/payment_links/{payment_link}");
    if (!params.payment_link.isNull)
      requestor.setPathParam("payment_link", params.payment_link);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class GetPaymentLinksPaymentLinkLineItemsParams {
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
     */
    string payment_link;

    /**
     * A cursor for use in pagination. `starting_after` is an object ID that defines your place in
     * the list. For instance, if you make a list request and receive 100 objects, ending with
     * `obj_foo`, your subsequent call can include `starting_after=obj_foo` in order to fetch the
     * next page of the list.
     */
    string starting_after;

    mixin AddBuilder!(typeof(this));

  }

  static class GetPaymentLinksPaymentLinkLineItemsResponseHandler : ResponseHandler {

    static class PaymentLinksResourceListLineItems {
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

      /**
       * Details about each object.
       */
      @optional
      Item[] data;

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
    void delegate(PaymentLinksResourceListLineItems response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponsedefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        if (handleResponse200 is null) throw new Exception("Unhandled response status code 200");
        handleResponse200(deserializeJson!(PaymentLinksResourceListLineItems)(res.readJson()));
        return;
      }
      if (handleResponsedefault is null) throw new Exception("Unhandled response status code default");
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

  }

  /**
   * <p>When retrieving a payment link, there is an includable <strong>line_items</strong> property
   * containing the first handful of those items. There is also a URL where you can retrieve the
   * full (paginated) list of line items.</p>
   * See_Also: HTTP GET `/v1/payment_links/{payment_link}/line_items`
   */
  void getPaymentLinksPaymentLinkLineItems(
      GetPaymentLinksPaymentLinkLineItemsParams params,
      GetPaymentLinksPaymentLinkLineItemsResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.GET,
        Servers.getServerUrl(),
        "/v1/payment_links/{payment_link}/line_items");
    if (!params.ending_before.isNull)
      requestor.setQueryParam!("deepObject")("ending_before", params.ending_before);
    if (!params.expand.isNull)
      requestor.setQueryParam!("deepObject")("expand", params.expand);
    if (!params.limit.isNull)
      requestor.setQueryParam!("deepObject")("limit", params.limit);
    if (!params.payment_link.isNull)
      requestor.setPathParam("payment_link", params.payment_link);
    if (!params.starting_after.isNull)
      requestor.setQueryParam!("deepObject")("starting_after", params.starting_after);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  mixin AddBuilder!(typeof(this));

}

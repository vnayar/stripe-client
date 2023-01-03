// File automatically generated from OpenAPI spec.
module stripe.service.v1_checkout_sessions_service;

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

public import stripe.model.checkout.session : CheckoutSession;
public import stripe.model.error : Error_;
public import stripe.model.item : Item;

/**
 * Service to make REST API calls to paths beginning with: /v1/checkout/sessions
 */
class V1CheckoutSessionsService {
  static class GetCheckoutSessionsParams {
    /**
     * Only return the Checkout Sessions for the Customer specified.
     */
    Nullable!(Nullable!(string)) customer;

    /**
     * Only return the Checkout Sessions for the Customer details specified.
     */
    static class CustomerDetailsParams {
      @optional
      Nullable!(string) email;

    }

    Nullable!(CustomerDetailsParams) customer_details;

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
     * Only return the Checkout Session for the PaymentIntent specified.
     */
    Nullable!(Nullable!(string)) payment_intent;

    /**
     * A cursor for use in pagination. `starting_after` is an object ID that defines your place in
     * the list. For instance, if you make a list request and receive 100 objects, ending with
     * `obj_foo`, your subsequent call can include `starting_after=obj_foo` in order to fetch the
     * next page of the list.
     */
    Nullable!(Nullable!(string)) starting_after;

    /**
     * Only return the Checkout Session for the subscription specified.
     */
    Nullable!(Nullable!(string)) subscription;

  }

  static class GetCheckoutSessionsResponseHandler : ResponseHandler {

    static class PaymentPagesCheckoutSessionList {
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
      CheckoutSession[] data;

      /**
       * The URL where this list can be accessed.
       */
      @optional
      Nullable!(string) url;

    }

    /**
     * Successful response.
     */
    void delegate(PaymentPagesCheckoutSessionList response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponsedefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        handleResponse200(deserializeJson!(PaymentPagesCheckoutSessionList)(res.readJson()));
        return;
      }
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   * <p>Returns a list of Checkout Sessions.</p>
   * See_Also: HTTP GET `/v1/checkout/sessions`
   */
  void getCheckoutSessions(
      GetCheckoutSessionsParams params,
      GetCheckoutSessionsResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.GET,
        Servers.getServerUrl(),
        "/v1/checkout/sessions");
    if (!params.customer.isNull)
      requestor.setQueryParam("customer", params.customer.get.to!string);
    if (!params.customer_details.isNull)
      requestor.setQueryParam("customer_details", params.customer_details.get.to!string);
    if (!params.ending_before.isNull)
      requestor.setQueryParam("ending_before", params.ending_before.get.to!string);
    if (!params.expand.isNull)
      requestor.setQueryParam("expand", params.expand.get.to!string);
    if (!params.limit.isNull)
      requestor.setQueryParam("limit", params.limit.get.to!string);
    if (!params.payment_intent.isNull)
      requestor.setQueryParam("payment_intent", params.payment_intent.get.to!string);
    if (!params.starting_after.isNull)
      requestor.setQueryParam("starting_after", params.starting_after.get.to!string);
    if (!params.subscription.isNull)
      requestor.setQueryParam("subscription", params.subscription.get.to!string);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class PostCheckoutSessionsBody {
    /**
     * The mode of the Checkout Session. Pass `subscription` if the Checkout Session includes at
     * least one recurring item.
     */
    @optional
    Nullable!(string) mode;

    static class CustomTextParam {
      @optional
      Json shipping_address;

      @optional
      Json submit;

    }

    /**
     * Display additional text for your customers using custom text.
     */
    @optional
    CustomTextParam custom_text;

    static class SetupIntentDataParam {
      @optional
      Nullable!(string) description;

      @optional
      Nullable!(string)[string] metadata;

      @optional
      Nullable!(string) on_behalf_of;

    }

    /**
     * A subset of parameters to be passed to SetupIntent creation for Checkout Sessions in `setup`
     * mode.
     */
    @optional
    SetupIntentDataParam setup_intent_data;

    /**
     * Specify whether Checkout should collect a payment method. When set to `if_required`, Checkout
     * will not collect a payment method when the total due for the session is 0.
     * This may occur if the Checkout Session includes a free trial or a discount.
     * Can only be set in `subscription` mode.
     * If you'd like information on how to collect a payment method outside of Checkout, read the
     * guide on configuring [subscriptions with a free
     * trial](https://stripe.com/docs/payments/checkout/free-trials).
     */
    @optional
    Nullable!(string) payment_method_collection;

    /**
     * ID of an existing Customer, if one exists. In `payment` mode, the customer’s most recent
     * card
     * payment method will be used to prefill the email, name, card details, and billing address
     * on the Checkout page. In `subscription` mode, the customer’s [default payment
     * method](https://stripe.com/docs/api/customers/update#update_customer-invoice_settings-default
     * _payment_method)
     * will be used if it’s a card, and otherwise the most recent card will be used. A valid
     * billing address, billing name and billing email are required on the payment method for
     * Checkout to prefill the customer's card details.
     * If the Customer already has a valid
     * [email](https://stripe.com/docs/api/customers/object#customer_object-email) set, the email
     * will be prefilled and not editable in Checkout.
     * If the Customer does not have a valid `email`, Checkout will set the email entered during the
     * session on the Customer.
     * If blank for Checkout Sessions in `payment` or `subscription` mode, Checkout will create a
     * new Customer object based on information provided during the payment flow.
     * You can set
     * [`payment_intent_data.setup_future_usage`](https://stripe.com/docs/api/checkout/sessions/crea
     * te#create_checkout_session-payment_intent_data-setup_future_usage) to have Checkout
     * automatically attach the payment method to the Customer you pass in for future reuse.
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
     * Enables user redeemable promotion codes.
     */
    @optional
    Nullable!(bool) allow_promotion_codes;

    /**
     * Configure whether a Checkout Session creates a
     * [Customer](https://stripe.com/docs/api/customers) during Session confirmation.
     * When a Customer is not created, you can still retrieve email, address, and other customer
     * data entered in Checkout
     * with
     * [customer_details](https://stripe.com/docs/api/checkout/sessions/object#checkout_session_obje
     * ct-customer_details).
     * Sessions that don't create Customers instead are grouped by [guest
     * customers](https://stripe.com/docs/payments/checkout/guest-customers)
     * in the Dashboard. Promotion codes limited to first time customers will return invalid for
     * these Sessions.
     * Can only be set in `payment` and `setup` mode.
     */
    @optional
    Nullable!(string) customer_creation;

    static class ShippingOptionParams {
      @optional
      Nullable!(string) shipping_rate;

      static class MethodParams {
        static class DeliveryEstimate {
          static class DeliveryEstimateBound {
            @optional
            Nullable!(string) unit;

            @optional
            Nullable!(int) value;

          }

          @optional
          DeliveryEstimateBound minimum;

          @optional
          DeliveryEstimateBound maximum;

        }

        @optional
        DeliveryEstimate delivery_estimate;

        @optional
        Nullable!(string) tax_code;

        static class FixedAmount {
          @optional
          Nullable!(int) amount;

          @optional
          Nullable!(string) currency;

          static class CurrencyOption {
            @optional
            Nullable!(int) amount;

            @optional
            Nullable!(string) tax_behavior;

          }

          @optional
          CurrencyOption[string] currency_options;

        }

        @optional
        FixedAmount fixed_amount;

        @optional
        Nullable!(string)[string] metadata;

        @optional
        Nullable!(string) display_name;

        @optional
        Nullable!(string) tax_behavior;

        @optional
        Nullable!(string) type;

      }

      @optional
      MethodParams shipping_rate_data;

    }

    /**
     * The shipping rate options to apply to this Session.
     */
    @optional
    ShippingOptionParams[] shipping_options;

    static class InvoiceCreationParams {
      @optional
      Nullable!(bool) enabled;

      static class InvoiceDataParams {
        @optional
        Nullable!(string) description;

        @optional
        Nullable!(string)[string] metadata;

        @optional
        Json account_tax_ids;

        @optional
        Json custom_fields;

        @optional
        Nullable!(string) footer;

        @optional
        Json rendering_options;

      }

      @optional
      InvoiceDataParams invoice_data;

    }

    /**
     * Generate a post-purchase Invoice for one-time payments.
     */
    @optional
    InvoiceCreationParams invoice_creation;

    /**
     * Specify whether Checkout should collect the customer's billing address.
     */
    @optional
    Nullable!(string) billing_address_collection;

    static class CustomerUpdateParams {
      @optional
      Nullable!(string) shipping;

      @optional
      Nullable!(string) address;

      @optional
      Nullable!(string) name;

    }

    /**
     * Controls what fields on Customer can be updated by the Checkout Session. Can only be provided
     * when `customer` is provided.
     */
    @optional
    CustomerUpdateParams customer_update;

    static class ConsentCollectionParams {
      @optional
      Nullable!(string) terms_of_service;

      @optional
      Nullable!(string) promotions;

    }

    /**
     * Configure fields for the Checkout Session to gather active consent from customers.
     */
    @optional
    ConsentCollectionParams consent_collection;

    /**
     * The Epoch time in seconds at which the Checkout Session will expire. It can be anywhere from
     * 30 minutes to 24 hours after Checkout Session creation. By default, this value is 24 hours
     * from creation.
     */
    @optional
    Nullable!(long) expires_at;

    /**
     * The IETF language tag of the locale Checkout is displayed in. If blank or `auto`, the
     * browser's locale is used.
     */
    @optional
    Nullable!(string) locale;

    /**
     * A unique string to reference the Checkout Session. This can be a
     * customer ID, a cart ID, or similar, and can be used to reconcile the
     * session with your internal systems.
     */
    @optional
    Nullable!(string) client_reference_id;

    /**
     * Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an
     * object. This can be useful for storing additional information about the object in a
     * structured format. Individual keys can be unset by posting an empty value to them. All keys
     * can be unset by posting an empty value to `metadata`.
     */
    @optional
    Nullable!(string)[string] metadata;

    static class LineItemParams {
      static class PriceDataWithProductData {
        @optional
        Nullable!(int) unit_amount;

        @optional
        Nullable!(string) currency;

        @optional
        Nullable!(string) product;

        @optional
        Nullable!(string) unit_amount_decimal;

        @optional
        Nullable!(string) tax_behavior;

        static class ProductData {
          @optional
          Nullable!(string) description;

          @optional
          Nullable!(string)[string] metadata;

          @optional
          Nullable!(string) tax_code;

          @optional
          Nullable!(string)[] images;

          @optional
          Nullable!(string) name;

        }

        @optional
        ProductData product_data;

        static class RecurringAdhoc {
          @optional
          Nullable!(int) interval_count;

          @optional
          Nullable!(string) interval;

        }

        @optional
        RecurringAdhoc recurring;

      }

      @optional
      PriceDataWithProductData price_data;

      @optional
      Nullable!(string)[] dynamic_tax_rates;

      @optional
      Nullable!(int) quantity;

      @optional
      Nullable!(string)[] tax_rates;

      @optional
      Nullable!(string) price;

      static class AdjustableQuantityParams {
        @optional
        Nullable!(bool) enabled;

        @optional
        Nullable!(int) minimum;

        @optional
        Nullable!(int) maximum;

      }

      @optional
      AdjustableQuantityParams adjustable_quantity;

    }

    /**
     * A list of items the customer is purchasing. Use this parameter to pass one-time or recurring
     * [Prices](https://stripe.com/docs/api/prices).
     * For `payment` mode, there is a maximum of 100 line items, however it is recommended to
     * consolidate line items if there are more than a few dozen.
     * For `subscription` mode, there is a maximum of 20 line items with recurring Prices and 20
     * line items with one-time Prices. Line items with one-time Prices will be on the initial
     * invoice only.
     */
    @optional
    LineItemParams[] line_items;

    static class PaymentIntentDataParams {
      @optional
      Nullable!(string) statement_descriptor;

      @optional
      Nullable!(string) capture_method;

      @optional
      Nullable!(string) transfer_group;

      @optional
      Nullable!(string)[string] metadata;

      @optional
      Nullable!(string) receipt_email;

      @optional
      Nullable!(string) statement_descriptor_suffix;

      @optional
      Nullable!(string) setup_future_usage;

      @optional
      Nullable!(string) description;

      static class Shipping {
        @optional
        Nullable!(string) phone;

        @optional
        Nullable!(string) carrier;

        static class Address {
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
        Address address;

        @optional
        Nullable!(string) tracking_number;

        @optional
        Nullable!(string) name;

      }

      @optional
      Shipping shipping;

      @optional
      Nullable!(int) application_fee_amount;

      @optional
      Nullable!(string) on_behalf_of;

      static class TransferDataParams {
        @optional
        Nullable!(int) amount;

        @optional
        Nullable!(string) destination;

      }

      @optional
      TransferDataParams transfer_data;

    }

    /**
     * A subset of parameters to be passed to PaymentIntent creation for Checkout Sessions in
     * `payment` mode.
     */
    @optional
    PaymentIntentDataParams payment_intent_data;

    static class AfterExpirationParams {
      static class RecoveryParams {
        @optional
        Nullable!(bool) enabled;

        @optional
        Nullable!(bool) allow_promotion_codes;

      }

      @optional
      RecoveryParams recovery;

    }

    /**
     * Configure actions after a Checkout Session has expired.
     */
    @optional
    AfterExpirationParams after_expiration;

    /**
     * The URL to which Stripe should send customers when payment or setup
     * is complete.
     * If you’d like to use information from the successful Checkout Session on your page,
     * read the guide on [customizing your success
     * page](https://stripe.com/docs/payments/checkout/custom-success-page).
     */
    @optional
    Nullable!(string) success_url;

    /**
     * Specifies which fields in the response should be expanded.
     */
    @optional
    Nullable!(string)[] expand;

    static class SubscriptionDataParams {
      @optional
      Nullable!(int) trial_period_days;

      @optional
      Nullable!(string)[string] metadata;

      @optional
      Nullable!(string)[] default_tax_rates;

      @optional
      Nullable!(float) application_fee_percent;

      @optional
      Nullable!(long) trial_end;

      @optional
      Nullable!(string) description;

      static class TransferDataSpecs {
        @optional
        Nullable!(float) amount_percent;

        @optional
        Nullable!(string) destination;

      }

      @optional
      TransferDataSpecs transfer_data;

      @optional
      Nullable!(string) on_behalf_of;

    }

    /**
     * A subset of parameters to be passed to subscription creation for Checkout Sessions in
     * `subscription` mode.
     */
    @optional
    SubscriptionDataParams subscription_data;

    static class ShippingAddressCollectionParams {
      @optional
      Nullable!(string)[] allowed_countries;

    }

    /**
     * When set, provides configuration for Checkout to collect a shipping address from a customer.
     */
    @optional
    ShippingAddressCollectionParams shipping_address_collection;

    /**
     * The URL the customer will be directed to if they decide to cancel payment and return to your
     * website.
     */
    @optional
    Nullable!(string) cancel_url;

    static class TaxIdCollectionParams {
      @optional
      Nullable!(bool) enabled;

    }

    /**
     * Controls tax ID collection settings for the session.
     */
    @optional
    TaxIdCollectionParams tax_id_collection;

    static class PaymentMethodOptionsParam {
      static class PaymentMethodOptionsParam {
        @optional
        Nullable!(string) setup_future_usage;

      }

      @optional
      PaymentMethodOptionsParam bancontact;

      @optional
      PaymentMethodOptionsParam au_becs_debit;

      @optional
      PaymentMethodOptionsParam customer_balance;

      @optional
      PaymentMethodOptionsParam klarna;

      @optional
      PaymentMethodOptionsParam alipay;

      @optional
      PaymentMethodOptionsParam eps;

      @optional
      PaymentMethodOptionsParam wechat_pay;

      @optional
      PaymentMethodOptionsParam giropay;

      @optional
      PaymentMethodOptionsParam ideal;

      @optional
      PaymentMethodOptionsParam us_bank_account;

      @optional
      PaymentMethodOptionsParam bacs_debit;

      @optional
      PaymentMethodOptionsParam boleto;

      @optional
      PaymentMethodOptionsParam afterpay_clearpay;

      @optional
      PaymentMethodOptionsParam card;

      @optional
      PaymentMethodOptionsParam affirm;

      @optional
      PaymentMethodOptionsParam fpx;

      @optional
      PaymentMethodOptionsParam konbini;

      @optional
      PaymentMethodOptionsParam sofort;

      @optional
      PaymentMethodOptionsParam oxxo;

      @optional
      PaymentMethodOptionsParam paynow;

      @optional
      PaymentMethodOptionsParam grabpay;

      @optional
      PaymentMethodOptionsParam acss_debit;

      @optional
      PaymentMethodOptionsParam sepa_debit;

      @optional
      PaymentMethodOptionsParam p24;

      @optional
      PaymentMethodOptionsParam pix;

    }

    /**
     * Payment-method-specific configuration.
     */
    @optional
    PaymentMethodOptionsParam payment_method_options;

    /**
     * If provided, this value will be used when the Customer object is created.
     * If not provided, customers will be asked to enter their email address.
     * Use this parameter to prefill customer data if you already have an email
     * on file. To access information about the customer once a session is
     * complete, use the `customer` field.
     */
    @optional
    Nullable!(string) customer_email;

    static class DiscountParams {
      @optional
      Nullable!(string) coupon;

      @optional
      Nullable!(string) promotion_code;

    }

    /**
     * The coupon or promotion code to apply to this Session. Currently, only up to one may be
     * specified.
     */
    @optional
    DiscountParams[] discounts;

    /**
     * A list of the types of payment methods (e.g., `card`) this Checkout Session can accept.
     * In `payment` and `subscription` mode, you can omit this attribute to manage your payment
     * methods from the [Stripe Dashboard](https://dashboard.stripe.com/settings/payment_methods).
     * It is required in `setup` mode.
     * Read more about the supported payment methods and their requirements in our [payment
     * method details guide](/docs/payments/checkout/payment-methods).
     * If multiple payment methods are passed, Checkout will dynamically reorder them to
     * prioritize the most relevant payment methods based on the customer's location and
     * other characteristics.
     */
    @optional
    Nullable!(string)[] payment_method_types;

    static class PhoneNumberCollectionParams {
      @optional
      Nullable!(bool) enabled;

    }

    /**
     * Controls phone number collection settings for the session.
     * We recommend that you review your privacy policy and check with your legal contacts
     * before using this feature. Learn more about [collecting phone numbers with
     * Checkout](https://stripe.com/docs/payments/checkout/phone-numbers).
     */
    @optional
    PhoneNumberCollectionParams phone_number_collection;

    /**
     * Describes the type of transaction being performed by Checkout in order to customize
     * relevant text on the page, such as the submit button. `submit_type` can only be
     * specified on Checkout Sessions in `payment` mode, but not Checkout Sessions
     * in `subscription` or `setup` mode.
     */
    @optional
    Nullable!(string) submit_type;

    static class AutomaticTaxParams {
      @optional
      Nullable!(bool) enabled;

    }

    /**
     * Settings for automatic tax lookup for this session and resulting payments, invoices, and
     * subscriptions.
     */
    @optional
    AutomaticTaxParams automatic_tax;

  }

  static class PostCheckoutSessionsResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(CheckoutSession response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponsedefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        handleResponse200(deserializeJson!(CheckoutSession)(res.readJson()));
        return;
      }
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   * <p>Creates a Session object.</p>
   * See_Also: HTTP POST `/v1/checkout/sessions`
   */
  void postCheckoutSessions(
      PostCheckoutSessionsBody requestBody,
      PostCheckoutSessionsResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/checkout/sessions");
    requestor.setHeaderParam("Content-Type", "application/x-www-form-urlencoded");
    Security.apply(requestor);
    requestor.makeRequest(requestBody, responseHandler);
  }

  static class PostCheckoutSessionsSessionExpireParams {
    /**
     */
    Nullable!(Nullable!(string)) session;

  }

  static class PostCheckoutSessionsSessionExpireResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(CheckoutSession response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponsedefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        handleResponse200(deserializeJson!(CheckoutSession)(res.readJson()));
        return;
      }
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   * <p>A Session can be expired when it is in one of these statuses: <code>open</code> </p>
   * <p>After it expires, a customer can’t complete a Session and customers loading the Session
   * see a message saying the Session is expired.</p>
   * See_Also: HTTP POST `/v1/checkout/sessions/{session}/expire`
   */
  void postCheckoutSessionsSessionExpire(
      PostCheckoutSessionsSessionExpireParams params,
      PostCheckoutSessionsSessionExpireResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/checkout/sessions/{session}/expire");
    if (!params.session.isNull)
      requestor.setPathParam("session", params.session.get.to!string);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class GetCheckoutSessionsSessionLineItemsParams {
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
     */
    Nullable!(Nullable!(string)) session;

    /**
     * A cursor for use in pagination. `starting_after` is an object ID that defines your place in
     * the list. For instance, if you make a list request and receive 100 objects, ending with
     * `obj_foo`, your subsequent call can include `starting_after=obj_foo` in order to fetch the
     * next page of the list.
     */
    Nullable!(Nullable!(string)) starting_after;

  }

  static class GetCheckoutSessionsSessionLineItemsResponseHandler : ResponseHandler {

    static class PaymentPagesCheckoutSessionListLineItems {
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
      Item[] data;

      /**
       * The URL where this list can be accessed.
       */
      @optional
      Nullable!(string) url;

    }

    /**
     * Successful response.
     */
    void delegate(PaymentPagesCheckoutSessionListLineItems response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponsedefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        handleResponse200(deserializeJson!(PaymentPagesCheckoutSessionListLineItems)(res.readJson()));
        return;
      }
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   * <p>When retrieving a Checkout Session, there is an includable <strong>line_items</strong>
   * property containing the first handful of those items. There is also a URL where you can
   * retrieve the full (paginated) list of line items.</p>
   * See_Also: HTTP GET `/v1/checkout/sessions/{session}/line_items`
   */
  void getCheckoutSessionsSessionLineItems(
      GetCheckoutSessionsSessionLineItemsParams params,
      GetCheckoutSessionsSessionLineItemsResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.GET,
        Servers.getServerUrl(),
        "/v1/checkout/sessions/{session}/line_items");
    if (!params.ending_before.isNull)
      requestor.setQueryParam("ending_before", params.ending_before.get.to!string);
    if (!params.expand.isNull)
      requestor.setQueryParam("expand", params.expand.get.to!string);
    if (!params.limit.isNull)
      requestor.setQueryParam("limit", params.limit.get.to!string);
    if (!params.session.isNull)
      requestor.setPathParam("session", params.session.get.to!string);
    if (!params.starting_after.isNull)
      requestor.setQueryParam("starting_after", params.starting_after.get.to!string);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class GetCheckoutSessionsSessionParams {
    /**
     * Specifies which fields in the response should be expanded.
     */
    Nullable!(Nullable!(string)[]) expand;

    /**
     */
    Nullable!(Nullable!(string)) session;

  }

  static class GetCheckoutSessionsSessionResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(CheckoutSession response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponsedefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        handleResponse200(deserializeJson!(CheckoutSession)(res.readJson()));
        return;
      }
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   * <p>Retrieves a Session object.</p>
   * See_Also: HTTP GET `/v1/checkout/sessions/{session}`
   */
  void getCheckoutSessionsSession(
      GetCheckoutSessionsSessionParams params,
      GetCheckoutSessionsSessionResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.GET,
        Servers.getServerUrl(),
        "/v1/checkout/sessions/{session}");
    if (!params.expand.isNull)
      requestor.setQueryParam("expand", params.expand.get.to!string);
    if (!params.session.isNull)
      requestor.setPathParam("session", params.session.get.to!string);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

}

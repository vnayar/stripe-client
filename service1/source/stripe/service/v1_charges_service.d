// File automatically generated from OpenAPI spec.
module stripe.service.v1_charges_service;

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

public import stripe.model.charge : Charge;
public import stripe.model.dispute : Dispute;
public import stripe.model.error : Error_;
public import stripe.model.refund : Refund;

/**
 * Service to make REST API calls to paths beginning with: /v1/charges
 */
class V1ChargesService {
  static class GetChargesChargeRefundsParams {
    /**
     */
    string charge;

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

  static class GetChargesChargeRefundsResponseHandler : ResponseHandler {

    static class RefundList {
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
      Refund[] data;

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
    void delegate(RefundList response) handleResponse200;

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
        handleResponse200(deserializeJson!(RefundList)(res.readJson()));
        return;
      }
      if (handleResponseDefault is null) throw new Exception("Unhandled response status code default");
      handleResponseDefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

  }

  /**
   * <p>You can see a list of the refunds belonging to a specific charge. Note that the 10 most
   * recent refunds are always available by default on the charge object. If you need more than
   * those 10, you can use this API method and the <code>limit</code> and
   * <code>starting_after</code> parameters to page through additional refunds.</p>
   * See_Also: HTTP GET `/v1/charges/{charge}/refunds`
   */
  void getChargesChargeRefunds(
      GetChargesChargeRefundsParams params,
      GetChargesChargeRefundsResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.GET,
        Servers.getServerUrl(),
        "/v1/charges/{charge}/refunds");
    if (!params.charge.isNull)
      requestor.setPathParam("charge", params.charge);
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

  static class PostChargesChargeRefundsParams {
    /**
     */
    string charge;

    mixin AddBuilder!(typeof(this));

  }

  static class PostChargesChargeRefundsBody {
    /**
     * Origin of the refund
     */
    @optional
    string origin;

    /**
     * A positive integer representing how much to refund.
     */
    @optional
    Nullable!(int) amount;

    @optional
    string payment_intent;

    /**
     * Address to send refund email, use customer email if not specified
     */
    @optional
    string instructions_email;

    /**
     * Customer whose customer balance to refund from.
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

    @optional
    string reason;

    /**
     * Specifies which fields in the response should be expanded.
     */
    @optional
    string[] expand;

    @optional
    Nullable!(bool) refund_application_fee;

    @optional
    Nullable!(bool) reverse_transfer;

    mixin AddBuilder!(typeof(this));

  }

  static class PostChargesChargeRefundsResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(Refund response) handleResponse200;

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
        handleResponse200(deserializeJson!(Refund)(res.readJson()));
        return;
      }
      if (handleResponseDefault is null) throw new Exception("Unhandled response status code default");
      handleResponseDefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

  }

  /**
   * <p>Create a refund.</p>
   * See_Also: HTTP POST `/v1/charges/{charge}/refunds`
   */
  void postChargesChargeRefunds(
      PostChargesChargeRefundsParams params,
      PostChargesChargeRefundsBody requestBody,
      PostChargesChargeRefundsResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/charges/{charge}/refunds");
    if (!params.charge.isNull)
      requestor.setPathParam("charge", params.charge);
    requestor.setHeaderParam("Content-Type", "application/x-www-form-urlencoded");
    Security.apply(requestor);
    requestor.makeRequest(requestBody, responseHandler);
  }

  static class PostChargesChargeCaptureParams {
    /**
     */
    string charge;

    mixin AddBuilder!(typeof(this));

  }

  static class PostChargesChargeCaptureBody {
    /**
     * The amount to capture, which must be less than or equal to the original amount. Any
     * additional amount will be automatically refunded.
     */
    @optional
    Nullable!(int) amount;

    /**
     * For card charges, use `statement_descriptor_suffix` instead. Otherwise, you can use this
     * value as the complete description of a charge on your customers’ statements. Must contain
     * at least one letter, maximum 22 characters.
     */
    @optional
    string statement_descriptor;

    /**
     * A string that identifies this transaction as part of a group. `transfer_group` may only be
     * provided if it has not been set. See the [Connect
     * documentation](https://stripe.com/docs/connect/charges-transfers#transfer-options) for
     * details.
     */
    @optional
    string transfer_group;

    /**
     * The email address to send this charge's receipt to. This will override the
     * previously-specified email address for this charge, if one was set. Receipts will not be sent
     * in test mode.
     */
    @optional
    string receipt_email;

    /**
     * Provides information about the charge that customers see on their statements. Concatenated
     * with the prefix (shortened descriptor) or statement descriptor that’s set on the account to
     * form the complete statement descriptor. Maximum 22 characters for the concatenated
     * descriptor.
     */
    @optional
    string statement_descriptor_suffix;

    /**
     * Specifies which fields in the response should be expanded.
     */
    @optional
    string[] expand;

    static class TransferDataSpecs {
      @optional
      Nullable!(int) amount;

      mixin AddBuilder!(typeof(this));

    }

    /**
     * An optional dictionary including the account to automatically transfer to as part of a
     * destination charge. [See the Connect
     * documentation](https://stripe.com/docs/connect/destination-charges) for details.
     */
    @optional
    TransferDataSpecs transfer_data;

    /**
     * An application fee amount to add on to this charge, which must be less than or equal to the
     * original amount.
     */
    @optional
    Nullable!(int) application_fee_amount;

    /**
     * An application fee to add on to this charge.
     */
    @optional
    Nullable!(int) application_fee;

    mixin AddBuilder!(typeof(this));

  }

  static class PostChargesChargeCaptureResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(Charge response) handleResponse200;

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
        handleResponse200(deserializeJson!(Charge)(res.readJson()));
        return;
      }
      if (handleResponseDefault is null) throw new Exception("Unhandled response status code default");
      handleResponseDefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

  }

  /**
   * <p>Capture the payment of an existing, uncaptured, charge. This is the second half of the
   * two-step payment flow, where first you <a href="#create_charge">created a charge</a> with the
   * capture option set to false.</p>
   * <p>Uncaptured payments expire a set number of days after they are created (<a
   * href="/docs/charges/placing-a-hold">7 by default</a>). If they are not captured by that point
   * in time, they will be marked as refunded and will no longer be capturable.</p>
   * See_Also: HTTP POST `/v1/charges/{charge}/capture`
   */
  void postChargesChargeCapture(
      PostChargesChargeCaptureParams params,
      PostChargesChargeCaptureBody requestBody,
      PostChargesChargeCaptureResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/charges/{charge}/capture");
    if (!params.charge.isNull)
      requestor.setPathParam("charge", params.charge);
    requestor.setHeaderParam("Content-Type", "application/x-www-form-urlencoded");
    Security.apply(requestor);
    requestor.makeRequest(requestBody, responseHandler);
  }

  static class GetChargesParams {
    /**
     */
    Json created;

    /**
     * Only return charges for the customer specified by this customer ID.
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
     * Only return charges that were created by the PaymentIntent specified by this PaymentIntent
     * ID.
     */
    string payment_intent;

    /**
     * A cursor for use in pagination. `starting_after` is an object ID that defines your place in
     * the list. For instance, if you make a list request and receive 100 objects, ending with
     * `obj_foo`, your subsequent call can include `starting_after=obj_foo` in order to fetch the
     * next page of the list.
     */
    string starting_after;

    /**
     * Only return charges for this transfer group.
     */
    string transfer_group;

    mixin AddBuilder!(typeof(this));

  }

  static class GetChargesResponseHandler : ResponseHandler {

    static class ChargeList {
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
      Charge[] data;

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
    void delegate(ChargeList response) handleResponse200;

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
        handleResponse200(deserializeJson!(ChargeList)(res.readJson()));
        return;
      }
      if (handleResponseDefault is null) throw new Exception("Unhandled response status code default");
      handleResponseDefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

  }

  /**
   * <p>Returns a list of charges you’ve previously created. The charges are returned in sorted
   * order, with the most recent charges appearing first.</p>
   * See_Also: HTTP GET `/v1/charges`
   */
  void getCharges(
      GetChargesParams params,
      GetChargesResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.GET,
        Servers.getServerUrl(),
        "/v1/charges");
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
    if (!params.payment_intent.isNull)
      requestor.setQueryParam!("deepObject")("payment_intent", params.payment_intent);
    if (!params.starting_after.isNull)
      requestor.setQueryParam!("deepObject")("starting_after", params.starting_after);
    if (!params.transfer_group.isNull)
      requestor.setQueryParam!("deepObject")("transfer_group", params.transfer_group);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class PostChargesBody {
    /**
     * Amount intended to be collected by this payment. A positive integer representing how much to
     * charge in the [smallest currency unit](https://stripe.com/docs/currencies#zero-decimal)
     * (e.g., 100 cents to charge $1.00 or 100 to charge ¥100, a zero-decimal currency). The
     * minimum amount is $0.50 US or [equivalent in charge
     * currency](https://stripe.com/docs/currencies#minimum-and-maximum-charge-amounts). The amount
     * value supports up to eight digits (e.g., a value of 99999999 for a USD charge of
     * $999,999.99).
     */
    @optional
    Nullable!(int) amount;

    /**
     * For card charges, use `statement_descriptor_suffix` instead. Otherwise, you can use this
     * value as the complete description of a charge on your customers’ statements. Must contain
     * at least one letter, maximum 22 characters.
     */
    @optional
    string statement_descriptor;

    /**
     * A string that identifies this transaction as part of a group. For details, see [Grouping
     * transactions](https://stripe.com/docs/connect/charges-transfers#transfer-options).
     */
    @optional
    string transfer_group;

    @optional
    Json destination;

    /**
     * The ID of an existing customer that will be charged in this request.
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

    /**
     * Whether to immediately capture the charge. Defaults to `true`. When `false`, the charge
     * issues an authorization (or pre-authorization), and will need to be
     * [captured](https://stripe.com/docs/api#capture_charge) later. Uncaptured charges expire after
     * a set number of days (7 by default). For more information, see the [authorizing charges and
     * settling later](https://stripe.com/docs/charges/placing-a-hold) documentation.
     */
    @optional
    Nullable!(bool) capture;

    /**
     * The email address to which this charge's
     * [receipt](https://stripe.com/docs/dashboard/receipts) will be sent. The receipt will not be
     * sent until the charge is paid, and no receipts will be sent for test mode charges. If this
     * charge is for a [Customer](https://stripe.com/docs/api/customers/object), the email address
     * specified here will override the customer's email address. If `receipt_email` is specified
     * for a charge in live mode, a receipt will be sent regardless of your [email
     * settings](https://dashboard.stripe.com/account/emails).
     */
    @optional
    string receipt_email;

    /**
     * A payment source to be charged. This can be the ID of a
     * [card](https://stripe.com/docs/api#cards) (i.e., credit or debit card), a [bank
     * account](https://stripe.com/docs/api#bank_accounts), a
     * [source](https://stripe.com/docs/api#sources), a [token](https://stripe.com/docs/api#tokens),
     * or a [connected
     * account](https://stripe.com/docs/connect/account-debits#charging-a-connected-account). For
     * certain sources---namely, [cards](https://stripe.com/docs/api#cards), [bank
     * accounts](https://stripe.com/docs/api#bank_accounts), and attached
     * [sources](https://stripe.com/docs/api#sources)---you must also pass the ID of the associated
     * customer.
     */
    @optional
    string source;

    /**
     * A token, like the ones returned by [Stripe.js](https://stripe.com/docs/js).
     */
    @optional
    Json card;

    /**
     * Specifies which fields in the response should be expanded.
     */
    @optional
    string[] expand;

    /**
     * Provides information about the charge that customers see on their statements. Concatenated
     * with the prefix (shortened descriptor) or statement descriptor that’s set on the account to
     * form the complete statement descriptor. Maximum 22 characters for the concatenated
     * descriptor.
     */
    @optional
    string statement_descriptor_suffix;

    /**
     * An arbitrary string which you can attach to a `Charge` object. It is displayed when in the
     * web interface alongside the charge. Note that if you use Stripe to send automatic email
     * receipts to your customers, your receipt emails will include the `description` of the
     * charge(s) that they are describing.
     */
    @optional
    string description;

    static class TransferDataSpecs {
      @optional
      Nullable!(int) amount;

      @optional
      string destination;

      mixin AddBuilder!(typeof(this));

    }

    /**
     * An optional dictionary including the account to automatically transfer to as part of a
     * destination charge. [See the Connect
     * documentation](https://stripe.com/docs/connect/destination-charges) for details.
     */
    @optional
    TransferDataSpecs transfer_data;

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
     * A fee in cents (or local equivalent) that will be applied to the charge and transferred to
     * the application owner's Stripe account. The request must be made with an OAuth key or the
     * `Stripe-Account` header in order to take an application fee. For more information, see the
     * application fees
     * [documentation](https://stripe.com/docs/connect/direct-charges#collecting-fees).
     */
    @optional
    Nullable!(int) application_fee_amount;

    /**
     * The Stripe account ID for which these funds are intended. Automatically set if you use the
     * `destination` parameter. For details, see [Creating Separate Charges and
     * Transfers](https://stripe.com/docs/connect/charges-transfers#on-behalf-of).
     */
    @optional
    string on_behalf_of;

    @optional
    Nullable!(int) application_fee;

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
     * Shipping information for the charge. Helps prevent fraud on charges for physical goods.
     */
    @optional
    OptionalFieldsShipping shipping;

    mixin AddBuilder!(typeof(this));

  }

  static class PostChargesResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(Charge response) handleResponse200;

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
        handleResponse200(deserializeJson!(Charge)(res.readJson()));
        return;
      }
      if (handleResponseDefault is null) throw new Exception("Unhandled response status code default");
      handleResponseDefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

  }

  /**
   * <p>To charge a credit card or other payment source, you create a <code>Charge</code> object. If
   * your API key is in test mode, the supplied payment source (e.g., card) won’t actually be
   * charged, although everything else will occur as if in live mode. (Stripe assumes that the
   * charge would have completed successfully).</p>
   * See_Also: HTTP POST `/v1/charges`
   */
  void postCharges(
      PostChargesBody requestBody,
      PostChargesResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/charges");
    requestor.setHeaderParam("Content-Type", "application/x-www-form-urlencoded");
    Security.apply(requestor);
    requestor.makeRequest(requestBody, responseHandler);
  }

  static class GetChargesChargeDisputeParams {
    /**
     */
    string charge;

    /**
     * Specifies which fields in the response should be expanded.
     */
    string[] expand;

    mixin AddBuilder!(typeof(this));

  }

  static class GetChargesChargeDisputeResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(Dispute response) handleResponse200;

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
        handleResponse200(deserializeJson!(Dispute)(res.readJson()));
        return;
      }
      if (handleResponseDefault is null) throw new Exception("Unhandled response status code default");
      handleResponseDefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

  }

  /**
   * <p>Retrieve a dispute for a specified charge.</p>
   * See_Also: HTTP GET `/v1/charges/{charge}/dispute`
   */
  void getChargesChargeDispute(
      GetChargesChargeDisputeParams params,
      GetChargesChargeDisputeResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.GET,
        Servers.getServerUrl(),
        "/v1/charges/{charge}/dispute");
    if (!params.charge.isNull)
      requestor.setPathParam("charge", params.charge);
    if (!params.expand.isNull)
      requestor.setQueryParam!("deepObject")("expand", params.expand);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class PostChargesChargeDisputeParams {
    /**
     */
    string charge;

    mixin AddBuilder!(typeof(this));

  }

  static class PostChargesChargeDisputeBody {
    static class DisputeEvidenceParams {
      @optional
      string customer_purchase_ip;

      @optional
      string customer_communication;

      @optional
      string shipping_date;

      @optional
      string shipping_tracking_number;

      @optional
      string shipping_carrier;

      @optional
      string refund_policy;

      @optional
      string shipping_address;

      @optional
      string service_documentation;

      @optional
      string refund_refusal_explanation;

      @optional
      string receipt;

      @optional
      string customer_email_address;

      @optional
      string cancellation_policy;

      @optional
      string product_description;

      @optional
      string duplicate_charge_documentation;

      @optional
      string uncategorized_file;

      @optional
      string shipping_documentation;

      @optional
      string service_date;

      @optional
      string billing_address;

      @optional
      string duplicate_charge_id;

      @optional
      string refund_policy_disclosure;

      @optional
      string customer_name;

      @optional
      string cancellation_policy_disclosure;

      @optional
      string uncategorized_text;

      @optional
      string cancellation_rebuttal;

      @optional
      string access_activity_log;

      @optional
      string duplicate_charge_explanation;

      @optional
      string customer_signature;

      mixin AddBuilder!(typeof(this));

    }

    /**
     * Evidence to upload, to respond to a dispute. Updating any field in the hash will submit all
     * fields in the hash for review. The combined character count of all fields is limited to
     * 150,000.
     */
    @optional
    DisputeEvidenceParams evidence;

    /**
     * Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an
     * object. This can be useful for storing additional information about the object in a
     * structured format. Individual keys can be unset by posting an empty value to them. All keys
     * can be unset by posting an empty value to `metadata`.
     */
    @optional
    Json metadata;

    /**
     * Whether to immediately submit evidence to the bank. If `false`, evidence is staged on the
     * dispute. Staged evidence is visible in the API and Dashboard, and can be submitted to the
     * bank by making another request with this attribute set to `true` (the default).
     */
    @optional
    Nullable!(bool) submit;

    /**
     * Specifies which fields in the response should be expanded.
     */
    @optional
    string[] expand;

    mixin AddBuilder!(typeof(this));

  }

  static class PostChargesChargeDisputeResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(Dispute response) handleResponse200;

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
        handleResponse200(deserializeJson!(Dispute)(res.readJson()));
        return;
      }
      if (handleResponseDefault is null) throw new Exception("Unhandled response status code default");
      handleResponseDefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

  }

  /**
   * See_Also: HTTP POST `/v1/charges/{charge}/dispute`
   */
  void postChargesChargeDispute(
      PostChargesChargeDisputeParams params,
      PostChargesChargeDisputeBody requestBody,
      PostChargesChargeDisputeResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/charges/{charge}/dispute");
    if (!params.charge.isNull)
      requestor.setPathParam("charge", params.charge);
    requestor.setHeaderParam("Content-Type", "application/x-www-form-urlencoded");
    Security.apply(requestor);
    requestor.makeRequest(requestBody, responseHandler);
  }

  static class GetChargesChargeParams {
    /**
     */
    string charge;

    /**
     * Specifies which fields in the response should be expanded.
     */
    string[] expand;

    mixin AddBuilder!(typeof(this));

  }

  static class GetChargesChargeResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(Charge response) handleResponse200;

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
        handleResponse200(deserializeJson!(Charge)(res.readJson()));
        return;
      }
      if (handleResponseDefault is null) throw new Exception("Unhandled response status code default");
      handleResponseDefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

  }

  /**
   * <p>Retrieves the details of a charge that has previously been created. Supply the unique charge
   * ID that was returned from your previous request, and Stripe will return the corresponding
   * charge information. The same information is returned when creating or refunding the charge.</p>
   * See_Also: HTTP GET `/v1/charges/{charge}`
   */
  void getChargesCharge(
      GetChargesChargeParams params,
      GetChargesChargeResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.GET,
        Servers.getServerUrl(),
        "/v1/charges/{charge}");
    if (!params.charge.isNull)
      requestor.setPathParam("charge", params.charge);
    if (!params.expand.isNull)
      requestor.setQueryParam!("deepObject")("expand", params.expand);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class PostChargesChargeParams {
    /**
     */
    string charge;

    mixin AddBuilder!(typeof(this));

  }

  static class PostChargesChargeBody {
    /**
     * A string that identifies this transaction as part of a group. `transfer_group` may only be
     * provided if it has not been set. See the [Connect
     * documentation](https://stripe.com/docs/connect/charges-transfers#transfer-options) for
     * details.
     */
    @optional
    string transfer_group;

    /**
     * The ID of an existing customer that will be associated with this request. This field may only
     * be updated if there is no existing associated customer with this charge.
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
     * This is the email address that the receipt for this charge will be sent to. If this field is
     * updated, then a new email receipt will be sent to the updated address.
     */
    @optional
    string receipt_email;

    static class FraudDetails {
      @optional
      string user_report;

      mixin AddBuilder!(typeof(this));

    }

    /**
     * A set of key-value pairs you can attach to a charge giving information about its riskiness.
     * If you believe a charge is fraudulent, include a `user_report` key with a value of
     * `fraudulent`. If you believe a charge is safe, include a `user_report` key with a value of
     * `safe`. Stripe will use the information you send to improve our fraud detection algorithms.
     */
    @optional
    FraudDetails fraud_details;

    /**
     * Specifies which fields in the response should be expanded.
     */
    @optional
    string[] expand;

    /**
     * An arbitrary string which you can attach to a charge object. It is displayed when in the web
     * interface alongside the charge. Note that if you use Stripe to send automatic email receipts
     * to your customers, your receipt emails will include the `description` of the charge(s) that
     * they are describing.
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
     * Shipping information for the charge. Helps prevent fraud on charges for physical goods.
     */
    @optional
    OptionalFieldsShipping shipping;

    mixin AddBuilder!(typeof(this));

  }

  static class PostChargesChargeResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(Charge response) handleResponse200;

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
        handleResponse200(deserializeJson!(Charge)(res.readJson()));
        return;
      }
      if (handleResponseDefault is null) throw new Exception("Unhandled response status code default");
      handleResponseDefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

  }

  /**
   * <p>Updates the specified charge by setting the values of the parameters passed. Any parameters
   * not provided will be left unchanged.</p>
   * See_Also: HTTP POST `/v1/charges/{charge}`
   */
  void postChargesCharge(
      PostChargesChargeParams params,
      PostChargesChargeBody requestBody,
      PostChargesChargeResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/charges/{charge}");
    if (!params.charge.isNull)
      requestor.setPathParam("charge", params.charge);
    requestor.setHeaderParam("Content-Type", "application/x-www-form-urlencoded");
    Security.apply(requestor);
    requestor.makeRequest(requestBody, responseHandler);
  }

  static class PostChargesChargeRefundParams {
    /**
     */
    string charge;

    mixin AddBuilder!(typeof(this));

  }

  static class PostChargesChargeRefundBody {
    @optional
    Nullable!(int) amount;

    @optional
    string payment_intent;

    @optional
    string instructions_email;

    @optional
    string reason;

    /**
     * Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an
     * object. This can be useful for storing additional information about the object in a
     * structured format. Individual keys can be unset by posting an empty value to them. All keys
     * can be unset by posting an empty value to `metadata`.
     */
    @optional
    Json metadata;

    /**
     * Specifies which fields in the response should be expanded.
     */
    @optional
    string[] expand;

    @optional
    Nullable!(bool) refund_application_fee;

    @optional
    Nullable!(bool) reverse_transfer;

    mixin AddBuilder!(typeof(this));

  }

  static class PostChargesChargeRefundResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(Charge response) handleResponse200;

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
        handleResponse200(deserializeJson!(Charge)(res.readJson()));
        return;
      }
      if (handleResponseDefault is null) throw new Exception("Unhandled response status code default");
      handleResponseDefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

  }

  /**
   * <p>When you create a new refund, you must specify a Charge or a PaymentIntent object on which
   * to create it.</p>
   * <p>Creating a new refund will refund a charge that has previously been created but not yet
   * refunded.
   * Funds will be refunded to the credit or debit card that was originally charged.</p>
   * <p>You can optionally refund only part of a charge.
   * You can do so multiple times, until the entire charge has been refunded.</p>
   * <p>Once entirely refunded, a charge can’t be refunded again.
   * This method will raise an error when called on an already-refunded charge,
   * or when trying to refund more money than is left on a charge.</p>
   * See_Also: HTTP POST `/v1/charges/{charge}/refund`
   */
  void postChargesChargeRefund(
      PostChargesChargeRefundParams params,
      PostChargesChargeRefundBody requestBody,
      PostChargesChargeRefundResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/charges/{charge}/refund");
    if (!params.charge.isNull)
      requestor.setPathParam("charge", params.charge);
    requestor.setHeaderParam("Content-Type", "application/x-www-form-urlencoded");
    Security.apply(requestor);
    requestor.makeRequest(requestBody, responseHandler);
  }

  static class PostChargesChargeDisputeCloseParams {
    /**
     */
    string charge;

    mixin AddBuilder!(typeof(this));

  }

  static class PostChargesChargeDisputeCloseBody {
    /**
     * Specifies which fields in the response should be expanded.
     */
    @optional
    string[] expand;

    mixin AddBuilder!(typeof(this));

  }

  static class PostChargesChargeDisputeCloseResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(Dispute response) handleResponse200;

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
        handleResponse200(deserializeJson!(Dispute)(res.readJson()));
        return;
      }
      if (handleResponseDefault is null) throw new Exception("Unhandled response status code default");
      handleResponseDefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

  }

  /**
   * See_Also: HTTP POST `/v1/charges/{charge}/dispute/close`
   */
  void postChargesChargeDisputeClose(
      PostChargesChargeDisputeCloseParams params,
      PostChargesChargeDisputeCloseBody requestBody,
      PostChargesChargeDisputeCloseResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/charges/{charge}/dispute/close");
    if (!params.charge.isNull)
      requestor.setPathParam("charge", params.charge);
    requestor.setHeaderParam("Content-Type", "application/x-www-form-urlencoded");
    Security.apply(requestor);
    requestor.makeRequest(requestBody, responseHandler);
  }

  static class GetChargesChargeRefundsRefundParams {
    /**
     */
    string charge;

    /**
     * Specifies which fields in the response should be expanded.
     */
    string[] expand;

    /**
     */
    string refund;

    mixin AddBuilder!(typeof(this));

  }

  static class GetChargesChargeRefundsRefundResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(Refund response) handleResponse200;

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
        handleResponse200(deserializeJson!(Refund)(res.readJson()));
        return;
      }
      if (handleResponseDefault is null) throw new Exception("Unhandled response status code default");
      handleResponseDefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

  }

  /**
   * <p>Retrieves the details of an existing refund.</p>
   * See_Also: HTTP GET `/v1/charges/{charge}/refunds/{refund}`
   */
  void getChargesChargeRefundsRefund(
      GetChargesChargeRefundsRefundParams params,
      GetChargesChargeRefundsRefundResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.GET,
        Servers.getServerUrl(),
        "/v1/charges/{charge}/refunds/{refund}");
    if (!params.charge.isNull)
      requestor.setPathParam("charge", params.charge);
    if (!params.expand.isNull)
      requestor.setQueryParam!("deepObject")("expand", params.expand);
    if (!params.refund.isNull)
      requestor.setPathParam("refund", params.refund);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class PostChargesChargeRefundsRefundParams {
    /**
     */
    string charge;

    /**
     */
    string refund;

    mixin AddBuilder!(typeof(this));

  }

  static class PostChargesChargeRefundsRefundBody {
    @optional
    Json metadata;

    /**
     * Specifies which fields in the response should be expanded.
     */
    @optional
    string[] expand;

    mixin AddBuilder!(typeof(this));

  }

  static class PostChargesChargeRefundsRefundResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(Refund response) handleResponse200;

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
        handleResponse200(deserializeJson!(Refund)(res.readJson()));
        return;
      }
      if (handleResponseDefault is null) throw new Exception("Unhandled response status code default");
      handleResponseDefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

  }

  /**
   * <p>Update a specified refund.</p>
   * See_Also: HTTP POST `/v1/charges/{charge}/refunds/{refund}`
   */
  void postChargesChargeRefundsRefund(
      PostChargesChargeRefundsRefundParams params,
      PostChargesChargeRefundsRefundBody requestBody,
      PostChargesChargeRefundsRefundResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/charges/{charge}/refunds/{refund}");
    if (!params.charge.isNull)
      requestor.setPathParam("charge", params.charge);
    if (!params.refund.isNull)
      requestor.setPathParam("refund", params.refund);
    requestor.setHeaderParam("Content-Type", "application/x-www-form-urlencoded");
    Security.apply(requestor);
    requestor.makeRequest(requestBody, responseHandler);
  }

  mixin AddBuilder!(typeof(this));

}

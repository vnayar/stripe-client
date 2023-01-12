// File automatically generated from OpenAPI spec.
module stripe.service.v1_invoices_upcoming_lines_service;

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
public import stripe.model.line_item : LineItem;

/**
 * Service to make REST API calls to paths beginning with: /v1/invoices/upcoming/lines
 */
class V1InvoicesUpcomingLinesService {
  static class GetInvoicesUpcomingLinesParams {
    /**
     * Settings for automatic tax lookup for this invoice preview.
     */
    static class AutomaticTaxParam {
      @optional
      Nullable!(bool) enabled;

      mixin AddBuilder!(typeof(this));

    }

    AutomaticTaxParam automatic_tax;

    /**
     * The code of the coupon to apply. If `subscription` or `subscription_items` is provided, the
     * invoice returned will preview updating or creating a subscription with that coupon.
     * Otherwise, it will preview applying that coupon to the customer for the next upcoming invoice
     * from among the customer's subscriptions. The invoice can be previewed without a coupon by
     * passing this value as an empty string.
     */
    string coupon;

    /**
     * The currency to preview this invoice in. Defaults to that of `customer` if not specified.
     */
    string currency;

    /**
     * The identifier of the customer whose upcoming invoice you'd like to retrieve.
     */
    string customer;

    /**
     * Details about the customer you want to invoice or overrides for an existing customer.
     */
    static class CustomerDetailsParam {
      @optional
      string tax_exempt;

      @optional
      Json shipping;

      static class DataParams {
        @optional
        string type;

        @optional
        string value;

        mixin AddBuilder!(typeof(this));

      }

      @optional
      DataParams[] tax_ids;

      @optional
      Json address;

      static class TaxParam {
        @optional
        Json ip_address;

        mixin AddBuilder!(typeof(this));

      }

      @optional
      TaxParam tax;

      mixin AddBuilder!(typeof(this));

    }

    CustomerDetailsParam customer_details;

    /**
     * The coupons to redeem into discounts for the invoice preview. If not specified, inherits the
     * discount from the customer or subscription. This only works for coupons directly applied to
     * the invoice. To apply a coupon to a subscription, you must use the `coupon` parameter
     * instead. Pass an empty string to avoid inheriting any discounts. To preview the upcoming
     * invoice for a subscription that hasn't been created, use `coupon` instead.
     */
    Json discounts;

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
     * List of invoice items to add or update in the upcoming invoice preview.
     */
    static class InvoiceItemPreviewParams {
      @optional
      string invoiceitem;

      @optional
      Json tax_code;

      @optional
      Nullable!(int) amount;

      static class Period {
        @optional
        Nullable!(long) end;

        @optional
        Nullable!(long) start;

        mixin AddBuilder!(typeof(this));

      }

      @optional
      Period period;

      @optional
      Nullable!(int) unit_amount;

      @optional
      Json metadata;

      @optional
      string currency;

      @optional
      Nullable!(int) quantity;

      static class OneTimePriceData {
        @optional
        string currency;

        @optional
        string unit_amount_decimal;

        @optional
        string product;

        @optional
        string tax_behavior;

        @optional
        Nullable!(int) unit_amount;

        mixin AddBuilder!(typeof(this));

      }

      @optional
      OneTimePriceData price_data;

      @optional
      string unit_amount_decimal;

      @optional
      string tax_behavior;

      @optional
      Json discounts;

      @optional
      string description;

      @optional
      Nullable!(bool) discountable;

      @optional
      Json tax_rates;

      @optional
      string price;

      mixin AddBuilder!(typeof(this));

    }

    InvoiceItemPreviewParams[] invoice_items;

    /**
     * A limit on the number of objects to be returned. Limit can range between 1 and 100, and the
     * default is 10.
     */
    Nullable!(int) limit;

    /**
     * The identifier of the unstarted schedule whose upcoming invoice you'd like to retrieve.
     * Cannot be used with subscription or subscription fields.
     */
    string schedule;

    /**
     * A cursor for use in pagination. `starting_after` is an object ID that defines your place in
     * the list. For instance, if you make a list request and receive 100 objects, ending with
     * `obj_foo`, your subsequent call can include `starting_after=obj_foo` in order to fetch the
     * next page of the list.
     */
    string starting_after;

    /**
     * The identifier of the subscription for which you'd like to retrieve the upcoming invoice. If
     * not provided, but a `subscription_items` is provided, you will preview creating a
     * subscription with those items. If neither `subscription` nor `subscription_items` is
     * provided, you will retrieve the next upcoming invoice from among the customer's
     * subscriptions.
     */
    string subscription;

    /**
     * For new subscriptions, a future timestamp to anchor the subscription's [billing
     * cycle](https://stripe.com/docs/subscriptions/billing-cycle). This is used to determine the
     * date of the first full invoice, and, for plans with `month` or `year` intervals, the day of
     * the month for subsequent invoices. For existing subscriptions, the value can only be set to
     * `now` or `unchanged`.
     */
    Json subscription_billing_cycle_anchor;

    /**
     * Timestamp indicating when the subscription should be scheduled to cancel. Will prorate if
     * within the current period and prorations have been enabled using `proration_behavior`.
     */
    Json subscription_cancel_at;

    /**
     * Boolean indicating whether this subscription should cancel at the end of the current period.
     */
    Nullable!(bool) subscription_cancel_at_period_end;

    /**
     * This simulates the subscription being canceled or expired immediately.
     */
    Nullable!(bool) subscription_cancel_now;

    /**
     * If provided, the invoice returned will preview updating or creating a subscription with these
     * default tax rates. The default tax rates will apply to any line item that does not have
     * `tax_rates` set.
     */
    Json subscription_default_tax_rates;

    /**
     * A list of up to 20 subscription items, each with an attached price.
     */
    static class SubscriptionItemUpdateParams {
      @optional
      string id;

      @optional
      Nullable!(bool) clear_usage;

      @optional
      Json metadata;

      @optional
      Nullable!(int) quantity;

      @optional
      Json billing_thresholds;

      static class RecurringPriceData {
        @optional
        string currency;

        @optional
        string unit_amount_decimal;

        static class RecurringAdhoc {
          @optional
          Nullable!(int) interval_count;

          @optional
          string interval;

          mixin AddBuilder!(typeof(this));

        }

        @optional
        RecurringAdhoc recurring;

        @optional
        string product;

        @optional
        string tax_behavior;

        @optional
        Nullable!(int) unit_amount;

        mixin AddBuilder!(typeof(this));

      }

      @optional
      RecurringPriceData price_data;

      @optional
      Json tax_rates;

      @optional
      Nullable!(bool) deleted;

      @optional
      string price;

      mixin AddBuilder!(typeof(this));

    }

    SubscriptionItemUpdateParams[] subscription_items;

    /**
     * Determines how to handle
     * [prorations](https://stripe.com/docs/subscriptions/billing-cycle#prorations) when the billing
     * cycle changes (e.g., when switching plans, resetting `billing_cycle_anchor=now`, or starting
     * a trial), or if an item's `quantity` changes.
     */
    string subscription_proration_behavior;

    /**
     * If previewing an update to a subscription, and doing proration, `subscription_proration_date`
     * forces the proration to be calculated as though the update was done at the specified time.
     * The time given must be within the current subscription period, and cannot be before the
     * subscription was on its current plan. If set, `subscription`, and one of
     * `subscription_items`, or `subscription_trial_end` are required. Also,
     * `subscription_proration_behavior` cannot be set to 'none'.
     */
    Nullable!(long) subscription_proration_date;

    /**
     * Date a subscription is intended to start (can be future or past)
     */
    Nullable!(long) subscription_start_date;

    /**
     * If provided, the invoice returned will preview updating or creating a subscription with that
     * trial end. If set, one of `subscription_items` or `subscription` is required.
     */
    Json subscription_trial_end;

    /**
     * Indicates if a plan's `trial_period_days` should be applied to the subscription. Setting
     * `subscription_trial_end` per subscription is preferred, and this defaults to `false`. Setting
     * this flag to `true` together with `subscription_trial_end` is not allowed. See [Using trial
     * periods on subscriptions](https://stripe.com/docs/billing/subscriptions/trials) to learn
     * more.
     */
    Nullable!(bool) subscription_trial_from_plan;

    mixin AddBuilder!(typeof(this));

  }

  static class GetInvoicesUpcomingLinesResponseHandler : ResponseHandler {

    static class InvoiceLinesList {
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
      LineItem[] data;

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
    void delegate(InvoiceLinesList response) handleResponse200;

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
        handleResponse200(deserializeJson!(InvoiceLinesList)(res.readJson()));
        return;
      }
      if (handleResponseDefault is null) throw new Exception("Unhandled response status code default");
      handleResponseDefault(deserializeJson!(Error_)(res.readJson()));
    }

    mixin AddBuilder!(typeof(this));

  }

  /**
   * <p>When retrieving an upcoming invoice, you’ll get a <strong>lines</strong> property
   * containing the total count of line items and the first handful of those items. There is also a
   * URL where you can retrieve the full (paginated) list of line items.</p>
   * See_Also: HTTP GET `/v1/invoices/upcoming/lines`
   */
  void getInvoicesUpcomingLines(
      GetInvoicesUpcomingLinesParams params,
      GetInvoicesUpcomingLinesResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.GET,
        Servers.getServerUrl(),
        "/v1/invoices/upcoming/lines");
    if (!params.automatic_tax.isNull)
      requestor.setQueryParam!("deepObject")("automatic_tax", params.automatic_tax);
    if (!params.coupon.isNull)
      requestor.setQueryParam!("deepObject")("coupon", params.coupon);
    if (!params.currency.isNull)
      requestor.setQueryParam!("deepObject")("currency", params.currency);
    if (!params.customer.isNull)
      requestor.setQueryParam!("deepObject")("customer", params.customer);
    if (!params.customer_details.isNull)
      requestor.setQueryParam!("deepObject")("customer_details", params.customer_details);
    if (!params.discounts.isNull)
      requestor.setQueryParam!("deepObject")("discounts", params.discounts);
    if (!params.ending_before.isNull)
      requestor.setQueryParam!("deepObject")("ending_before", params.ending_before);
    if (!params.expand.isNull)
      requestor.setQueryParam!("deepObject")("expand", params.expand);
    if (!params.invoice_items.isNull)
      requestor.setQueryParam!("deepObject")("invoice_items", params.invoice_items);
    if (!params.limit.isNull)
      requestor.setQueryParam!("deepObject")("limit", params.limit);
    if (!params.schedule.isNull)
      requestor.setQueryParam!("deepObject")("schedule", params.schedule);
    if (!params.starting_after.isNull)
      requestor.setQueryParam!("deepObject")("starting_after", params.starting_after);
    if (!params.subscription.isNull)
      requestor.setQueryParam!("deepObject")("subscription", params.subscription);
    if (!params.subscription_billing_cycle_anchor.isNull)
      requestor.setQueryParam!("deepObject")("subscription_billing_cycle_anchor", params.subscription_billing_cycle_anchor);
    if (!params.subscription_cancel_at.isNull)
      requestor.setQueryParam!("deepObject")("subscription_cancel_at", params.subscription_cancel_at);
    if (!params.subscription_cancel_at_period_end.isNull)
      requestor.setQueryParam!("deepObject")("subscription_cancel_at_period_end", params.subscription_cancel_at_period_end);
    if (!params.subscription_cancel_now.isNull)
      requestor.setQueryParam!("deepObject")("subscription_cancel_now", params.subscription_cancel_now);
    if (!params.subscription_default_tax_rates.isNull)
      requestor.setQueryParam!("deepObject")("subscription_default_tax_rates", params.subscription_default_tax_rates);
    if (!params.subscription_items.isNull)
      requestor.setQueryParam!("deepObject")("subscription_items", params.subscription_items);
    if (!params.subscription_proration_behavior.isNull)
      requestor.setQueryParam!("deepObject")("subscription_proration_behavior", params.subscription_proration_behavior);
    if (!params.subscription_proration_date.isNull)
      requestor.setQueryParam!("deepObject")("subscription_proration_date", params.subscription_proration_date);
    if (!params.subscription_start_date.isNull)
      requestor.setQueryParam!("deepObject")("subscription_start_date", params.subscription_start_date);
    if (!params.subscription_trial_end.isNull)
      requestor.setQueryParam!("deepObject")("subscription_trial_end", params.subscription_trial_end);
    if (!params.subscription_trial_from_plan.isNull)
      requestor.setQueryParam!("deepObject")("subscription_trial_from_plan", params.subscription_trial_from_plan);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  mixin AddBuilder!(typeof(this));

}

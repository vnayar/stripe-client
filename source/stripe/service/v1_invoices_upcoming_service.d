// File automatically generated from OpenAPI spec.
module stripe.service.v1_invoices_upcoming_service;

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
public import stripe.model.invoice : Invoice;

/**
 * Service to make REST API calls to paths beginning with: /v1/invoices/upcoming
 */
class V1InvoicesUpcomingService {
  static class GetInvoicesUpcomingParams {
    /**
     * Settings for automatic tax lookup for this invoice preview.
     */
    static class AutomaticTaxParam {
      @optional
      Nullable!(bool) enabled;

    }

    Nullable!(AutomaticTaxParam) automatic_tax;

    /**
     * The code of the coupon to apply. If `subscription` or `subscription_items` is provided, the
     * invoice returned will preview updating or creating a subscription with that coupon.
     * Otherwise, it will preview applying that coupon to the customer for the next upcoming invoice
     * from among the customer's subscriptions. The invoice can be previewed without a coupon by
     * passing this value as an empty string.
     */
    Nullable!(Nullable!(string)) coupon;

    /**
     * The currency to preview this invoice in. Defaults to that of `customer` if not specified.
     */
    Nullable!(Nullable!(string)) currency;

    /**
     * The identifier of the customer whose upcoming invoice you'd like to retrieve.
     */
    Nullable!(Nullable!(string)) customer;

    /**
     * Details about the customer you want to invoice or overrides for an existing customer.
     */
    static class CustomerDetailsParam {
      @optional
      Nullable!(string) tax_exempt;

      @optional
      Json shipping;

      static class DataParams {
        @optional
        Nullable!(string) type;

        @optional
        Nullable!(string) value;

      }

      @optional
      DataParams[] tax_ids;

      @optional
      Json address;

      static class TaxParam {
        @optional
        Json ip_address;

      }

      @optional
      TaxParam tax;

    }

    Nullable!(CustomerDetailsParam) customer_details;

    /**
     * The coupons to redeem into discounts for the invoice preview. If not specified, inherits the
     * discount from the customer or subscription. This only works for coupons directly applied to
     * the invoice. To apply a coupon to a subscription, you must use the `coupon` parameter
     * instead. Pass an empty string to avoid inheriting any discounts. To preview the upcoming
     * invoice for a subscription that hasn't been created, use `coupon` instead.
     */
    Nullable!(Json) discounts;

    /**
     * Specifies which fields in the response should be expanded.
     */
    Nullable!(Nullable!(string)[]) expand;

    /**
     * List of invoice items to add or update in the upcoming invoice preview.
     */
    static class InvoiceItemPreviewParams {
      @optional
      Nullable!(string) invoiceitem;

      @optional
      Json tax_code;

      @optional
      Nullable!(int) amount;

      static class Period {
        @optional
        Nullable!(long) end;

        @optional
        Nullable!(long) start;

      }

      @optional
      Period period;

      @optional
      Nullable!(int) unit_amount;

      @optional
      Json metadata;

      @optional
      Nullable!(string) currency;

      @optional
      Nullable!(int) quantity;

      static class OneTimePriceData {
        @optional
        Nullable!(string) currency;

        @optional
        Nullable!(string) unit_amount_decimal;

        @optional
        Nullable!(string) product;

        @optional
        Nullable!(string) tax_behavior;

        @optional
        Nullable!(int) unit_amount;

      }

      @optional
      OneTimePriceData price_data;

      @optional
      Nullable!(string) unit_amount_decimal;

      @optional
      Nullable!(string) tax_behavior;

      @optional
      Json discounts;

      @optional
      Nullable!(string) description;

      @optional
      Nullable!(bool) discountable;

      @optional
      Json tax_rates;

      @optional
      Nullable!(string) price;

    }

    Nullable!(InvoiceItemPreviewParams[]) invoice_items;

    /**
     * The identifier of the unstarted schedule whose upcoming invoice you'd like to retrieve.
     * Cannot be used with subscription or subscription fields.
     */
    Nullable!(Nullable!(string)) schedule;

    /**
     * The identifier of the subscription for which you'd like to retrieve the upcoming invoice. If
     * not provided, but a `subscription_items` is provided, you will preview creating a
     * subscription with those items. If neither `subscription` nor `subscription_items` is
     * provided, you will retrieve the next upcoming invoice from among the customer's
     * subscriptions.
     */
    Nullable!(Nullable!(string)) subscription;

    /**
     * For new subscriptions, a future timestamp to anchor the subscription's [billing
     * cycle](https://stripe.com/docs/subscriptions/billing-cycle). This is used to determine the
     * date of the first full invoice, and, for plans with `month` or `year` intervals, the day of
     * the month for subsequent invoices. For existing subscriptions, the value can only be set to
     * `now` or `unchanged`.
     */
    Nullable!(Json) subscription_billing_cycle_anchor;

    /**
     * Timestamp indicating when the subscription should be scheduled to cancel. Will prorate if
     * within the current period and prorations have been enabled using `proration_behavior`.
     */
    Nullable!(Json) subscription_cancel_at;

    /**
     * Boolean indicating whether this subscription should cancel at the end of the current period.
     */
    Nullable!(Nullable!(bool)) subscription_cancel_at_period_end;

    /**
     * This simulates the subscription being canceled or expired immediately.
     */
    Nullable!(Nullable!(bool)) subscription_cancel_now;

    /**
     * If provided, the invoice returned will preview updating or creating a subscription with these
     * default tax rates. The default tax rates will apply to any line item that does not have
     * `tax_rates` set.
     */
    Nullable!(Json) subscription_default_tax_rates;

    /**
     * A list of up to 20 subscription items, each with an attached price.
     */
    static class SubscriptionItemUpdateParams {
      @optional
      Nullable!(string) id;

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
        Nullable!(string) currency;

        @optional
        Nullable!(string) unit_amount_decimal;

        static class RecurringAdhoc {
          @optional
          Nullable!(int) interval_count;

          @optional
          Nullable!(string) interval;

        }

        @optional
        RecurringAdhoc recurring;

        @optional
        Nullable!(string) product;

        @optional
        Nullable!(string) tax_behavior;

        @optional
        Nullable!(int) unit_amount;

      }

      @optional
      RecurringPriceData price_data;

      @optional
      Json tax_rates;

      @optional
      Nullable!(bool) deleted;

      @optional
      Nullable!(string) price;

    }

    Nullable!(SubscriptionItemUpdateParams[]) subscription_items;

    /**
     * Determines how to handle
     * [prorations](https://stripe.com/docs/subscriptions/billing-cycle#prorations) when the billing
     * cycle changes (e.g., when switching plans, resetting `billing_cycle_anchor=now`, or starting
     * a trial), or if an item's `quantity` changes.
     */
    Nullable!(Nullable!(string)) subscription_proration_behavior;

    /**
     * If previewing an update to a subscription, and doing proration, `subscription_proration_date`
     * forces the proration to be calculated as though the update was done at the specified time.
     * The time given must be within the current subscription period, and cannot be before the
     * subscription was on its current plan. If set, `subscription`, and one of
     * `subscription_items`, or `subscription_trial_end` are required. Also,
     * `subscription_proration_behavior` cannot be set to 'none'.
     */
    Nullable!(Nullable!(long)) subscription_proration_date;

    /**
     * Date a subscription is intended to start (can be future or past)
     */
    Nullable!(Nullable!(long)) subscription_start_date;

    /**
     * If provided, the invoice returned will preview updating or creating a subscription with that
     * trial end. If set, one of `subscription_items` or `subscription` is required.
     */
    Nullable!(Json) subscription_trial_end;

    /**
     * Indicates if a plan's `trial_period_days` should be applied to the subscription. Setting
     * `subscription_trial_end` per subscription is preferred, and this defaults to `false`. Setting
     * this flag to `true` together with `subscription_trial_end` is not allowed. See [Using trial
     * periods on subscriptions](https://stripe.com/docs/billing/subscriptions/trials) to learn
     * more.
     */
    Nullable!(Nullable!(bool)) subscription_trial_from_plan;

  }

  static class GetInvoicesUpcomingResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(Invoice response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponsedefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        handleResponse200(deserializeJson!(Invoice)(res.readJson()));
        return;
      }
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   * <p>At any time, you can preview the upcoming invoice for a customer. This will show you all the
   * charges that are pending, including subscription renewal charges, invoice item charges, etc. It
   * will also show you any discounts that are applicable to the invoice.</p>
   * <p>Note that when you are viewing an upcoming invoice, you are simply viewing a preview – the
   * invoice has not yet been created. As such, the upcoming invoice will not show up in invoice
   * listing calls, and you cannot use the API to pay or edit the invoice. If you want to change the
   * amount that your customer will be billed, you can add, remove, or update pending invoice items,
   * or update the customer’s discount.</p>
   * <p>You can preview the effects of updating a subscription, including a preview of what
   * proration will take place. To ensure that the actual proration is calculated exactly the same
   * as the previewed proration, you should pass a <code>proration_date</code> parameter when doing
   * the actual subscription update. The value passed in should be the same as the
   * <code>subscription_proration_date</code> returned on the upcoming invoice resource. The
   * recommended way to get only the prorations being previewed is to consider only proration line
   * items where <code>period[start]</code> is equal to the <code>subscription_proration_date</code>
   * on the upcoming invoice resource.</p>
   * See_Also: HTTP GET `/v1/invoices/upcoming`
   */
  void getInvoicesUpcoming(
      GetInvoicesUpcomingParams params,
      GetInvoicesUpcomingResponseHandler responseHandler,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.GET,
        Servers.getServerUrl(),
        "/v1/invoices/upcoming");
    if (!params.automatic_tax.isNull)
      requestor.setQueryParam("automatic_tax", params.automatic_tax.get.to!string);
    if (!params.coupon.isNull)
      requestor.setQueryParam("coupon", params.coupon.get.to!string);
    if (!params.currency.isNull)
      requestor.setQueryParam("currency", params.currency.get.to!string);
    if (!params.customer.isNull)
      requestor.setQueryParam("customer", params.customer.get.to!string);
    if (!params.customer_details.isNull)
      requestor.setQueryParam("customer_details", params.customer_details.get.to!string);
    if (!params.discounts.isNull)
      requestor.setQueryParam("discounts", params.discounts.get.to!string);
    if (!params.expand.isNull)
      requestor.setQueryParam("expand", params.expand.get.to!string);
    if (!params.invoice_items.isNull)
      requestor.setQueryParam("invoice_items", params.invoice_items.get.to!string);
    if (!params.schedule.isNull)
      requestor.setQueryParam("schedule", params.schedule.get.to!string);
    if (!params.subscription.isNull)
      requestor.setQueryParam("subscription", params.subscription.get.to!string);
    if (!params.subscription_billing_cycle_anchor.isNull)
      requestor.setQueryParam("subscription_billing_cycle_anchor", params.subscription_billing_cycle_anchor.get.to!string);
    if (!params.subscription_cancel_at.isNull)
      requestor.setQueryParam("subscription_cancel_at", params.subscription_cancel_at.get.to!string);
    if (!params.subscription_cancel_at_period_end.isNull)
      requestor.setQueryParam("subscription_cancel_at_period_end", params.subscription_cancel_at_period_end.get.to!string);
    if (!params.subscription_cancel_now.isNull)
      requestor.setQueryParam("subscription_cancel_now", params.subscription_cancel_now.get.to!string);
    if (!params.subscription_default_tax_rates.isNull)
      requestor.setQueryParam("subscription_default_tax_rates", params.subscription_default_tax_rates.get.to!string);
    if (!params.subscription_items.isNull)
      requestor.setQueryParam("subscription_items", params.subscription_items.get.to!string);
    if (!params.subscription_proration_behavior.isNull)
      requestor.setQueryParam("subscription_proration_behavior", params.subscription_proration_behavior.get.to!string);
    if (!params.subscription_proration_date.isNull)
      requestor.setQueryParam("subscription_proration_date", params.subscription_proration_date.get.to!string);
    if (!params.subscription_start_date.isNull)
      requestor.setQueryParam("subscription_start_date", params.subscription_start_date.get.to!string);
    if (!params.subscription_trial_end.isNull)
      requestor.setQueryParam("subscription_trial_end", params.subscription_trial_end.get.to!string);
    if (!params.subscription_trial_from_plan.isNull)
      requestor.setQueryParam("subscription_trial_from_plan", params.subscription_trial_from_plan.get.to!string);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

}

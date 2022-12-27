// File automatically generated from OpenAPI spec.
module stripe.service.v1_plans_service;

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

public import stripe.model.deleted_plan : DeletedPlan;
public import stripe.model.error : Error_;
public import stripe.model.plan : Plan;
/**
 * Service to make REST API calls to paths beginning with: /v1/plans
 */
class V1PlansService {
  static class GetPlansPlanParams {
    /**
     * Specifies which fields in the response should be expanded.
     */
    Nullable!(Nullable!(string)[]) expand;

    /**
     */
    Nullable!(Nullable!(string)) plan;

  }

  static class GetPlansPlanResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(Plan response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponsedefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        handleResponse200(deserializeJson!(Plan)(res.readJson()));
        return;
      }
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   */
  void getPlansPlan(
      GetPlansPlanParams params,
      GetPlansPlanResponseHandler responseHandler = null,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.GET,
        Servers.getServerUrl(),
        "/v1/plans/{plan}");
    if (!params.expand.isNull)
      requestor.setQueryParam("expand", params.expand.get.to!string);
    if (!params.plan.isNull)
      requestor.setPathParam("plan", params.plan.get.to!string);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class PostPlansPlanParams {
    /**
     */
    Nullable!(Nullable!(string)) plan;

  }

  static class PostPlansPlanResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(Plan response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponsedefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        handleResponse200(deserializeJson!(Plan)(res.readJson()));
        return;
      }
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   */
  void postPlansPlan(
      PostPlansPlanParams params,
      PostPlansPlanResponseHandler responseHandler = null,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/plans/{plan}");
    if (!params.plan.isNull)
      requestor.setPathParam("plan", params.plan.get.to!string);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class DeletePlansPlanParams {
    /**
     */
    Nullable!(Nullable!(string)) plan;

  }

  static class DeletePlansPlanResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(DeletedPlan response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponsedefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        handleResponse200(deserializeJson!(DeletedPlan)(res.readJson()));
        return;
      }
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   */
  void deletePlansPlan(
      DeletePlansPlanParams params,
      DeletePlansPlanResponseHandler responseHandler = null,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.DELETE,
        Servers.getServerUrl(),
        "/v1/plans/{plan}");
    if (!params.plan.isNull)
      requestor.setPathParam("plan", params.plan.get.to!string);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class GetPlansParams {
    /**
     * Only return plans that are active or inactive (e.g., pass `false` to list all inactive
     * plans).
     */
    Nullable!(Nullable!(bool)) active;

    /**
     * A filter on the list, based on the object `created` field. The value can be a string with an
     * integer Unix timestamp, or it can be a dictionary with a number of different query options.
     */
    Nullable!(Json) created;

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
     * Only return plans for the given product.
     */
    Nullable!(Nullable!(string)) product;

    /**
     * A cursor for use in pagination. `starting_after` is an object ID that defines your place in
     * the list. For instance, if you make a list request and receive 100 objects, ending with
     * `obj_foo`, your subsequent call can include `starting_after=obj_foo` in order to fetch the
     * next page of the list.
     */
    Nullable!(Nullable!(string)) starting_after;

  }

  static class GetPlansResponseHandler : ResponseHandler {

    static class PlanList {
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
      Plan[] data;

      /**
       * The URL where this list can be accessed.
       */
      @optional
      Nullable!(string) url;

    }

    /**
     * Successful response.
     */
    void delegate(PlanList response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponsedefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        handleResponse200(deserializeJson!(PlanList)(res.readJson()));
        return;
      }
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   */
  void getPlans(
      GetPlansParams params,
      GetPlansResponseHandler responseHandler = null,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.GET,
        Servers.getServerUrl(),
        "/v1/plans");
    if (!params.active.isNull)
      requestor.setQueryParam("active", params.active.get.to!string);
    if (!params.created.isNull)
      requestor.setQueryParam("created", params.created.get.to!string);
    if (!params.ending_before.isNull)
      requestor.setQueryParam("ending_before", params.ending_before.get.to!string);
    if (!params.expand.isNull)
      requestor.setQueryParam("expand", params.expand.get.to!string);
    if (!params.limit.isNull)
      requestor.setQueryParam("limit", params.limit.get.to!string);
    if (!params.product.isNull)
      requestor.setQueryParam("product", params.product.get.to!string);
    if (!params.starting_after.isNull)
      requestor.setQueryParam("starting_after", params.starting_after.get.to!string);
    Security.apply(requestor);
    requestor.makeRequest(null, responseHandler);
  }

  static class PostPlansBody {
    /**
     * Specifies billing frequency. Either `day`, `week`, `month` or `year`.
     */
    @optional
    Nullable!(string) interval;

    /**
     * A positive integer in cents (or local equivalent) (or 0 for a free plan) representing how
     * much to charge on a recurring basis.
     */
    @optional
    Nullable!(int) amount;

    /**
     * Default number of trial days when subscribing a customer to this plan using
     * [`trial_from_plan=true`](https://stripe.com/docs/api#create_subscription-trial_from_plan).
     */
    @optional
    Nullable!(int) trial_period_days;

    /**
     * An identifier randomly generated by Stripe. Used to identify this plan when subscribing a
     * customer. You can optionally override this ID, but the ID must be unique across all plans in
     * your Stripe account. You can, however, use the same plan ID in both live and test modes.
     */
    @optional
    Nullable!(string) id;

    static class TransformUsageParam {
      @optional
      Nullable!(int) divide_by;

      @optional
      Nullable!(string) round;

    }

    /**
     * Apply a transformation to the reported usage or set quantity before computing the billed
     * price. Cannot be combined with `tiers`.
     */
    @optional
    TransformUsageParam transform_usage;

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
    Nullable!(string) currency;

    /**
     * Specifies a usage aggregation strategy for plans of `usage_type=metered`. Allowed values are
     * `sum` for summing up all usage during a period, `last_during_period` for using the last usage
     * record reported within a period, `last_ever` for using the last usage record ever (across
     * period bounds) or `max` which uses the usage record with the maximum reported usage during a
     * period. Defaults to `sum`.
     */
    @optional
    Nullable!(string) aggregate_usage;

    @optional
    Json product;

    /**
     * Configures how the quantity per period should be determined. Can be either `metered` or
     * `licensed`. `licensed` automatically bills the `quantity` set when adding it to a
     * subscription. `metered` aggregates the total usage based on usage records. Defaults to
     * `licensed`.
     */
    @optional
    Nullable!(string) usage_type;

    /**
     * Whether the plan is currently available for new subscriptions. Defaults to `true`.
     */
    @optional
    Nullable!(bool) active;

    /**
     * Specifies which fields in the response should be expanded.
     */
    @optional
    Nullable!(string)[] expand;

    /**
     * The number of intervals between subscription billings. For example, `interval=month` and
     * `interval_count=3` bills every 3 months. Maximum of one year interval allowed (1 year, 12
     * months, or 52 weeks).
     */
    @optional
    Nullable!(int) interval_count;

    /**
     * Same as `amount`, but accepts a decimal value with at most 12 decimal places. Only one of
     * `amount` and `amount_decimal` can be set.
     */
    @optional
    Nullable!(string) amount_decimal;

    /**
     * Describes how to compute the price per period. Either `per_unit` or `tiered`. `per_unit`
     * indicates that the fixed amount (specified in `amount`) will be charged per unit in
     * `quantity` (for plans with `usage_type=licensed`), or per unit of total usage (for plans with
     * `usage_type=metered`). `tiered` indicates that the unit pricing will be computed using a
     * tiering strategy as defined using the `tiers` and `tiers_mode` attributes.
     */
    @optional
    Nullable!(string) billing_scheme;

    /**
     * A brief description of the plan, hidden from customers.
     */
    @optional
    Nullable!(string) nickname;

    /**
     * Defines if the tiering price should be `graduated` or `volume` based. In `volume`-based
     * tiering, the maximum quantity within a period determines the per unit price, in `graduated`
     * tiering pricing can successively change as the quantity grows.
     */
    @optional
    Nullable!(string) tiers_mode;

    static class Tier {
      @optional
      Nullable!(string) unit_amount_decimal;

      @optional
      Nullable!(int) flat_amount;

      @optional
      Json up_to;

      @optional
      Nullable!(int) unit_amount;

      @optional
      Nullable!(string) flat_amount_decimal;

    }

    /**
     * Each element represents a pricing tier. This parameter requires `billing_scheme` to be set to
     * `tiered`. See also the documentation for `billing_scheme`.
     */
    @optional
    Tier[] tiers;

  }

  static class PostPlansResponseHandler : ResponseHandler {

    /**
     * Successful response.
     */
    void delegate(Plan response) handleResponse200;

    /**
     * Error response.
     */
    void delegate(Error_ response) handleResponsedefault;

    /**
     * An HTTPResponse handler that routes to a particular handler method.
     */
    void handleResponse(HTTPClientResponse res) {
      if (res.statusCode >= 200 && res.statusCode <= 200) {
        handleResponse200(deserializeJson!(Plan)(res.readJson()));
        return;
      }
      handleResponsedefault(deserializeJson!(Error_)(res.readJson()));
    }

  }

  /**
   */
  void postPlans(
      PostPlansBody requestBody,
      PostPlansResponseHandler responseHandler = null,
      ) {
    ApiRequest requestor = new ApiRequest(
        HTTPMethod.POST,
        Servers.getServerUrl(),
        "/v1/plans");
    Security.apply(requestor);
    requestor.makeRequest(requestBody, responseHandler);
  }

}

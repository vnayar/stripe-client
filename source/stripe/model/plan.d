// File automatically generated from OpenAPI spec.
module stripe.model.plan;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;

import stripe.model.deleted_product : DeletedProduct;
import stripe.model.plan_tier : PlanTier;
import stripe.model.product : Product;
import stripe.model.transform_usage : TransformUsage;

/**
 * You can now model subscriptions more flexibly using the [Prices
 * API](https://stripe.com/docs/api#prices). It replaces the Plans API and is backwards compatible
 * to simplify your migration.
 * Plans define the base price, currency, and billing cycle for recurring purchases of products.
 * [Products](https://stripe.com/docs/api#products) help you track inventory or provisioning, and
 * plans help you track pricing. Different physical goods or levels of service should be
 * represented by products, and pricing options should be represented by plans. This approach lets
 * you change prices without having to change your provisioning scheme.
 * For example, you might have a single "gold" product that has plans for $10/month, $100/year,
 * €9/month, and €90/year.
 * Related guides: [Set up a
 * subscription](https://stripe.com/docs/billing/subscriptions/set-up-subscription) and more about
 * [products and prices](https://stripe.com/docs/products-prices/overview).
 */
class Plan {
  /**
   * The frequency at which a subscription is billed. One of `day`, `week`, `month` or `year`.
   */
  @optional
  Nullable!(string) interval;

  /**
   * The unit amount in %s to be charged, represented as a whole integer if possible. Only set if
   * `billing_scheme=per_unit`.
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
   * Unique identifier for the object.
   */
  @optional
  Nullable!(string) id;

  /**
   * Apply a transformation to the reported usage or set quantity before computing the amount
   * billed. Cannot be combined with `tiers`.
   */
  @optional
  TransformUsage transform_usage;

  /**
   * Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an
   * object. This can be useful for storing additional information about the object in a
   * structured format.
   */
  @optional
  Nullable!(string)[string] metadata;

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

  /**
   * The product whose pricing this plan determines.
   */
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
   * Whether the plan can be used for new purchases.
   */
  @optional
  Nullable!(bool) active;

  /**
   * Has the value `true` if the object exists in live mode or the value `false` if the object
   * exists in test mode.
   */
  @optional
  Nullable!(bool) livemode;

  /**
   * The number of intervals (specified in the `interval` attribute) between subscription
   * billings. For example, `interval=month` and `interval_count=3` bills every 3 months.
   */
  @optional
  Nullable!(int) interval_count;

  /**
   * String representing the object's type. Objects of the same type share the same value.
   */
  @optional
  Nullable!(string) object;

  /**
   * The unit amount in %s to be charged, represented as a decimal string with at most 12 decimal
   * places. Only set if `billing_scheme=per_unit`.
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
   * Time at which the object was created. Measured in seconds since the Unix epoch.
   */
  @optional
  Nullable!(long) created;

  /**
   * A brief description of the plan, hidden from customers.
   */
  @optional
  Nullable!(string) nickname;

  /**
   * Defines if the tiering price should be `graduated` or `volume` based. In `volume`-based
   * tiering, the maximum quantity within a period determines the per unit price. In `graduated`
   * tiering, pricing can change as the quantity grows.
   */
  @optional
  Nullable!(string) tiers_mode;

  /**
   * Each element represents a pricing tier. This parameter requires `billing_scheme` to be set to
   * `tiered`. See also the documentation for `billing_scheme`.
   */
  @optional
  PlanTier[] tiers;

}

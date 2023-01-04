// File automatically generated from OpenAPI spec.
module stripe.model.price;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;

import stripe.model.currency_option : CurrencyOption;
import stripe.model.custom_unit_amount : CustomUnitAmount;
import stripe.model.deleted_product : DeletedProduct;
import stripe.model.price_tier : PriceTier;
import stripe.model.product : Product;
import stripe.model.recurring : Recurring;
import stripe.model.transform_quantity : TransformQuantity;

/**
 * Prices define the unit cost, currency, and (optional) billing cycle for both recurring and
 * one-time purchases of products.
 * [Products](https://stripe.com/docs/api#products) help you track inventory or provisioning, and
 * prices help you track payment terms. Different physical goods or levels of service should be
 * represented by products, and pricing options should be represented by prices. This approach
 * lets you change prices without having to change your provisioning scheme.
 * For example, you might have a single "gold" product that has prices for $10/month, $100/year,
 * and €9 once.
 * Related guides: [Set up a
 * subscription](https://stripe.com/docs/billing/subscriptions/set-up-subscription), [create an
 * invoice](https://stripe.com/docs/billing/invoices/create), and more about [products and
 * prices](https://stripe.com/docs/products-prices/overview).
 */
class Price {
  /**
   * A lookup key used to retrieve prices dynamically from a static string. This may be up to 200
   * characters.
   */
  @optional
  string lookup_key;

  /**
   * Unique identifier for the object.
   */
  @optional
  string id;

  /**
   * The unit amount in %s to be charged, represented as a whole integer if possible. Only set if
   * `billing_scheme=per_unit`.
   */
  @optional
  Nullable!(int) unit_amount;

  /**
   * Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an
   * object. This can be useful for storing additional information about the object in a
   * structured format.
   */
  @optional
  string[string] metadata;

  /**
   * Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in
   * lowercase. Must be a [supported currency](https://stripe.com/docs/currencies).
   */
  @optional
  string currency;

  /**
   * The ID of the product this price is associated with.
   */
  @optional
  Json product;

  /**
   * Apply a transformation to the reported usage or set quantity before computing the amount
   * billed. Cannot be combined with `tiers`.
   */
  @optional
  TransformQuantity transform_quantity;

  /**
   * Whether the price can be used for new purchases.
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
   * The unit amount in %s to be charged, represented as a decimal string with at most 12 decimal
   * places. Only set if `billing_scheme=per_unit`.
   */
  @optional
  string unit_amount_decimal;

  /**
   * When set, provides configuration for the amount to be adjusted by the customer during
   * Checkout Sessions and Payment Links.
   */
  @optional
  CustomUnitAmount custom_unit_amount;

  /**
   * String representing the object's type. Objects of the same type share the same value.
   */
  @optional
  string object;

  /**
   * Specifies whether the price is considered inclusive of taxes or exclusive of taxes. One of
   * `inclusive`, `exclusive`, or `unspecified`. Once specified as either `inclusive` or
   * `exclusive`, it cannot be changed.
   */
  @optional
  string tax_behavior;

  /**
   * One of `one_time` or `recurring` depending on whether the price is for a one-time purchase or
   * a recurring (subscription) purchase.
   */
  @optional
  string type;

  /**
   * Describes how to compute the price per period. Either `per_unit` or `tiered`. `per_unit`
   * indicates that the fixed amount (specified in `unit_amount` or `unit_amount_decimal`) will be
   * charged per unit in `quantity` (for prices with `usage_type=licensed`), or per unit of total
   * usage (for prices with `usage_type=metered`). `tiered` indicates that the unit pricing will
   * be computed using a tiering strategy as defined using the `tiers` and `tiers_mode`
   * attributes.
   */
  @optional
  string billing_scheme;

  /**
   * Time at which the object was created. Measured in seconds since the Unix epoch.
   */
  @optional
  Nullable!(long) created;

  /**
   * Prices defined in each available currency option. Each key must be a three-letter [ISO
   * currency code](https://www.iso.org/iso-4217-currency-codes.html) and a [supported
   * currency](https://stripe.com/docs/currencies).
   */
  @optional
  CurrencyOption[string] currency_options;

  /**
   * The recurring components of a price such as `interval` and `usage_type`.
   */
  @optional
  Recurring recurring;

  /**
   * A brief description of the price, hidden from customers.
   */
  @optional
  string nickname;

  /**
   * Defines if the tiering price should be `graduated` or `volume` based. In `volume`-based
   * tiering, the maximum quantity within a period determines the per unit price. In `graduated`
   * tiering, pricing can change as the quantity grows.
   */
  @optional
  string tiers_mode;

  /**
   * Each element represents a pricing tier. This parameter requires `billing_scheme` to be set to
   * `tiered`. See also the documentation for `billing_scheme`.
   */
  @optional
  PriceTier[] tiers;

}

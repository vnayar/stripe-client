// File automatically generated from OpenAPI spec.
module stripe.model.tax_rate;

import vibe.data.serialization : optional;
import vibe.data.json : Json;
import builder : AddBuilder;

import std.typecons : Nullable;


/**
 * Tax rates can be applied to [invoices](https://stripe.com/docs/billing/invoices/tax-rates),
 * [subscriptions](https://stripe.com/docs/billing/subscriptions/taxes) and [Checkout
 * Sessions](https://stripe.com/docs/payments/checkout/set-up-a-subscription#tax-rates) to collect
 * tax.
 * Related guide: [Tax Rates](https://stripe.com/docs/billing/taxes/tax-rates).
 */
class TaxRate {
  /**
   * Two-letter country code ([ISO 3166-1
   * alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2)).
   */
  @optional
  string country;

  /**
   * [ISO 3166-2 subdivision code](https://en.wikipedia.org/wiki/ISO_3166-2:US), without country
   * prefix. For example, "NY" for New York, United States.
   */
  @optional
  string state;

  /**
   * This specifies if the tax rate is inclusive or exclusive.
   */
  @optional
  Nullable!(bool) inclusive;

  /**
   * Unique identifier for the object.
   */
  @optional
  string id;

  /**
   * Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an
   * object. This can be useful for storing additional information about the object in a
   * structured format.
   */
  @optional
  string[string] metadata;

  /**
   * Defaults to `true`. When set to `false`, this tax rate cannot be used with new applications
   * or Checkout Sessions, but will still work for subscriptions and invoices that already have it
   * set.
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
   * The display name of the tax rates as it will appear to your customer on their receipt email,
   * PDF, and the hosted invoice page.
   */
  @optional
  string display_name;

  /**
   * This represents the tax rate percent out of 100.
   */
  @optional
  Nullable!(float) percentage;

  /**
   * String representing the object's type. Objects of the same type share the same value.
   */
  @optional
  string object;

  /**
   * The high-level tax type, such as `vat` or `sales_tax`.
   */
  @optional
  string tax_type;

  /**
   * An arbitrary string attached to the tax rate for your internal use only. It will not be
   * visible to your customers.
   */
  @optional
  string description;

  /**
   * The jurisdiction for the tax rate. You can use this label field for tax reporting purposes.
   * It also appears on your customer’s invoice.
   */
  @optional
  string jurisdiction;

  /**
   * Time at which the object was created. Measured in seconds since the Unix epoch.
   */
  @optional
  Nullable!(long) created;

  mixin AddBuilder!(typeof(this));

}

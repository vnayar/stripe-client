// File automatically generated from OpenAPI spec.
module stripe.model.product;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;

import stripe.model.package_dimensions : PackageDimensions;
import stripe.model.price : Price;
import stripe.model.tax_code : TaxCode;

/**
 * Products describe the specific goods or services you offer to your customers.
 * For example, you might offer a Standard and Premium version of your goods or service; each
 * version would be a separate Product.
 * They can be used in conjunction with [Prices](https://stripe.com/docs/api#prices) to configure
 * pricing in Payment Links, Checkout, and Subscriptions.
 * Related guides: [Set up a
 * subscription](https://stripe.com/docs/billing/subscriptions/set-up-subscription),
 * [share a Payment Link](https://stripe.com/docs/payments/payment-links/overview),
 * [accept payments with
 * Checkout](https://stripe.com/docs/payments/accept-a-payment#create-product-prices-upfront),
 * and more about [Products and Prices](https://stripe.com/docs/products-prices/overview)
 */
class Product {
  /**
   * A label that represents units of this product in Stripe and on customers’ receipts and
   * invoices. When set, this will be included in associated invoice line item descriptions.
   */
  @optional
  Nullable!(string) unit_label;

  /**
   * A [tax code](https://stripe.com/docs/tax/tax-categories) ID.
   */
  @optional
  Json tax_code;

  /**
   * Extra information about a product which will appear on your customer's credit card statement.
   * In the case that multiple products are billed at once, the first statement descriptor will be
   * used.
   */
  @optional
  Nullable!(string) statement_descriptor;

  /**
   * The ID of the [Price](https://stripe.com/docs/api/prices) object that is the default price
   * for this product.
   */
  @optional
  Json default_price;

  /**
   * Unique identifier for the object.
   */
  @optional
  Nullable!(string) id;

  /**
   * The dimensions of this product for shipping purposes.
   */
  @optional
  PackageDimensions package_dimensions;

  /**
   * Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an
   * object. This can be useful for storing additional information about the object in a
   * structured format.
   */
  @optional
  Nullable!(string)[string] metadata;

  /**
   * The product's name, meant to be displayable to the customer.
   */
  @optional
  Nullable!(string) name;

  /**
   * Whether the product is currently available for purchase.
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
   * A URL of a publicly-accessible webpage for this product.
   */
  @optional
  Nullable!(string) url;

  /**
   * A list of up to 8 URLs of images for this product, meant to be displayable to the customer.
   */
  @optional
  Nullable!(string)[] images;

  /**
   * String representing the object's type. Objects of the same type share the same value.
   */
  @optional
  Nullable!(string) object;

  /**
   * Time at which the object was last updated. Measured in seconds since the Unix epoch.
   */
  @optional
  Nullable!(long) updated;

  /**
   * The product's description, meant to be displayable to the customer. Use this field to
   * optionally store a long form explanation of the product being sold for your own rendering
   * purposes.
   */
  @optional
  Nullable!(string) description;

  /**
   * Time at which the object was created. Measured in seconds since the Unix epoch.
   */
  @optional
  Nullable!(long) created;

  /**
   * Whether this product is shipped (i.e., physical goods).
   */
  @optional
  Nullable!(bool) shippable;

}

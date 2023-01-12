// File automatically generated from OpenAPI spec.
module stripe.model.shipping_rate;

import vibe.data.serialization : optional;
import vibe.data.json : Json;
import builder : AddBuilder;

import std.typecons : Nullable;

import stripe.model.shipping_rate_delivery_estimate : ShippingRateDeliveryEstimate;
import stripe.model.shipping_rate_fixed_amount : ShippingRateFixedAmount;
import stripe.model.tax_code : TaxCode;

/**
 * Shipping rates describe the price of shipping presented to your customers and can be
 * applied to [Checkout Sessions](https://stripe.com/docs/payments/checkout/shipping)
 * and [Orders](https://stripe.com/docs/orders/shipping) to collect shipping costs.
 */
class ShippingRate {
  /**
   * The estimated range for how long shipping will take, meant to be displayable to the customer.
   * This will appear on CheckoutSessions.
   */
  @optional
  ShippingRateDeliveryEstimate delivery_estimate;

  @optional
  ShippingRateFixedAmount fixed_amount;

  /**
   * A [tax code](https://stripe.com/docs/tax/tax-categories) ID. The Shipping tax code is
   * `txcd_92010001`.
   */
  @optional
  Json tax_code;

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
   * Whether the shipping rate can be used for new purchases. Defaults to `true`.
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
   * The name of the shipping rate, meant to be displayable to the customer. This will appear on
   * CheckoutSessions.
   */
  @optional
  string display_name;

  /**
   * String representing the object's type. Objects of the same type share the same value.
   */
  @optional
  string object;

  /**
   * Specifies whether the rate is considered inclusive of taxes or exclusive of taxes. One of
   * `inclusive`, `exclusive`, or `unspecified`.
   */
  @optional
  string tax_behavior;

  /**
   * The type of calculation to use on the shipping rate. Can only be `fixed_amount` for now.
   */
  @optional
  string type;

  /**
   * Time at which the object was created. Measured in seconds since the Unix epoch.
   */
  @optional
  Nullable!(long) created;

  mixin AddBuilder!(typeof(this));

}

// File automatically generated from OpenAPI spec.
module stripe.model.setup_intent_payment_method_options_card_mandate_options;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;


/**
 */
class SetupIntentPaymentMethodOptionsCardMandateOptions {
  /**
   * Amount to be charged for future payments.
   */
  @optional
  Nullable!(int) amount;

  /**
   * Start date of the mandate or subscription. Start date should not be lesser than yesterday.
   */
  @optional
  Nullable!(long) start_date;

  /**
   * End date of the mandate or subscription. If not provided, the mandate will be active until
   * canceled. If provided, end date should be after start date.
   */
  @optional
  Nullable!(long) end_date;

  /**
   * Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in
   * lowercase. Must be a [supported currency](https://stripe.com/docs/currencies).
   */
  @optional
  string currency;

  /**
   * One of `fixed` or `maximum`. If `fixed`, the `amount` param refers to the exact amount to be
   * charged in future payments. If `maximum`, the amount charged can be up to the value passed
   * for the `amount` param.
   */
  @optional
  string amount_type;

  /**
   * The number of intervals between payments. For example, `interval=month` and
   * `interval_count=3` indicates one payment every three months. Maximum of one year interval
   * allowed (1 year, 12 months, or 52 weeks). This parameter is optional when
   * `interval=sporadic`.
   */
  @optional
  Nullable!(int) interval_count;

  /**
   * Unique identifier for the mandate or subscription.
   */
  @optional
  string reference;

  /**
   * Specifies the type of mandates supported. Possible values are `india`.
   */
  @optional
  string[] supported_types;

  /**
   * A description of the mandate or subscription that is meant to be displayed to the customer.
   */
  @optional
  string description;

  /**
   * Specifies payment frequency. One of `day`, `week`, `month`, `year`, or `sporadic`.
   */
  @optional
  string interval;

}

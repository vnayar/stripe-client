// File automatically generated from OpenAPI spec.
module stripe.model.checkout_acss_debit_mandate_options;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;


/**
 */
class CheckoutAcssDebitMandateOptions {
  /**
   * Description of the interval. Only required if the 'payment_schedule' parameter is 'interval'
   * or 'combined'.
   */
  @optional
  Nullable!(string) interval_description;

  /**
   * A URL for custom mandate text
   */
  @optional
  Nullable!(string) custom_mandate_url;

  /**
   * Transaction type of the mandate.
   */
  @optional
  Nullable!(string) transaction_type;

  /**
   * Payment schedule for the mandate.
   */
  @optional
  Nullable!(string) payment_schedule;

  /**
   * List of Stripe products where this mandate can be selected automatically. Returned when the
   * Session is in `setup` mode.
   */
  @optional
  Nullable!(string)[] default_for;

}

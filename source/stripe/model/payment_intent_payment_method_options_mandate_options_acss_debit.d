// File automatically generated from OpenAPI spec.
module stripe.model.payment_intent_payment_method_options_mandate_options_acss_debit;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;


/**
 */
class PaymentIntentPaymentMethodOptionsMandateOptionsAcssDebit {
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

}

// File automatically generated from OpenAPI spec.
module stripe.model.setup_intent_payment_method_options_mandate_options_acss_debit;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;


/**
 */
class SetupIntentPaymentMethodOptionsMandateOptionsAcssDebit {
  /**
   * Description of the interval. Only required if the 'payment_schedule' parameter is 'interval'
   * or 'combined'.
   */
  @optional
  string interval_description;

  /**
   * A URL for custom mandate text
   */
  @optional
  string custom_mandate_url;

  /**
   * Transaction type of the mandate.
   */
  @optional
  string transaction_type;

  /**
   * Payment schedule for the mandate.
   */
  @optional
  string payment_schedule;

  /**
   * List of Stripe products where this mandate can be selected automatically.
   */
  @optional
  string[] default_for;

}

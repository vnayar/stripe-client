// File automatically generated from OpenAPI spec.
module stripe.model.mandate_acss_debit;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;


/**
 */
class MandateAcssDebit {
  /**
   * Description of the interval. Only required if the 'payment_schedule' parameter is 'interval'
   * or 'combined'.
   */
  @optional
  string interval_description;

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

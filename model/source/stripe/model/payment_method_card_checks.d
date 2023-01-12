// File automatically generated from OpenAPI spec.
module stripe.model.payment_method_card_checks;

import vibe.data.serialization : optional;
import vibe.data.json : Json;
import builder : AddBuilder;

import std.typecons : Nullable;


/**
 */
class PaymentMethodCardChecks {
  /**
   * If a CVC was provided, results of the check, one of `pass`, `fail`, `unavailable`, or
   * `unchecked`.
   */
  @optional
  string cvc_check;

  /**
   * If a address line1 was provided, results of the check, one of `pass`, `fail`, `unavailable`,
   * or `unchecked`.
   */
  @optional
  string address_line1_check;

  /**
   * If a address postal code was provided, results of the check, one of `pass`, `fail`,
   * `unavailable`, or `unchecked`.
   */
  @optional
  string address_postal_code_check;

  mixin AddBuilder!(typeof(this));

}

// File automatically generated from OpenAPI spec.
module stripe.model.payment_method_details_card_checks;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;


/**
 */
class PaymentMethodDetailsCardChecks {
  /**
   * If a CVC was provided, results of the check, one of `pass`, `fail`, `unavailable`, or
   * `unchecked`.
   */
  @optional
  Nullable!(string) cvc_check;

  /**
   * If a address line1 was provided, results of the check, one of `pass`, `fail`, `unavailable`,
   * or `unchecked`.
   */
  @optional
  Nullable!(string) address_line1_check;

  /**
   * If a address postal code was provided, results of the check, one of `pass`, `fail`,
   * `unavailable`, or `unchecked`.
   */
  @optional
  Nullable!(string) address_postal_code_check;

}

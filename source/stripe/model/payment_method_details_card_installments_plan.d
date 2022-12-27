// File automatically generated from OpenAPI spec.
module stripe.model.payment_method_details_card_installments_plan;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;


/**
 */
class PaymentMethodDetailsCardInstallmentsPlan {
  /**
   * Type of installment plan, one of `fixed_count`.
   */
  @optional
  Nullable!(string) type;

  /**
   * For `fixed_count` installment plans, this is the number of installment payments your customer
   * will make to their credit card.
   */
  @optional
  Nullable!(int) count;

  /**
   * For `fixed_count` installment plans, this is the interval between installment payments your
   * customer will make to their credit card.
   * One of `month`.
   */
  @optional
  Nullable!(string) interval;

}

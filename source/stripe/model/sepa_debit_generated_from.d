// File automatically generated from OpenAPI spec.
module stripe.model.sepa_debit_generated_from;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;

import stripe.model.charge : Charge;
import stripe.model.setup_attempt : SetupAttempt;

/**
 */
class SepaDebitGeneratedFrom {
  /**
   * The ID of the SetupAttempt that generated this PaymentMethod, if any.
   */
  @optional
  Json setup_attempt;

  /**
   * The ID of the Charge that generated this PaymentMethod, if any.
   */
  @optional
  Json charge;

}

// File automatically generated from OpenAPI spec.
module stripe.model.payment_intent_next_action_konbini_stores;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;

import stripe.model.payment_intent_next_action_konbini_familymart : PaymentIntentNextActionKonbiniFamilymart;
import stripe.model.payment_intent_next_action_konbini_lawson : PaymentIntentNextActionKonbiniLawson;
import stripe.model.payment_intent_next_action_konbini_ministop : PaymentIntentNextActionKonbiniMinistop;
import stripe.model.payment_intent_next_action_konbini_seicomart : PaymentIntentNextActionKonbiniSeicomart;

/**
 */
class PaymentIntentNextActionKonbiniStores {
  /**
   * Ministop instruction details.
   */
  @optional
  PaymentIntentNextActionKonbiniMinistop ministop;

  /**
   * Lawson instruction details.
   */
  @optional
  PaymentIntentNextActionKonbiniLawson lawson;

  /**
   * Seicomart instruction details.
   */
  @optional
  PaymentIntentNextActionKonbiniSeicomart seicomart;

  /**
   * FamilyMart instruction details.
   */
  @optional
  PaymentIntentNextActionKonbiniFamilymart familymart;

}

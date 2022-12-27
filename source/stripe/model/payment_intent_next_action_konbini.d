// File automatically generated from OpenAPI spec.
module stripe.model.payment_intent_next_action_konbini;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;

import stripe.model.payment_intent_next_action_konbini_stores : PaymentIntentNextActionKonbiniStores;

/**
 */
class PaymentIntentNextActionKonbini {
  @optional
  PaymentIntentNextActionKonbiniStores stores;

  /**
   * The URL for the Konbini payment instructions page, which allows customers to view and print a
   * Konbini voucher.
   */
  @optional
  Nullable!(string) hosted_voucher_url;

  /**
   * The timestamp at which the pending Konbini payment expires.
   */
  @optional
  Nullable!(long) expires_at;

}

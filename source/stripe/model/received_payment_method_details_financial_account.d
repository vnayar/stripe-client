// File automatically generated from OpenAPI spec.
module stripe.model.received_payment_method_details_financial_account;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;


/**
 */
class ReceivedPaymentMethodDetailsFinancialAccount {
  /**
   * The rails the ReceivedCredit was sent over. A FinancialAccount can only send funds over
   * `stripe`.
   */
  @optional
  string network;

  /**
   * The FinancialAccount ID.
   */
  @optional
  string id;

}

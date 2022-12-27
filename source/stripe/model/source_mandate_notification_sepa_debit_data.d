// File automatically generated from OpenAPI spec.
module stripe.model.source_mandate_notification_sepa_debit_data;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;


/**
 */
class SourceMandateNotificationSepaDebitData {
  /**
   * Last 4 digits of the account number associated with the debit.
   */
  @optional
  Nullable!(string) last4;

  /**
   * SEPA creditor ID.
   */
  @optional
  Nullable!(string) creditor_identifier;

  /**
   * Mandate reference associated with the debit.
   */
  @optional
  Nullable!(string) mandate_reference;

}
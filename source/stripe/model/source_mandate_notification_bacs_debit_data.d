// File automatically generated from OpenAPI spec.
module stripe.model.source_mandate_notification_bacs_debit_data;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;


/**
 */
class SourceMandateNotificationBacsDebitData {
  /**
   * Last 4 digits of the account number associated with the debit.
   */
  @optional
  Nullable!(string) last4;

}

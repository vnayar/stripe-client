// File automatically generated from OpenAPI spec.
module stripe.model.source_mandate_notification_acss_debit_data;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;


/**
 */
class SourceMandateNotificationAcssDebitData {
  /**
   * The statement descriptor associate with the debit.
   */
  @optional
  Nullable!(string) statement_descriptor;

}

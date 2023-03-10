// File automatically generated from OpenAPI spec.
module stripe.model.source_mandate_notification_acss_debit_data;

import vibe.data.serialization : optional;
import vibe.data.json : Json;
import builder : AddBuilder;

import std.typecons : Nullable;


/**
 */
class SourceMandateNotificationAcssDebitData {
  /**
   * The statement descriptor associate with the debit.
   */
  @optional
  string statement_descriptor;

  mixin AddBuilder!(typeof(this));

}

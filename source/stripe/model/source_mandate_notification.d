// File automatically generated from OpenAPI spec.
module stripe.model.source_mandate_notification;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;

import stripe.model.source : Source;
import stripe.model.source_mandate_notification_acss_debit_data : SourceMandateNotificationAcssDebitData;
import stripe.model.source_mandate_notification_bacs_debit_data : SourceMandateNotificationBacsDebitData;
import stripe.model.source_mandate_notification_sepa_debit_data : SourceMandateNotificationSepaDebitData;

/**
 * Source mandate notifications should be created when a notification related to
 * a source mandate must be sent to the payer. They will trigger a webhook or
 * deliver an email to the customer.
 */
class SourceMandateNotification {
  /**
   * A positive integer in the smallest currency unit (that is, 100 cents for $1.00, or 1 for ¥1,
   * Japanese Yen being a zero-decimal currency) representing the amount associated with the
   * mandate notification. The amount is expressed in the currency of the underlying source.
   * Required if the notification type is `debit_initiated`.
   */
  @optional
  Nullable!(int) amount;

  /**
   * Unique identifier for the object.
   */
  @optional
  string id;

  /**
   * The reason of the mandate notification. Valid reasons are `mandate_confirmed` or
   * `debit_initiated`.
   */
  @optional
  string reason;

  @optional
  Source source;

  @optional
  SourceMandateNotificationBacsDebitData bacs_debit;

  @optional
  SourceMandateNotificationSepaDebitData sepa_debit;

  /**
   * Has the value `true` if the object exists in live mode or the value `false` if the object
   * exists in test mode.
   */
  @optional
  Nullable!(bool) livemode;

  /**
   * String representing the object's type. Objects of the same type share the same value.
   */
  @optional
  string object;

  /**
   * The type of source this mandate notification is attached to. Should be the source type
   * identifier code for the payment method, such as `three_d_secure`.
   */
  @optional
  string type;

  /**
   * Time at which the object was created. Measured in seconds since the Unix epoch.
   */
  @optional
  Nullable!(long) created;

  @optional
  SourceMandateNotificationAcssDebitData acss_debit;

  /**
   * The status of the mandate notification. Valid statuses are `pending` or `submitted`.
   */
  @optional
  string status;

}

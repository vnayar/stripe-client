// File automatically generated from OpenAPI spec.
module stripe.model.invoices_status_transitions;

import vibe.data.serialization : optional;
import vibe.data.json : Json;
import builder : AddBuilder;

import std.typecons : Nullable;


/**
 */
class InvoicesStatusTransitions {
  /**
   * The time that the invoice was marked uncollectible.
   */
  @optional
  Nullable!(long) marked_uncollectible_at;

  /**
   * The time that the invoice draft was finalized.
   */
  @optional
  Nullable!(long) finalized_at;

  /**
   * The time that the invoice was paid.
   */
  @optional
  Nullable!(long) paid_at;

  /**
   * The time that the invoice was voided.
   */
  @optional
  Nullable!(long) voided_at;

  mixin AddBuilder!(typeof(this));

}

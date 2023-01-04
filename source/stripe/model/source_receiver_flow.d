// File automatically generated from OpenAPI spec.
module stripe.model.source_receiver_flow;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;


/**
 */
class SourceReceiverFlow {
  /**
   * Type of refund attribute method, one of `email`, `manual`, or `none`.
   */
  @optional
  string refund_attributes_method;

  /**
   * The total amount received by the receiver source. `amount_received = amount_returned +
   * amount_charged` should be true for consumed sources unless customers deposit excess funds.
   * The amount received is expressed in the source's currency.
   */
  @optional
  Nullable!(int) amount_received;

  /**
   * The address of the receiver source. This is the value that should be communicated to the
   * customer to send their funds to.
   */
  @optional
  string address;

  /**
   * The total amount that was moved to your balance. This is almost always equal to the amount
   * charged. In rare cases when customers deposit excess funds and we are unable to refund those,
   * those funds get moved to your balance and show up in amount_charged as well. The amount
   * charged is expressed in the source's currency.
   */
  @optional
  Nullable!(int) amount_charged;

  /**
   * The total amount that was returned to the customer. The amount returned is expressed in the
   * source's currency.
   */
  @optional
  Nullable!(int) amount_returned;

  /**
   * Type of refund attribute status, one of `missing`, `requested`, or `available`.
   */
  @optional
  string refund_attributes_status;

}

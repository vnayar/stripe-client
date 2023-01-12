// File automatically generated from OpenAPI spec.
module stripe.model.payment_links_resource_transfer_data;

import vibe.data.serialization : optional;
import vibe.data.json : Json;
import builder : AddBuilder;

import std.typecons : Nullable;

import stripe.model.account : Account;

/**
 */
class PaymentLinksResourceTransferData {
  /**
   * The amount in %s that will be transferred to the destination account. By default, the entire
   * amount is transferred to the destination.
   */
  @optional
  Nullable!(int) amount;

  /**
   * The connected account receiving the transfer.
   */
  @optional
  Json destination;

  mixin AddBuilder!(typeof(this));

}

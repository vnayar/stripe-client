// File automatically generated from OpenAPI spec.
module stripe.model.issuing_card_shipping;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;

import stripe.model.address : Address;
import stripe.model.issuing_card_shipping_customs : IssuingCardShippingCustoms;

/**
 */
class IssuingCardShipping {
  /**
   * Additional information that may be required for clearing customs.
   */
  @optional
  IssuingCardShippingCustoms customs;

  /**
   * Shipment service, such as `standard` or `express`.
   */
  @optional
  string service;

  /**
   * Whether a signature is required for card delivery. This feature is only supported for US
   * users. Standard shipping service does not support signature on delivery. The default value
   * for standard shipping service is false and for express and priority services is true.
   */
  @optional
  Nullable!(bool) require_signature;

  /**
   * The delivery company that shipped a card.
   */
  @optional
  string carrier;

  /**
   * Recipient name.
   */
  @optional
  string name;

  @optional
  Address address;

  /**
   * Packaging options.
   */
  @optional
  string type;

  /**
   * The phone number of the receiver of the bulk shipment. This phone number will be provided to
   * the shipping company, who might use it to contact the receiver in case of delivery issues.
   */
  @optional
  string phone_number;

  /**
   * A link to the shipping carrier's site where you can view detailed information about a card
   * shipment.
   */
  @optional
  string tracking_url;

  /**
   * A unix timestamp representing a best estimate of when the card will be delivered.
   */
  @optional
  Nullable!(long) eta;

  /**
   * A tracking number for a card shipment.
   */
  @optional
  string tracking_number;

  /**
   * The delivery status of the card.
   */
  @optional
  string status;

}

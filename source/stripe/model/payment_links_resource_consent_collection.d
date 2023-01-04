// File automatically generated from OpenAPI spec.
module stripe.model.payment_links_resource_consent_collection;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;


/**
 */
class PaymentLinksResourceConsentCollection {
  /**
   * If set to `required`, it requires cutomers to accept the terms of service before being able
   * to pay. If set to `none`, customers won't be shown a checkbox to accept the terms of service.
   */
  @optional
  string terms_of_service;

  /**
   * If set to `auto`, enables the collection of customer consent for promotional communications.
   */
  @optional
  string promotions;

}

// File automatically generated from OpenAPI spec.
module stripe.model.account_card_issuing_settings;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;

import stripe.model.card_issuing_account_terms_of_service : CardIssuingAccountTermsOfService;

/**
 */
class AccountCardIssuingSettings {
  @optional
  CardIssuingAccountTermsOfService tos_acceptance;

}

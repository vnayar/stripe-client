// File automatically generated from OpenAPI spec.
module stripe.model.account_treasury_settings;

import vibe.data.serialization : optional;
import vibe.data.json : Json;
import builder : AddBuilder;

import std.typecons : Nullable;

import stripe.model.account_terms_of_service : AccountTermsOfService;

/**
 */
class AccountTreasurySettings {
  @optional
  AccountTermsOfService tos_acceptance;

  mixin AddBuilder!(typeof(this));

}

// File automatically generated from OpenAPI spec.
module stripe.model.external_account;

import vibe.data.serialization : optional;
import vibe.data.json : Json;
import builder : AddBuilder;

import std.typecons : Nullable;

import stripe.model.bank_account : BankAccount;
import stripe.model.card : Card;

/**
 */
class ExternalAccount {
  mixin AddBuilder!(typeof(this));

}

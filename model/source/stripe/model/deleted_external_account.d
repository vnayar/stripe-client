// File automatically generated from OpenAPI spec.
module stripe.model.deleted_external_account;

import vibe.data.serialization : optional;
import vibe.data.json : Json;
import builder : AddBuilder;

import std.typecons : Nullable;

import stripe.model.deleted_bank_account : DeletedBankAccount;
import stripe.model.deleted_card : DeletedCard;

/**
 */
class DeletedExternalAccount {
  mixin AddBuilder!(typeof(this));

}

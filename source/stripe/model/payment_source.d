// File automatically generated from OpenAPI spec.
module stripe.model.payment_source;

import vibe.data.serialization : optional;
import vibe.data.json : Json;
import builder : AddBuilder;

import std.typecons : Nullable;

import stripe.model.account : Account;
import stripe.model.bank_account : BankAccount;
import stripe.model.card : Card;
import stripe.model.source : Source;

/**
 */
class PaymentSource {
  mixin AddBuilder!(typeof(this));

}

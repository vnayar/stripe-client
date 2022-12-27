// File automatically generated from OpenAPI spec.
module stripe.model.treasury_shared_resource_initiating_payment_method_details_us_bank_account;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;


/**
 */
class TreasurySharedResourceInitiatingPaymentMethodDetailsUsBankAccount {
  /**
   * The last four digits of the bank account number.
   */
  @optional
  Nullable!(string) last4;

  /**
   * Bank name.
   */
  @optional
  Nullable!(string) bank_name;

  /**
   * The routing number for the bank account.
   */
  @optional
  Nullable!(string) routing_number;

}
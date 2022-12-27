// File automatically generated from OpenAPI spec.
module stripe.model.payment_method_details_giropay;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;


/**
 */
class PaymentMethodDetailsGiropay {
  /**
   * Bank Identifier Code of the bank associated with the bank account.
   */
  @optional
  Nullable!(string) bic;

  /**
   * Name of the bank associated with the bank account.
   */
  @optional
  Nullable!(string) bank_name;

  /**
   * Owner's verified full name. Values are verified or provided by Giropay directly
   * (if supported) at the time of authorization or settlement. They cannot be set or mutated.
   * Giropay rarely provides this information so the attribute is usually empty.
   */
  @optional
  Nullable!(string) verified_name;

  /**
   * Bank code of bank associated with the bank account.
   */
  @optional
  Nullable!(string) bank_code;

}

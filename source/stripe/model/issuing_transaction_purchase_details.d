// File automatically generated from OpenAPI spec.
module stripe.model.issuing_transaction_purchase_details;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;

import stripe.model.issuing_transaction_flight_data : IssuingTransactionFlightData;
import stripe.model.issuing_transaction_fuel_data : IssuingTransactionFuelData;
import stripe.model.issuing_transaction_lodging_data : IssuingTransactionLodgingData;
import stripe.model.issuing_transaction_receipt_data : IssuingTransactionReceiptData;

/**
 */
class IssuingTransactionPurchaseDetails {
  /**
   * Information about fuel that was purchased with this transaction.
   */
  @optional
  IssuingTransactionFuelData fuel;

  /**
   * The line items in the purchase.
   */
  @optional
  IssuingTransactionReceiptData[] receipt;

  /**
   * Information about the flight that was purchased with this transaction.
   */
  @optional
  IssuingTransactionFlightData flight;

  /**
   * A merchant-specific order number.
   */
  @optional
  string reference;

  /**
   * Information about lodging that was purchased with this transaction.
   */
  @optional
  IssuingTransactionLodgingData lodging;

}

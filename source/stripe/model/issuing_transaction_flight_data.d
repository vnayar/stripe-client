// File automatically generated from OpenAPI spec.
module stripe.model.issuing_transaction_flight_data;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;

import stripe.model.issuing_transaction_flight_data_leg : IssuingTransactionFlightDataLeg;

/**
 */
class IssuingTransactionFlightData {
  /**
   * The name of the passenger.
   */
  @optional
  string passenger_name;

  /**
   * The time that the flight departed.
   */
  @optional
  Nullable!(int) departure_at;

  /**
   * The travel agency that issued the ticket.
   */
  @optional
  string travel_agency;

  /**
   * Whether the ticket is refundable.
   */
  @optional
  Nullable!(bool) refundable;

  /**
   * The legs of the trip.
   */
  @optional
  IssuingTransactionFlightDataLeg[] segments;

}

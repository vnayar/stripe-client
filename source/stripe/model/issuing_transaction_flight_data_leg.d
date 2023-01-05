// File automatically generated from OpenAPI spec.
module stripe.model.issuing_transaction_flight_data_leg;

import vibe.data.serialization : optional;
import vibe.data.json : Json;
import builder : AddBuilder;

import std.typecons : Nullable;


/**
 */
class IssuingTransactionFlightDataLeg {
  /**
   * The flight's service class.
   */
  @optional
  string service_class;

  /**
   * The airline carrier code.
   */
  @optional
  string carrier;

  /**
   * The three-letter IATA airport code that the flight departed from.
   */
  @optional
  string departure_airport_code;

  /**
   * The three-letter IATA airport code of the flight's destination.
   */
  @optional
  string arrival_airport_code;

  /**
   * Whether a stopover is allowed on this flight.
   */
  @optional
  Nullable!(bool) stopover_allowed;

  /**
   * The flight number.
   */
  @optional
  string flight_number;

  mixin AddBuilder!(typeof(this));

}

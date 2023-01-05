// File automatically generated from OpenAPI spec.
module stripe.model.issuing_authorization_network_data;

import vibe.data.serialization : optional;
import vibe.data.json : Json;
import builder : AddBuilder;

import std.typecons : Nullable;


/**
 */
class IssuingAuthorizationNetworkData {
  /**
   * Identifier assigned to the acquirer by the card network. Sometimes this value is not provided
   * by the network; in this case, the value will be `null`.
   */
  @optional
  string acquiring_institution_id;

  mixin AddBuilder!(typeof(this));

}

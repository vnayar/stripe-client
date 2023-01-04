// File automatically generated from OpenAPI spec.
module stripe.model.portal_business_profile;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;


/**
 */
class PortalBusinessProfile {
  /**
   * A link to the business’s publicly available terms of service.
   */
  @optional
  string terms_of_service_url;

  /**
   * A link to the business’s publicly available privacy policy.
   */
  @optional
  string privacy_policy_url;

  /**
   * The messaging shown to customers in the portal.
   */
  @optional
  string headline;

}

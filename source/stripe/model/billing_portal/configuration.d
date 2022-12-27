// File automatically generated from OpenAPI spec.
module stripe.model.billing_portal.configuration;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;

import stripe.model.application : Application;
import stripe.model.deleted_application : DeletedApplication;
import stripe.model.portal_business_profile : PortalBusinessProfile;
import stripe.model.portal_features : PortalFeatures;
import stripe.model.portal_login_page : PortalLoginPage;

/**
 * A portal configuration describes the functionality and behavior of a portal session.
 */
class BillingPortalConfiguration {
  @optional
  PortalFeatures features;

  /**
   * Unique identifier for the object.
   */
  @optional
  Nullable!(string) id;

  /**
   * Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an
   * object. This can be useful for storing additional information about the object in a
   * structured format.
   */
  @optional
  Nullable!(string)[string] metadata;

  @optional
  PortalBusinessProfile business_profile;

  /**
   * Whether the configuration is the default. If `true`, this configuration can be managed in the
   * Dashboard and portal sessions will use this configuration unless it is overriden when
   * creating the session.
   */
  @optional
  Nullable!(bool) is_default;

  @optional
  PortalLoginPage login_page;

  /**
   * ID of the Connect Application that created the configuration.
   */
  @optional
  Json application;

  /**
   * Whether the configuration is active and can be used to create portal sessions.
   */
  @optional
  Nullable!(bool) active;

  /**
   * Has the value `true` if the object exists in live mode or the value `false` if the object
   * exists in test mode.
   */
  @optional
  Nullable!(bool) livemode;

  /**
   * String representing the object's type. Objects of the same type share the same value.
   */
  @optional
  Nullable!(string) object;

  /**
   * Time at which the object was last updated. Measured in seconds since the Unix epoch.
   */
  @optional
  Nullable!(long) updated;

  /**
   * Time at which the object was created. Measured in seconds since the Unix epoch.
   */
  @optional
  Nullable!(long) created;

  /**
   * The default URL to redirect customers to when they click on the portal's link to return to
   * your website. This can be
   * [overriden](https://stripe.com/docs/api/customer_portal/sessions/create#create_portal_session
   * -return_url) when creating the session.
   */
  @optional
  Nullable!(string) default_return_url;

}

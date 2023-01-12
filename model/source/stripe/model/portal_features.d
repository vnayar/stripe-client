// File automatically generated from OpenAPI spec.
module stripe.model.portal_features;

import vibe.data.serialization : optional;
import vibe.data.json : Json;
import builder : AddBuilder;

import std.typecons : Nullable;

import stripe.model.portal_customer_update : PortalCustomerUpdate;
import stripe.model.portal_invoice_list : PortalInvoiceList;
import stripe.model.portal_payment_method_update : PortalPaymentMethodUpdate;
import stripe.model.portal_subscription_cancel : PortalSubscriptionCancel;
import stripe.model.portal_subscription_pause : PortalSubscriptionPause;
import stripe.model.portal_subscription_update : PortalSubscriptionUpdate;

/**
 */
class PortalFeatures {
  @optional
  PortalCustomerUpdate customer_update;

  @optional
  PortalSubscriptionUpdate subscription_update;

  @optional
  PortalInvoiceList invoice_history;

  @optional
  PortalPaymentMethodUpdate payment_method_update;

  @optional
  PortalSubscriptionCancel subscription_cancel;

  @optional
  PortalSubscriptionPause subscription_pause;

  mixin AddBuilder!(typeof(this));

}

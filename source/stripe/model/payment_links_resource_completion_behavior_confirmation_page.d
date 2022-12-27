// File automatically generated from OpenAPI spec.
module stripe.model.payment_links_resource_completion_behavior_confirmation_page;

import vibe.data.serialization : optional;
import vibe.data.json : Json;

import std.typecons : Nullable;


/**
 */
class PaymentLinksResourceCompletionBehaviorConfirmationPage {
  /**
   * The custom message that is displayed to the customer after the purchase is complete.
   */
  @optional
  Nullable!(string) custom_message;

}

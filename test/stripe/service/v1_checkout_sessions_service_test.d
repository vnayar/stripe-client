module stripe.service.v1_checkout_sessions_service_test;

import vibe.core.log : setLogLevel, LogLevel;

import std.algorithm : startsWith;

import stripe.servers : Servers;
import stripe.security : Security;
import stripe.service.v1_checkout_sessions_service
    : V1CheckoutSessionsService, CheckoutSession, Error_;

static this() {
  // Configure the client servers to use a locally running stripe-mock.
  Servers.serverUrl = "http://localhost:12111/";
  setLogLevel(LogLevel.debug_);
  Security.configureBasicAuth("sk_test_...Nqvri", "");
}

unittest {
  //Security.configureBasicAuth("sk_test_...Nqvri", "");
  import std.stdio;
  writeln("v1_checkout_sessions_service_test 0:");
  auto checkoutService = new V1CheckoutSessionsService();
  auto checkoutBody = new V1CheckoutSessionsService.PostCheckoutSessionsBody();
  auto lineItemParams = new V1CheckoutSessionsService.PostCheckoutSessionsBody.LineItemParams();
  lineItemParams.price = "ham-sandwiches";
  lineItemParams.quantity = 1;
  checkoutBody.line_items ~= lineItemParams;
  checkoutBody.mode = "subscription";
  checkoutBody.success_url = "https://localhost:8082/web/checkout/success?session_id={CHECKOUT_SESSION_ID}";
  checkoutBody.cancel_url = "https://localhost:8082/web/checkout/cancel";
  writeln("v1_checkout_sessions_service_test 1:");
  auto checkoutHandler = new V1CheckoutSessionsService.PostCheckoutSessionsResponseHandler();
  bool success = false;
  checkoutHandler.handleResponse200 = (CheckoutSession checkoutSession) {
    // import std.stdio;
    // import vibe.data.json : serializeToJson;
    // writeln("checkoutSession = ", serializeToJson(checkoutSession));
    assert(startsWith(checkoutSession.id, "cs_test_"));
    assert(checkoutSession.mode == "subscription");
    success = true;
  };
  checkoutHandler.handleResponsedefault = (Error_ error) {
    import std.stdio;
    import vibe.data.json : serializeToJson;
    writeln("Got Error: ", serializeToJson(error));
    assert(false);
  };
  writeln("v1_checkout_sessions_service_test 2:");
  checkoutService.postCheckoutSessions(checkoutBody, checkoutHandler);
  writeln("v1_checkout_sessions_service_test 3:");
  assert(success);
}

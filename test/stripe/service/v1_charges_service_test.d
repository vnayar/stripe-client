module stripe.service.v1_charges_service_test;

import stripe.servers : Servers;
import stripe.security : Security;
import stripe.service.v1_charges_service : V1ChargesService, Error_;
import vibe.data.json : serializeToJson;
import vibe.core.log : setLogLevel, LogLevel;
import std.stdio;

static this() {
  // Configure the client servers to use a locally running stripe-mock.
  Servers.serverUrl = "http://localhost:12111/";
  setLogLevel(LogLevel.debug_);
  Security.configureBasicAuth("sk_test_...Nqvri", "");
}

///
unittest {
  //Security.configureBasicAuth("sk_test_...Nqvri", "");
  auto service = new V1ChargesService();
  auto handler = new V1ChargesService.GetChargesResponseHandler();
  handler.handleResponse200 = (V1ChargesService.GetChargesResponseHandler.ChargeList chargeList) {
    writeln(serializeToJson(chargeList));
  };
  handler.handleResponseDefault = (Error_ error) {
    import std.stdio;
    writeln("Got Error: ", serializeToJson(error));
    assert(false);
  };

  service.getCharges(new V1ChargesService.GetChargesParams(), handler);
}

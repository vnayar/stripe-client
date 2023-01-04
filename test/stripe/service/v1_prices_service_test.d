module stripe.service.v1_prices_service_test;

import vibe.core.log : setLogLevel, LogLevel;

import std.typecons : nullable;

import stripe.servers : Servers;
import stripe.security : Security;
import stripe.service.v1_prices_service : V1PricesService, Error_;

static this() {
  // Configure the client servers to use a locally running stripe-mock.
  Servers.serverUrl = "http://localhost:12111/";
  setLogLevel(LogLevel.debug_);
  Security.configureBasicAuth("sk_test_...Nqvri", "");
}

unittest {
  //Security.configureBasicAuth("sk_test_...Nqvri", "");
  import std.stdio;
  writeln("v1_prices_service_test 0:");
  auto service = new V1PricesService();
  auto params = new V1PricesService.GetPricesParams();
  params.lookup_keys = ["ham-sandwich"];
  bool success = false;
  writeln("v1_prices_service_test 1:");
  auto handler = new V1PricesService.GetPricesResponseHandler();
  handler.handleResponse200 = (V1PricesService.GetPricesResponseHandler.PriceList priceList) {
    //import vibe.data.json : serializeToJson;
    //import std.stdio;
    //writeln("Got PriceList: ", serializeToJson(priceList));
    assert(priceList.data[0].object == "price");
    assert(priceList.data[0].unit_amount == 2000);
    assert(priceList.data[0].recurring.interval_count == 1);
    success = true;
  };
  handler.handleResponsedefault = (Error_ error) {
    assert(false);
  };
  writeln("v1_prices_service_test 2:");
  service.getPrices(params, handler);
  writeln("v1_prices_service_test 3:");
  assert(success);
}

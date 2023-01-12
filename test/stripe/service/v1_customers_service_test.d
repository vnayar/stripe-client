module stripe.service.v1_customers_service_test;

import vibe.core.log : setLogLevel, LogLevel;

import std.typecons : nullable;

import stripe.servers : Servers;
import stripe.security : Security;
import stripe.service.v1_customers_service : V1CustomersService, Customer, Error_;

static this() {
  // Configure the client servers to use a locally running stripe-mock.
  Servers.serverUrl = "http://localhost:12111/";
  setLogLevel(LogLevel.debug_);
  Security.configureBasicAuth("sk_test_...Nqvri", "");
}

unittest {
  auto success = false;
  auto service = new V1CustomersService();
  service.postCustomersCustomer(
      V1CustomersService.PostCustomersCustomerParams.builder()
          .customer("bob")
          .build(),
      V1CustomersService.PostCustomersCustomerBody.builder()
          .email("bob@fishface.com")
          .name("Bob Bobbington")
          .description("The bobbest Bob of all Bobtown.")
          .build(),
      V1CustomersService.PostCustomersCustomerResponseHandler.builder()
          .handleResponse200((Customer customer) {
            assert(customer.email == "bob@fishface.com");
            success = true;
          })
          .handleResponseDefault((Error_ error) {
            import vibe.data.json : serializeToJson;
            import std.stdio;
            writeln("Error: ", serializeToJson(error));
            assert(false);
          })
          .build());
  assert(success);
}

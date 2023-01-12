# Stripe API Client

A web client for interfacing with Stripes REST API. This client consists of files that have been
generated automatically from Stripe's [OpenAPI Specification](https://github.com/stripe/openapi)
using the generation tool [openapi-client](https://code.dlang.org/packages/openapi-client).

This library uses [Vibe.d](https://vibed.org/) for JSON serialization/deserialization and HTTP
client logic.

## Client Code Organization

- **stripe.model** :: The package `stripe.model` contains commonly used data types for the Stripe
  API, which are generated from the `#/components/schemas/` portion of the Stripe OpenAPI
  Specification.
- **stripe.service** :: The package `stripe.service` contains client logic to communicate with REST
  API endpoints. Generally, the module and class names are produced by concatenating the URL path
  fragments, e.g. `/v1/charges` => `v1_charges_service.d` => `class V1ChargesService`.
- **stripe.security** :: Credentials needed to securely access an API, such as API tokens,
  usernames, and passwords are configured using this module.

## Using the Stripe Client

Below is an example of how to use the Stripe Client:

```d
import stripe.security : Security;
import stripe.service.v1_charges_service : V1ChargesService;
import vibe.data.json : serializeToJsonString;

// 1. Stripe's OpenAPI specification has two valid security schemes:
//   - HTTP Basic Auth (named "BasicAuth")
//   - HTTP Bearer Auth (named "BearerAuth")
Security.configureBasicAuth(
    "sk_test_51MFbD...vri",  // Username / API key
    "");                     // With Stripe, the password is always blank.

// 2. Service classes are created from valid URL paths + "Service", e.g. "/v1/charges" => "V1ChargesService".
auto service = new V1ChargesService();

// 3. Each endpoint has a "Params" object which covers any path, query-string, header, or cookie parameters.
auto params = new V1ChargesService.GetChargesParams();

// 4. Some requests have a request body, which will be an argument to the method,
// e.g. "postCharges(params, requestBody, handler)".

// 5. Different HTTP status codes can be associated with different data types.
// Create a handler object and add your own delegates that say what to do with each response.
auto handler = new V1ChargesService.GetChargesResponseHandler();

// 6. This handler is for a successful 200 response, there's also a default handler for errors.
handler.handleResponse200 = (V1ChargesService.GetChargesResponseHandler.ChargeList chargeList) {
  // Simply print out our response in JSON format.
  writeln(serializeToJsonString(chargeList));
};

// 7. Now call the desired endpoint and your handler will be invoked depending on the response.
service.getCharges(params, handler);
```

Using the numbers in the comments in the example above, we can see the following:
1. Stripe requires an authenticated API Token before it can be used. Learn more about signing up for
   an account and authentication with an API token here: https://stripe.com/docs/api/authentication
2. Service names are derived from the URL path of the endpoint it corresponds to. Many endpoints can
   be grouped into a single service, provided that they share the same prefix, e.g. `/v1/events` and
   `/v1/events/{id}`.
3. "Parameters" are shared among all methods that have the same path, e.g. `GET /v1/events` and
   `POST /v1/events`. They include path-parameters, querystring-parameters, header-parameters, and
   cookie-parameters.
4. An HTTP Request Body is typically only sent with `POST` and `PUT` requests, and if one exists, it
   will be provided as an argument to a service method.
5. The Stripe API may have different response types that are associated with different HTTP status
   codes, e.g. a 200 OK response might contain card data, but a 404 NOT FOUND response might contain
   an error description. In the ResponseHandler, you specify how to handle each type of response.
6. Here we provide a delegate that specifies what should be done when the response is a 200
   OK. We're given a `ChargeList`, which was deserialized from the response body. Different fields
   of the handler class indicate what other responses may be returned.
7. When making an actual request, it can have parameters, a request body, and a handler for the
   response.

## Development

### Environment

In order the build this library, the following dependencies are needed in addition to a D compiler:
- [Docker](https://www.docker.com/): Used to run a mock stripe server during testing.

### Testing

Removed from the normal "unittest" configuration profile used during compilation of non-release
builds, is a separate configuration that can be used for integration tests. The integration tests
set an artificial Stripe API key and interact with a
[Stipe-Mock](https://github.com/stripe/stripe-mock) server.

To execute these integration tests, run the command:

```
dub test --config=integration
```

### Regenerating the Client Code from the OpenAPI Specification

The OpenAPI specification is downloaded and saved into `json/spec3.json`. This file is selected and
used with the `openapi-client` program to regenerate the source code residing under `source/stripe`.

To regenerate this code, run the command:

```
dub build --config=generate
```

### Performance Testing

The `openapi-client` can be invoked manually and passed through the tool
[Valgrind](https://valgrind.org/) in order to assess its performance.

Invoke Valgrind to inspect function calls with the command:

```
valgrind --tool=callgrind --collect-jumps=yes --callgrind-out-file=callgrind_out \
  ../openapi-client/target/openapi-client -- --targetDir=source --openApiSpec=json/spec3.json --packageRoot=stripe
```

Demangle the symbols so that they are more human readable using the command:

```
ddemangle callgrind_out > callgrind_out.demangle
```

Finally, the demangled output can be viewed using the tool
[kcachegrind](https://kcachegrind.sourceforge.net/html/Home.html).

```
kcachegrind callgrind_out.demangle
```

At the time of writing (2023-01-12), approximately 65% of the time is spent parsing the JSON itself,
while only 9% of the time is spent writing the source code files.

## Future Features

1. Greatly expand integration test coverage for many more useful endpoints.

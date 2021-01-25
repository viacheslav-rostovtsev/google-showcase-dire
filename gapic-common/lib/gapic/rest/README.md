The GRPC and REST structure a different because GRPC library has client and service stubs and generates some intermediate service code that ::Gapic wraps.

here how it goes for GRPC:

Entrypoint is a client at `ServiceName::Client`.
Client calls into `::Gapic::ServiceStub` that wraps the calls into a `::Gapic::ServiceStub::RpcCall` and calls into a GRPC-generated `ServiceName::Stub`
GRPC-generated `ServiceName::Stub` ultimately calls to `::GRPC::ClientStub` to make actual calls.

for REST we don't have a GRPC-generated layer to wrap, so the structure is slightly simpler:

Entrypoint is a client at `ServiceName::Rest::Client`.
client has-a `ServiceName::Rest::ServiceStub` that wraps the calls in a `::Gapic::Rest::Call` and calls to `::Gapic::Rest::ClientStub` to make actual calls.

For this specific part, it made sense to break the symmetry because generating an additional abstraction 
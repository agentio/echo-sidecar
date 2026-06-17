all:	rpc
	go install ./...

clean:
	go clean
	rm -rf genproto

test:
	go test ./... -v

APIS=$(shell find proto/echo -name "*.proto")

descriptor:
	protoc ${APIS} \
	--proto_path='proto' \
	--include_imports \
	--descriptor_set_out=descriptor.pb

rpc:
	go install google.golang.org/protobuf/cmd/protoc-gen-go@latest
	mkdir -p genproto
	protoc ${APIS} \
	--proto_path='proto' \
	--go_opt='module=github.com/agentio/echo-sidecar/genproto' \
        --go_opt=Mecho/v1/echo.proto=github.com/agentio/echo-sidecar/genproto/echopb \
	--go_out='genproto'

lint:
	golangci-lint run

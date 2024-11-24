.PHONY: gen-demo-proto
gen-demo-proto:
	@cd demo/demo_proto && cwgo server -I ../../idl --type RPC --module github.com/cloudwego/biz-demo/gomall/demo/demo_proto --service demo_proto --idl ../../idl/echo.proto

.PHONY: gen-demo-thrift
gen-demo-thrift:
	@cd demo/demo_thrift && cwgo server -I ../../idl --type RPC --module github.com/cloudwego/biz-demo/gomall/demo/demo_thrift --service demo_thrift --idl ../../idl/echo.thrift

.PHONY: demo-link-fix
demo-link-fix:
	@cd demo/demo_proto && golangci-lint run -E gofumpt --path-prefix=. --fix --timeout=5m

.PHONY: gen-frontend
gen-frontend:
	@cd app/frontend && cwgo server --type HTTP --I ../../idl --service frontend --module github.com/cloudwego/biz-demo/gomall/app/frontend --idl ../../idl/frontend/auth_page.proto

.PHONY: gen-server
gen-server:
	@cd app/user && cwgo server --type RPC --I ../../idl --service user --module github.com/cloudwego/biz-demo/gomall/app/user --idl ../../idl/user.proto --pass "-use github.com/cloudwego/biz-demo/gomall/rpc_gen/kitex_gen"

.PHONY: gen-client
gen-client:
	@cd rpc_gen && cwgo client --type RPC --I ../idl --service user --module github.com/cloudwego/biz-demo/gomall/app/rpc_gen --idl ../idl/user.proto
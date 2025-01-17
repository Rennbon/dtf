# dev env https://www.dtm.pub/other/develop.html
all: fmt lint test_all cover_test
.PHONY: all

fmt:
	@gofmt -s -w ./

lint:
	@golangci-lint run

.PHONY: test
test:
	@go test ./...

test_all:
	TEST_STORE=redis go test ./...
	TEST_STORE=boltdb go test ./...
	TEST_STORE=mysql go test ./...
	TEST_STORE=postgres go test ./...

cover_test:
	./helper/test-cover.sh


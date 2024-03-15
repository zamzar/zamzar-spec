.PHONY: clean build test bump

clean:
	@docker stop zamzar-spec || true
	@docker rm zamzar-spec || true
	@docker rmi zamzar-spec || true

build:
	@docker buildx build --load --progress=plain -t zamzar-spec .

test: build
	@docker stop zamzar-spec-test 2> /dev/null || true
	@docker rm zamzar-spec-test 2> /dev/null || true
	@docker run --rm --name zamzar-spec-test zamzar-spec

bump:
ifndef VERSION
	$(error VERSION is not set)
endif
	@yq eval '.info.version = "$(VERSION)"' -i openapi/spec.yaml

.PHONY: static-tests unit-tests integration-tests e2e-tests init

# OS can be "Linux" or "macOS"
OS ?= Linux
# ARCH can be "x86_64" or "arm64"
ARCH ?= x86_64

TERRAFORM_VERSION := 1.0.10
TFLINT_VERSION := 0.33.1


SHELL := /usr/bin/env bash

static-tests: setup-env
	rm .terraform.lock.hcl plan.out plan.out.json 2> /dev/null || true
    # should not require any aws credentials to test against, should be safe to run as github checks on pull requests
	terraform init || ( echo 'FAILED: terraform init failed'; exit 1 )
	terraform validate || ( echo 'FAILED: terraform validate failed'; exit 1 )
	terraform fmt -check -recursive ./ || ( echo 'FAILED: all tf files should be formatted using "terraform fmt -recursive ./"'; exit 1 )
	tflint --init && tflint --var='region=us-west-1' --var='profile=default' ./ || ( echo 'FAILED: tflint found issues'; exit 1 )

unit-tests: setup-env
	# Should test code paths in an individual module. terratest, or `terraform test`, this is where you want to test different regions, use retries to smooth transient errors
	# Should not run automatically on PR's from un-trusted contributors
	export PATH=$(shell pwd)/build/bin:$${PATH} &&\
	cd test && \
	go test -timeout 30m -json | tee >(go-test-report) | jq -jr .Output 2> /dev/null | sed 's/null//g';\
	retval_bash="$${PIPESTATUS[0]}" retval_zsh="$${pipestatus[1]}" ;\
	exit $$retval_bash $$retval_zsh

integration-tests:
    # Should test code paths in a module of modules and run when on eof the sub-modules is updated. terratest, or `terraform test` use retries to smooth transient errors
	# Should not run automatically on PR's from un-trusted contributors, and should only be run on modules where one sub-module is changed
	echo "todo"
	exit 1

e2e-tests:
    # Should test code paths in `deploy/` module. Unsure whether it should use tf cloud. terratest, or `terraform test`.
    # For deploys that take long you could skip destroy between runs, so e2e is just updating what changed from last iteration, use retries to smooth transient errors.
	# Should not run automatically on PR's from any contributors. Update(no destroy) tests run on `/do-e2e-tests` PR comment from maintainers. Full e2e run on release.
	echo "todo"
	exit 1

setup-env:
    # using a bin path specific to this project so that different projects can use different versions of the tooling
	mkdir -p build/bin/ &&\
		export PATH=$(shell pwd)/build/bin:$${PATH} &&\
		export TF_ARCH=$(shell echo $(ARCH) | sed 's/x86_64/amd64/') &&\
		export TF_OS=$(shell echo $(OS) | tr '[:upper:]' '[:lower:]' | sed 's/macos/darwin/') &&\
		export CT_OS=$(shell echo $(OS) | sed 's/macOS/Darwin/') &&\
		if [ "$$(terraform -v  | head -n 1 | sed 's/Terraform v//')" != "$(TERRAFORM_VERSION)" ]; then \
			wget -O tf.zip https://releases.hashicorp.com/terraform/$(TERRAFORM_VERSION)/terraform_$(TERRAFORM_VERSION)_$${TF_OS}_$${TF_ARCH}.zip &&\
			unzip -o tf.zip terraform &&\
			rm tf.zip &&\
			mv -fv terraform build/bin/ ;\
		fi ;\
		if [ "$$(tflint --version  | head -n 1 | sed 's/TFLint version //')" != "$(TFLINT_VERSION)" ]; then \
			wget -O tflint.zip https://github.com/terraform-linters/tflint/releases/download/v$(TFLINT_VERSION)/tflint_$${TF_OS}_$${TF_ARCH}.zip &&\
			unzip -o tflint.zip tflint &&\
			rm tflint.zip &&\
			mv -fv tflint build/bin/ ;\
		fi

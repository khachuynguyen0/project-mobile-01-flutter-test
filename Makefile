.PHONY: help test test-unit test-widget test-integration clean format analyze get build

help: ## Show this help message
	@echo 'Usage: make [target]'
	@echo ''
	@echo 'Available targets:'
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "  %-20s %s\n", $$1, $$2}' $(MAKEFILE_LIST)

get: ## Install dependencies
	flutter pub get

clean: ## Clean build artifacts
	flutter clean

format: ## Format code
	dart format .

analyze: ## Run static analysis
	flutter analyze

test: ## Run all tests
	flutter test

test-unit: ## Run only unit tests
	flutter test test/calculator_test.dart test/user_test.dart test/user_service_test.dart

test-widget: ## Run only widget tests
	flutter test test/widget_test.dart

test-integration: ## Run integration tests
	flutter test integration_test/

test-coverage: ## Run tests with coverage
	flutter test --coverage
	@echo "Coverage report generated at coverage/lcov.info"

build: ## Build the app
	flutter build apk

run: ## Run the app
	flutter run

doctor: ## Check Flutter installation
	flutter doctor -v

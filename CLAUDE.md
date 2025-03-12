# FFLib Apex Mocks - Commands & Style Guide

## Build & Deployment Commands
- Deploy code: `sf project deploy start`
- Deploy code ignoring errors: `sf project deploy start --ignore-errors`
- Deploy preview: `sf project deploy preview`
- Retrieve code: `sf project retrieve start`

## Test Commands
- Run all tests: `sf apex test run`
- Run specific test class: `sf apex test run --tests fflib_ApexMocksTest`
- Run specific test method: `sf apex test run --tests fflib_ApexMocksTest.whenVerifyMethodCallWhenNoCallsBeenMadeForType`

## Code Style
- Class naming: `fflib_` prefix with camelCase (e.g., `fflib_ApexMocks`)
- Interface naming: Use `I` prefix (e.g., `IMatcher`, `IList`)
- Methods: camelCase (e.g., `startStubbing()`, `thenReturn()`)
- Constants: UPPERCASE (e.g., `NEVER`)
- Test methods: Use descriptive names with scenario/expected format
- Exception handling: Define custom exceptions within classes
- Clear test structure: Given/When/Then pattern

## Mocking Pattern
- Interface-based design
- Method verification with matchers
- Method stubbing with chained API
- Fluent API with method chaining
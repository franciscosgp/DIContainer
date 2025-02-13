# Swift Dependency Injection Container (DIContainer)

## Overview
This project provides a simple and efficient Dependency Injection (DI) Container for Swift projects. It allows you to register and resolve dependencies easily, promoting modular and testable code.

## Features
- Simple registration and resolution of dependencies
- Support for singleton and transient lifetimes
- Type-safe dependency management

## Installation
To use the DI Container, simply copy the `DIContainer.swift` & `DIPropertyWrapper.swift` file into your project or add this SPM package and import it.

## Usage
### 1. Get the shared DI Container
```swift
let container = DIContainer.shared
```

### 2. Register Dependencies
```swift
container.register(ConsoleLogger(), for: Logger.self)
```

### 3. Resolve Dependencies
```swift
@Injected var logger: Logger
```

## Unit Testing
You can easily mock dependencies for testing:
```swift
container.register(MockLogger(), for: Logger.self)
@Injected var logger: Logger
XCTAssertNotNil(logger)
```

## Contributing
Feel free to fork the repository and submit pull requests. Contributions are welcome!

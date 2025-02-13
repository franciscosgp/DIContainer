
// MARK: Inject a unique dependency instance shared in the singleton container

@propertyWrapper public final class Injected<T> {

    // MARK: Variables

    private let container: DIContainer
    private var dependency: T?

    public var wrappedValue: T {
        guard !DIContainer.isTesting else {
            return container.resolve() /// Return a new instance of the dependency if we are in a testing target
        }
        if let dependency { return dependency }
        let genericDependency: T = container.resolve()
        self.dependency = genericDependency
        return genericDependency
    }

    // MARK: Initializers

    public init() {
        container = DIContainer.shared
    }

}

// MARK: - Inject a new instance of the dependency each time it is invoked
///
/// - Important: This may be cause a low performance (or unexpected behavior) so must be used carefully
///
@propertyWrapper public final class InjectedFactory<T> {

    // MARK: Variables

    public var wrappedValue: T {
        DIContainer.shared.resolve()
    }

    // MARK: Initializers

    public init() {}

}

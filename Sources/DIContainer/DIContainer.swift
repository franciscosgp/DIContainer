
// MARK: - Dependency Inyector Container

public final class DIContainer {

    // MARK: Static variables

    public static let shared = DIContainer()
    public static var isTesting: Bool = false

    // MARK: Variables

    private var container: [String: DIElement] = .init()

    // MARK: Initializers

    private init() {}

    // MARK: Methods

    /// Save dependency in a dictionary store as a lazy access value
    public func register<T>(_ dependency: @escaping @autoclosure DIElement, for type: T.Type) {
        container[String(describing: T.self)] = dependency
    }

    /// Recover dependency of the inferred type
    public func resolve<T>() -> T {
        let dependencyId = String(describing: T.self)
        guard let dependency = container[dependencyId] else {
            fatalError("Could not resolve \(T.self)")
        }
        guard let dependencyAsT = dependency() as? T else {
            fatalError("The dependency \(dependencyId) is not a type \(T.self)")
        }
        return dependencyAsT
    }

}

// MARK: - [Extension] DIElement

public extension DIContainer {

    /// Typealias for dependency element
    typealias DIElement = () -> Any

}

// MARK: - [Extension] Testing methods

public extension DIContainer {

    // MARK: Methods

    /// Remove all dependency references in container (Only for testing extension)
    func clear() {
        container.removeAll()
    }

}

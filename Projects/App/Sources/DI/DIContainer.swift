import Swinject

struct DIContainer {
    static let shared = DIContainer()
    private let container = Container()
    private init() {}

    @discardableResult
    public static func register<Service>(
        _ serviceType: Service.Type,
        name: String? = nil,
        factory: @escaping (Resolver) -> Service
    ) -> ServiceEntry<Service> {
        shared.container.register(serviceType, name: name, factory: factory)
    }

    public static func register<Service, Arg>(
        _ serviceType: Service.Type,
        name: String? = nil,
        factory: @escaping (Resolver, Arg) -> Service
    ) -> ServiceEntry<Service> {
        shared.container.register(serviceType, name: name, factory: factory)
    }

    public static func resolve<Service>(
        _ serviceType: Service.Type,
        name: String? = nil
    ) -> Service? {
        return shared.container.resolve(serviceType, name: name)
    }

    public static func resolve<Service>(
        _ serviceType: Service.Type,
        name: String? = nil
    ) -> Service {
        guard let resolved = shared.container.resolve(serviceType, name: name)
        else { fatalError("Resolving Dependency Failed.") }

        return resolved
    }
}

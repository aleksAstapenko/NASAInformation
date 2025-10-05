//
//  ServiceLocator.swift
//  
//
//  Created by Александр Астапенко on 5.06.25.
//

final class ServiceLocator {
    static let shared = ServiceLocator()
    private var services: [String: Any] = [:]
    
    private init() {}
    
    func register<Service>(_ service: Service, for type: Service.Type) {
        let key = String(describing: type)
        services[key] = service
    }
    
    func resolve<Service>(_ type: Service.Type) -> Service? {
        let key = String(describing: type)
        return services[key] as? Service
    }
}

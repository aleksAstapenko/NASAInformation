//
//  RegisterServices.swift
//  Homework2
//
//  Created by Александр Астапенко on 5.06.25.
//

struct PhotoOfDayServices {
    private let serviceLocator = ServiceLocator.shared
    func registerAllSerives() {
        registerPhotoOfDayService()
    }
    
    private func registerPhotoOfDayService() {
        serviceLocator.register(PhotoOfDayService(), for: PhotoOfDayService.self)
    }
}

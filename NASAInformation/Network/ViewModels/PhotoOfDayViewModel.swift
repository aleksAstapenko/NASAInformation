//
//  PhotoOfDayViewModel.swift
//  NASAInformation
//
//  Created by Александр Астапенко on 2.10.25.
//

import SwiftUI
import Combine
@MainActor
class PhotoOfDayViewModel: ObservableObject {
    @Published var photo: [GetPhotoOfDayResponse]?
    @Published var isLoading = false
    @Published var error: String?
    
    private let service = ServiceLocator.shared.resolve(PhotoOfDayService.self)
    
    func loadPhoto(startDay: Date, endDay: Date) {
        isLoading = true
        error = nil
        
        service?.getPhotoOfDay(startDay: startDay, endDate: endDay) { [weak self] result in
            DispatchQueue.main.async {
                self?.isLoading = false
                switch result {
                case .success(let photo):
                    self?.photo = photo
                    print("\(photo)")
                case .failure(let error):
                    print(error.localizedDescription)
                    self?.error = error.localizedDescription
                }
            }
        }
    }
}

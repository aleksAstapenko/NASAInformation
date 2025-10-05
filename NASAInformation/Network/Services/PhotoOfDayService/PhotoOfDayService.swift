//
//  NotificationService.swift
//  Homework2
//
//  Created by Александр Астапенко on 5.06.25.
//

import Combine
import Foundation
import SwiftUI
import Alamofire

class PhotoOfDayService: ObservableObject {
    @Published var users : [GetPhotoOfDayResponse] = []
    func getPhotoOfDay(startDay: Date?, endDate: Date? , completion: @escaping (Result<[GetPhotoOfDayResponse], AFError>) -> Void) {
        
        guard let start = startDay?.formatedDate(),
              let end = endDate?.formatedDate() else {
            return
        }
        
        let urlPath = ApiConstant.photoOfDay + "&start_date=\(start)" + "&end_date=\(end)"
        
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        AF.request(urlPath).responseDecodable(of: [GetPhotoOfDayResponse].self, decoder: decoder) { response in
            completion(response.result)
        }
    }
}

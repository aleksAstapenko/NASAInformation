//
//  Array+DateSorting.swift
//  NASAInformation
//
//  Created by Александр Астапенко on 5.10.25.
//


extension Array where Element == GetPhotoOfDayResponse {
    func sortedByDate(ascending: Bool = false) -> [GetPhotoOfDayResponse] {
        return self.sorted { (photo1: GetPhotoOfDayResponse, photo2: GetPhotoOfDayResponse) in
            return ascending ? photo1.date ?? "" < photo2.date ?? "" : photo1.date ?? "" > photo2.date ?? ""
        }
    }
}

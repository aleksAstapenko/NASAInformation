//
//  PhotoOfDayList.swift
//  NASAInformation
//
//  Created by Александр Астапенко on 5.10.25.
//
import SwiftUI

struct PhoreoOfDayList: View {
  var viewModelPhotoOfDay: [GetPhotoOfDayResponse]?
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(viewModelPhotoOfDay?.sortedByDate(ascending: false) ?? [], id: \.self) { photo in
                    NavigationLink(destination: PhotoOfDayDetailed(detailedInformation: photo)) {
                        PhotoOfDayItem(title: photo.title ?? "", date: photo.date ?? "", imageUrl: photo.url ?? "")
                    }
                }
            }
        }
    }
}

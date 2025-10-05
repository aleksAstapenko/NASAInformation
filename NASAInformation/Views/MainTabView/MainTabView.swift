//
//  MainTabView.swift
//
//
//  Created by Александр Астапенко on 5.09.25.
//

import SwiftUI

struct MainTabView: View {
    @EnvironmentObject var state: AppState
    @StateObject private var viewModelPhotoOfDay = PhotoOfDayViewModel()
    @State private var startDate = Calendar.current.date(byAdding: .day, value: -7, to: Date()) ?? Date()
    @State private var endDate = Date()
    
    var body: some View {
        TabView(selection: $state.mainTab) {
            ForEach(state.itemsOnTab, id: \.self) { flow in
                Group {
                    switch flow {
                    case .firstTab:
                        NavigationView {
                            VStack {
                                if viewModelPhotoOfDay.photo == nil {
                                    Text("Выберите диапозон дат для получения информации")
                                        .multilineTextAlignment(.center)
                                    DateRangePicker(startDate: $startDate, endDate: $endDate) { startDay, endDay in
                                        viewModelPhotoOfDay.loadPhoto(startDay: startDay, endDay: endDay)
                                    }
                                } else {
                                    PhoreoOfDayList(viewModelPhotoOfDay: viewModelPhotoOfDay.photo)
                                    DateRangePicker(startDate: $startDate, endDate: $endDate) { startDay, endDay in
                                        viewModelPhotoOfDay.loadPhoto(startDay: startDay, endDay: endDay)
                                    }
                                }
                                
                            }.loading(viewModelPhotoOfDay.isLoading, "Downloading Photo Of Day...")
                        }
                    case .secondTab:
                        NavigationView {
                            
                        }
                    case .thirdTab:
                        NavigationView {
                            Text("\(flow.title) View")
                                .navigationTitle(flow.title.capitalized)
                        }
                        
                    case .forthTab:
                        NavigationView {
                            Text("\(flow.title) View")
                                .navigationTitle(flow.title.capitalized)
                        }
                        
                    }
                }.tabItem {
                    flow.image
                    Text(flow.title)
                }
                .tag(flow)
            }
        }
    }
}

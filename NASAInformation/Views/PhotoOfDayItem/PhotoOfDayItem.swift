//
//  PhotoOfDayItem.swift
//  NASAInformation
//
//  Created by Александр Астапенко on 2.10.25.
//

import SwiftUI

struct PhotoOfDayItem: View {
    let title: String
    let date: String
    let imageUrl: String?
    
    private var formattedDate: String {
        let inputFormatter = DateFormatter()
        inputFormatter.dateFormat = "yyyy-MM-dd"
        
        let outputFormatter = DateFormatter()
        outputFormatter.dateStyle = .long
        outputFormatter.locale = Locale(identifier: "ru_RU")
        
        if let date = inputFormatter.date(from: date) {
            return outputFormatter.string(from: date)
        }
        return date
    }
    
    var body: some View {
        HStack(spacing: 16) {
            CachedAsyncImage(urlString: imageUrl ?? "")
            .frame(width: 80, height: 80)
            .cornerRadius(12)
            .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(Color.gray.opacity(0.3), lineWidth: 1)
            )
            VStack(alignment: .leading, spacing: 8) {
                HStack {
                    Text(formattedDate)
                        .font(.subheadline)
                        .fontWeight(.medium)
                        .foregroundColor(.secondary)
                    
                    Spacer()
                }
                
                // Заголовок
                Text(title)
                    .font(.headline)
                    .fontWeight(.semibold)
                    .foregroundColor(.primary)
                    .lineLimit(2)
                    .multilineTextAlignment(.leading)
            }
            
            Spacer()
            Image(systemName: "chevron.right")
                .font(.caption)
                .foregroundColor(.gray)
        }
        .padding(.vertical, 8)
        .padding(.horizontal, 16)
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color(.systemBackground))
                .shadow(
                    color: Color.black.opacity(0.1),
                    radius: 4,
                    x: 0,
                    y: 2
                )
        )
        .padding(.horizontal, 16)
    }
}

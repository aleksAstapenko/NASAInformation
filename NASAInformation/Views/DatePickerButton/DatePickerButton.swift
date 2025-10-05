//
//  DatePickerButton.swift
//  NASAInformation
//
//  Created by Александр Астапенко on 5.10.25.
//
import SwiftUI

struct DateRangePicker: View {
    @Binding var startDate: Date
    @Binding var endDate: Date
    @State private var showDatePicker = false
    var onApply: ((Date, Date) -> Void)?
    

    private var defaultStartDate: Date {
        let components = DateComponents(year: 1995, month: 6, day: 16)
        return Calendar.current.date(from: components) ?? Date()
    }
    
    private var today: Date {
        return Date()
    }
    
    var body: some View {
        VStack {
            Button {
                withAnimation(.spring(response: 0.3, dampingFraction: 0.8)) {
                    showDatePicker.toggle()
                }
            } label: {
                HStack {
                    Image(systemName: "calendar.badge.clock")
                        .font(.system(size: 16, weight: .medium))
                    
                    VStack(alignment: .leading, spacing: 2) {
                        Text("Период")
                            .font(.system(size: 12, weight: .medium))
                            .foregroundColor(.secondary)
                        
                        Text(dateRangeText)
                            .font(.system(size: 14, weight: .semibold))
                            .foregroundColor(.primary)
                    }
                    
                    Spacer()
                    
                    Image(systemName: "chevron.down")
                        .font(.system(size: 14, weight: .medium))
                        .rotationEffect(.degrees(showDatePicker ? 180 : 0))
                }
                .padding(.horizontal, 16)
                .padding(.vertical, 12)
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.blue.opacity(0.1))
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.blue.opacity(0.3), lineWidth: 1)
                        )
                )
            }
            if showDatePicker {
                VStack(spacing: 20) {
                    HStack {
                        Text("Выберите период")
                            .font(.headline)
                            .fontWeight(.semibold)
                        
                        Spacer()
                        
                        Button("Закрыть") {
                            withAnimation(.spring()) {
                                showDatePicker = false
                            }
                        }
                        .font(.system(size: 14, weight: .medium))
                        .foregroundColor(.blue)
                    }
                    VStack(alignment: .leading, spacing: 8) {
                        Text("От:")
                            .font(.system(size: 14, weight: .medium))
                            .foregroundColor(.secondary)
                        
                        DatePicker(
                            "",
                            selection: $startDate,
                            in: defaultStartDate...endDate,
                            displayedComponents: .date
                        )
                        .datePickerStyle(.compact)
                        .labelsHidden()
                    }
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 8)
                            .fill(Color(.systemGray6))
                    )
                    VStack(alignment: .leading, spacing: 8) {
                        Text("До:")
                            .font(.system(size: 14, weight: .medium))
                            .foregroundColor(.secondary)
                        
                        DatePicker(
                            "",
                            selection: $endDate,
                            in: startDate...today,
                            displayedComponents: .date
                        )
                        .datePickerStyle(.compact)
                        .labelsHidden()
                    }
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 8)
                            .fill(Color(.systemGray6))
                    )
                    HStack(spacing: 12) {
                        Button("Сбросить") {
                            resetToDefault()
                        }
                        .buttonStyle(.bordered)
                        
                        Button("Применить") {
                            applyChanges()
                        }
                        .buttonStyle(.borderedProminent)
                    }
                }
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 16)
                        .fill(Color(.systemBackground))
                        .shadow(
                            color: .black.opacity(0.15),
                            radius: 20,
                            x: 0,
                            y: 5
                        )
                )
                .padding(.horizontal)
                .transition(.scale.combined(with: .opacity))
            }
        }
    }

    private var dateRangeText: String {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.locale = Locale(identifier: "ru_RU")
        
        let start = formatter.string(from: startDate)
        let end = formatter.string(from: endDate)
        
        return "\(start) - \(end)"
    }

    private func resetToDefault() {
        endDate = Date()
        startDate = Calendar.current.date(byAdding: .day, value: -7, to: endDate) ?? endDate
        
        if startDate < defaultStartDate {
            startDate = defaultStartDate
        }
    }

    private func applyChanges() {
        withAnimation(.spring()) {
            showDatePicker = false
        }
        onApply?(startDate, endDate)
    }
}

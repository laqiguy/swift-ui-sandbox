//
//  DateEditorView.swift
//  
//
//  Created by Aleksei Tiurnin on 03.07.2024.
//

import SwiftUI

struct DateEditorView: View {
        
    struct ViewModel {
        let months: [String]
        let years: [String]
        var selectedMonth: Int = 0
        var selectedYear: Int = 0
        
        init(currentDate: Date, selectedDate: Date, calendarManager: CalendarManager) {
            let currentDateComponents = calendarManager.calendar.dateComponents([.year, .month], from: currentDate)
            let currentYear = currentDateComponents.year ?? 2023
            
            let selectedDateComponents = calendarManager.calendar.dateComponents([.year, .month], from: selectedDate)
            let selectedMonth = (selectedDateComponents.month ?? 1) - 1
            let selectedYear = selectedDateComponents.year ?? currentYear
            
            self.years = stride(from: currentYear, to: currentYear + 10, by: 1).map { "\($0)" }
            let months = calendarManager.calendar.standaloneMonthSymbols
            self.months = months
            self.selectedMonth = selectedMonth
            self.selectedYear = years.firstIndex(of: "\(selectedYear)") ?? 0
        }
    }
    
    @State var viewModel: ViewModel
    
    @Binding var date: Date
    @Binding var showWeekNumber: Bool
    
    private let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.locale = .init(identifier: "ru_RU")
        formatter.dateFormat = "LLLL yyyy"
        return formatter
    }()
        
    init(current: Date, date: Binding<Date>, showWeekNumber: Binding<Bool>, calendarManager: CalendarManager) {
        self._showWeekNumber = showWeekNumber
        self._date = date
        self.viewModel = .init(currentDate: current, selectedDate: date.wrappedValue, calendarManager: calendarManager)
    }
    
    var body: some View {
        VStack {
            Toggle("Показывать номер недели", isOn: $showWeekNumber)
                .padding()
            GeometryReader { proxy in
                HStack(spacing: 0) {
                    Picker(selection: $viewModel.selectedMonth) {
                        ForEach(viewModel.months.indices, id: \.self) { index in
                            Text(viewModel.months[index])
                        }
                    } label: { }
                        .frame(width: proxy.size.width / 2)
                        .clipped()
                        .contentShape(Rectangle())
                    Picker(selection: $viewModel.selectedYear) {
                        ForEach(viewModel.years.indices, id: \.self) { index in
                            Text(viewModel.years[index])
                        }
                    } label: { }
                        .frame(width: proxy.size.width / 2)
                        .clipped()
                        .contentShape(Rectangle())
                }
                .onChange(of: viewModel.selectedMonth, perform: { newValue in
                    let dateString = "\(viewModel.months[newValue]) \(viewModel.years[viewModel.selectedYear])"
                    date = dateFormatter.date(from: dateString) ?? date
                })
                .onChange(of: viewModel.selectedYear, perform: { newValue in
                    let dateString = "\(viewModel.months[viewModel.selectedMonth]) \(viewModel.years[newValue])"
                    date = dateFormatter.date(from: dateString) ?? date
                })
                .pickerStyle(.wheel)
            }
        }.presentationDetents([.fraction(0.3)])
    }
}

#Preview {
    DateEditorView(
        current: Date(),
        date: .constant(Date()),
        showWeekNumber: .constant(true),
        calendarManager: CalendarManager(option: .ru))
}

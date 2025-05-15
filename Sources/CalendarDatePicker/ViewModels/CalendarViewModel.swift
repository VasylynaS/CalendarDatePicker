//
//  CalendarViewModel.swift
//  CalendarDatePicker
//
//  Created by Vasylyna on 14.05.2025.
//

import Foundation
import Combine

public class CalendarViewModel: ObservableObject {
    @Published public var displayedMonth: Date = Date()
    @Published public var showYearSelection = false
    @Published public var startDate: Date? = nil
    @Published public var endDate: Date? = nil
    @Published public var yearGridStart: Int = Calendar.current.component(.year, from: Date()) / 12 * 12
    @Published public var selectionMode: SelectionMode = .single
    
    public let calendar: Calendar = {
        var calendar = Calendar.current
        calendar.firstWeekday = 1
        return calendar
    }()
    
    public let formatter: DateFormatter = {
        let f = DateFormatter()
        f.dateFormat = "MMMM yyyy"
        return f
    }()
    
    public let yearFormatter: DateFormatter = {
        let f = DateFormatter()
        f.dateFormat = "yyyy"
        return f
    }()
    
    public var weekDays: [String] {
        calendar.shortStandaloneWeekdaySymbols
    }
    
    public init() {}
    
    public func changeMonth(by value: Int) {
        displayedMonth = calendar.date(byAdding: .month, value: value, to: displayedMonth) ?? displayedMonth
    }
    
    public func generateMonthGrid() -> [Date] {
        guard let firstDayOfMonth = calendar.date(
            from: calendar.dateComponents([.year, .month], from: displayedMonth)
        ) else {
            return []
        }
        
        let weekday = calendar.component(.weekday, from: firstDayOfMonth)
        let daysToPrepend = (weekday - calendar.firstWeekday + 7) % 7
        
        guard let gridStartDate = calendar.date(
            byAdding: .day,
            value: -daysToPrepend,
            to: firstDayOfMonth
        ) else {
            return []
        }
        
        let daysInMonth = calendar.range(of: .day, in: .month, for: displayedMonth)?.count ?? 0
        let totalDays = daysToPrepend + daysInMonth
        let numberOfRows = Int(ceil(Double(totalDays) / 7.0))
        let fullGridDays = numberOfRows * 7
        
        return (0..<fullGridDays).compactMap {
            calendar.date(byAdding: .day, value: $0, to: gridStartDate)
        }
    }
    
    public func handleDateSelection(_ date: Date) {
        switch selectionMode {
        case .single:
            startDate = date
            endDate = nil
        case .range:
            if startDate == nil {
                startDate = date
            } else if endDate == nil {
                if date >= startDate! {
                    endDate = date
                } else {
                    startDate = date
                    endDate = nil
                }
            } else {
                startDate = date
                endDate = nil
            }
        }
    }
    
    public func isInRange(_ date: Date) -> Bool {
        guard let start = startDate else { return false }
        if let end = endDate {
            return date >= start && date <= end
        }
        return false
    }
    
    public func isSelected(_ date: Date) -> Bool {
        guard let start = startDate else { return false }
        if selectionMode == .single {
            return calendar.isDate(date, inSameDayAs: start)
        }
        if let end = endDate {
            return calendar.isDate(date, inSameDayAs: start) || calendar.isDate(date, inSameDayAs: end)
        }
        return calendar.isDate(date, inSameDayAs: start)
    }
}

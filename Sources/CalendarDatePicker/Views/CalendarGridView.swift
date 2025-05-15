//
//  CalendarGridView.swift
//  CalendarDatePicker
//
//  Created by Vasylyna on 14.05.2025.
//

import SwiftUI

struct CalendarGridView: View {
    @ObservedObject var viewModel: CalendarViewModel
    var color: Color

    let columns: [GridItem] = Array(
        repeating: GridItem(.flexible(), spacing: 2),
        count: 7
    )

    var body: some View {
        VStack {
            monthTextView
            Divider()
            let days = viewModel.generateMonthGrid()
            LazyVGrid(columns: columns) {
                ForEach(days, id: \.self) { date in
                    let isInCurrentMonth = viewModel.calendar.isDate(
                        date,
                        equalTo: viewModel.displayedMonth,
                        toGranularity: .month
                    )
                    Button(action: {
                        viewModel.handleDateSelection(date)
                    }) {
                        Text(
                            "\(viewModel.calendar.component(.day, from: date))"
                        )
                        .frame(maxWidth: .infinity, minHeight: 50)
                        .foregroundColor(
                            viewModel.isSelected(date)
                                ? .white : (isInCurrentMonth ? .primary : .gray)
                        )
                        .background(
                            Group {
                                if viewModel.isSelected(date) {
                                    color
                                } else if viewModel.isInRange(date) {
                                    color.opacity(0.2)
                                } else {
                                    Color.clear
                                }
                            }
                        )
                        .clipShape(
                            RoundedRectangle(
                                cornerRadius: 8
                            )
                        )
                        .overlay(dayOverlay(date))
                    }
                }
            }
        }
    }
}

extension CalendarGridView {
    private func isToday(_ date: Date) -> Bool {
        viewModel.calendar.isDateInToday(date)
    }

    var monthTextView: some View {
        HStack(spacing: 2) {
            ForEach(viewModel.weekDays, id: \.self) { day in
                Text(day)
                    .font(.subheadline)
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 5)
            }
        }
    }

    func dayOverlay(_ date: Date) -> some View {
        RoundedRectangle(cornerRadius: 8)
            .stroke(lineWidth: 1)
            .foregroundStyle(isToday(date) ? color : .clear)
    }
}


//
//  YearsView.swift
//  CalendarDatePicker
//
//  Created by Vasylyna on 14.05.2025.
//

import SwiftUI

struct YearsView: View {
    @ObservedObject var viewModel: CalendarViewModel
    var color: Color

    public var body: some View {
        LazyVGrid(
            columns: Array(
                repeating: GridItem(.flexible(), spacing: 16),
                count: 3
            ),
            spacing: 16
        ) {
            ForEach(
                viewModel.yearGridStart..<(viewModel.yearGridStart + 12),
                id: \.self
            ) { year in
                Button(action: {
                    if let newDate = viewModel.calendar.date(
                        from: DateComponents(
                            year: year,
                            month: viewModel.calendar.component(
                                .month,
                                from: viewModel.displayedMonth
                            )
                        )
                    ) {
                        viewModel.displayedMonth = newDate
                    }
                    viewModel.showYearSelection = false
                }) {
                    Text("\(year)")
                        .frame(maxWidth: .infinity)
                        .foregroundStyle(color)
                        .padding()
                        .background(
                            viewModel.calendar.component(
                                .year,
                                from: viewModel.displayedMonth
                            ) == year
                                ? color.opacity(0.2)
                                : Color(.secondarySystemBackground)
                        )
                        .cornerRadius(8)
                }
            }
        }
    }
}

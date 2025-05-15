//
//  CalendarHeaderView.swift
//  CalendarDatePicker
//
//  Created by Vasylyna on 14.05.2025.
//

import SwiftUI

struct CalendarHeaderView: View {
    @ObservedObject public var viewModel: CalendarViewModel

    public var body: some View {
        HStack {
            Button(action: {
                if viewModel.showYearSelection {
                    viewModel.yearGridStart -= 12
                } else {
                    viewModel.changeMonth(by: -1)
                }
            }) {
                Image(systemName: "chevron.left")
            }

            Spacer()
            Button(action: {
                viewModel.showYearSelection.toggle()
            }) {
                if viewModel.showYearSelection {
                    Text(
                        "\(viewModel.yearGridStart) - \(viewModel.yearGridStart + 11)"
                    )
                    .font(.headline)
                } else {
                    Text(
                        viewModel.formatter.string(
                            from: viewModel.displayedMonth
                        )
                    )
                    .font(.headline)
                }
            }
            Spacer()
            Button(action: {
                if viewModel.showYearSelection {
                    viewModel.yearGridStart += 12
                } else {
                    viewModel.changeMonth(by: 1)
                }
            }) {
                Image(systemName: "chevron.right")
            }
        }
        .padding(.horizontal)
        .tint(.primary)
    }
}

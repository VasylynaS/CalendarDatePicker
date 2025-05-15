import SwiftUI

public struct CalendarDatePicker: View {
    var color: Color
    @StateObject var viewModel: CalendarViewModel
    @Binding var startDate: Date?
    @Binding var endDate: Date?

    public init(
        color: Color = .primary,
        mode: SelectionMode = .single,
        startDate: Binding<Date?>,
        endDate: Binding<Date?>
    ) {
        self.color = color
        self._startDate = startDate
        self._endDate = endDate
        let vm = CalendarViewModel()
        vm.selectionMode = mode
        vm.startDate = startDate.wrappedValue
        vm.endDate = endDate.wrappedValue
        _viewModel = StateObject(wrappedValue: vm)
    }

    public var body: some View {
        VStack(alignment: .trailing) {
            CalendarHeaderView(viewModel: viewModel)
            if viewModel.showYearSelection {
                YearsView(viewModel: viewModel, color: color)
            } else {
                CalendarGridView(viewModel: viewModel, color: color)
            }
        }
        .onChange(of: viewModel.startDate) { newValue in
            startDate = newValue
        }
        .onChange(of: viewModel.endDate) { newValue in
            endDate = newValue
        }
    }
}

#Preview {
    @State var startDate: Date? = nil
    @State var endDate: Date? = nil

    return CalendarDatePicker(
        color: .red,
        mode: .range,
        startDate: $startDate,
        endDate: $endDate
    )
}

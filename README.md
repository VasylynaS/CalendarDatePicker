# CalendarDatePicker

A SwiftUI calendar component that provides a modern and flexible date selection interface with support for both single date and date range selection.

## Features

- 📅 Single date and date range selection
- 🎨 Customizable accent color
- 📱 iOS 16.0+ support
- 🔄 Two-way binding for selected dates
- 🎯 Year selection view
- 📊 Month grid view
- 🌐 Localized weekday names

## Installation

### Swift Package Manager

Add to your `Package.swift`:

```swift
dependencies: [
    .package(url: "https://github.com/VasylynaS/CalendarDatePicker.git", from: "1.0.0")
]
```

Or in Xcode:
1. File > Add Packages...
2. Enter repository URL
3. Select version
4. Add Package

## Usage

```swift
import SwiftUI
import CalendarDatePicker

struct ContentView: View {
    @State private var startDate: Date? = nil
    @State private var endDate: Date? = nil
    
    var body: some View {
        CalendarDatePicker(
            color: .blue,
            mode: .range, // or .single
            startDate: $startDate,
            endDate: $endDate
        )
    }
}
```

## Parameters

| Parameter | Type | Description |
|-----------|------|-------------|
| `color` | `Color` | Accent color (default: `.primary`) |
| `mode` | `SelectionMode` | `.single` or `.range` (default: `.single`) |
| `startDate` | `Binding<Date?>` | Binding to selected start date |
| `endDate` | `Binding<Date?>` | Binding to selected end date |

## Requirements

- iOS 16.0+
- Swift 6.1+
- Xcode 15.0+

## License

[License]: https://github.com/VasylynaS/CalendarDatePicker/blob/main/LICENSE

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

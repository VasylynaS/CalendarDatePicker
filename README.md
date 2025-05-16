# CalendarDatePicker

<!-- GIFs -->
<p align="center">
    <img alt="Calendar Example 1" src="https://github.com/VasylynaS/Assets/blob/main/CalendarDatePicker/GIFs/1.gif" width="23%"/>
    <img alt="Calendar Example 2" src="https://github.com/VasylynaS/Assets/blob/main/CalendarDatePicker/GIFs/2.gif" width="23%"/>
</p>

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
    .package(url: "https://github.com/VasylynaS/CalendarDatePicker.git", branch(“main”))
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

CalendarDatePicker is released under the MIT license. See [LICENSE][License] for details.


## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

[License]: https://github.com/VasylynaS/CalendarDatePicker/blob/main/LICENSE

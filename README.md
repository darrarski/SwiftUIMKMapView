# SwiftUIMKMapView

![Swift 5.5](https://img.shields.io/badge/swift-5.5-orange.svg)
![platform iOS](https://img.shields.io/badge/platform-iOS-blue.svg)

SwiftUI wrapper for MapKit's MKMapView (UIKit).

## ▶️ Usage

Add as a dependecy to your project using Swift Package Manager.

Embed map view in your SwiftUI view:

```swift
import SwiftUIMKMapView

struct ContentView: View {
  var body: some View {
    MapView(
      visibleRect: /* Binding<MKMapRect> */,
      annotations: /* [MKAnnotation] */,
      annotationViewFactory: /* AnnotationViewFactory */,
      overlays: /* [MKOverlay] */,
      overlayRendererFactory: /* OverlayRendererFactory */
    )
  }
}
```

Check out the included [example app](Example/ExampleApp/ExampleApp.swift).

## 🛠 Development

Open `SwiftUIMKMapView.xcworkspace` in Xcode (≥13.1) for development.

Use `ExampleApp` scheme to build and run the example application.

## ☕️ Do you like the project?

<a href="https://www.buymeacoffee.com/darrarski" target="_blank">
  <img src="https://cdn.buymeacoffee.com/buttons/v2/default-yellow.png" alt="Buy Me A Coffee" align="right" height="60"/>
</a>

Consider supporting further development and buy me a coffee.

&nbsp;

## 📄 License

Copyright © 2022 Dariusz Rybicki Darrarski

License: [MIT](LICENSE)

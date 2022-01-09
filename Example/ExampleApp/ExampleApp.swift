import MapKit
import SwiftUI
import SwiftUIMKMapView

@main
struct ExampleApp: App {
  var body: some Scene {
    WindowGroup {
      ExampleView()
    }
  }
}

struct ExampleView: View {
  @State var mapRect: MKMapRect = .world
  @State var coordinates: [CLLocationCoordinate2D] = [
    .init(latitude: 52.2297, longitude: 21.0122),
    .init(latitude: 32.6669, longitude: -16.9241),
  ]

  var body: some View {
    ZStack {
      MapView(
        visibleRect: $mapRect,
        annotations: coordinates.map { coordinate in
          DotAnnotation(
            coordinate: coordinate,
            size: 20,
            border: 2,
            color: .systemBlue
          )
        },
        annotationViewFactory: .combine(
          DotAnnotation.viewFactory
        ),
        overlays: [
          LineOverlay(
            coordinates: coordinates,
            color: .systemPurple,
            width: 3
          )
        ],
        overlayRendererFactory: .combine(
          LineOverlay.rendererFactory
        )
      )
        .ignoresSafeArea()

      Button(action: {
        coordinates.append(.init(
          latitude: .random(in: -45...45),
          longitude: .random(in: -45...45)
        ))
      }) {
        Text("Add random coordinate")
      }
      .buttonStyle(.borderedProminent)
      .padding()
      .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
    }
  }
}

#if DEBUG
struct ExampleView_Previews: PreviewProvider {
  static var previews: some View {
    ExampleView()
  }
}
#endif

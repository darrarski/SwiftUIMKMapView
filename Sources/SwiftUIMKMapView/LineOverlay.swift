import MapKit

/// Map overlay that represents polyline with provided coordinates.
public final class LineOverlay: NSObject, MKOverlay {
  /// - Parameters:
  ///   - coordinates: Line point coordinates.
  ///   - color: Line color.
  ///   - width: Line width.
  public init(
    coordinates: [CLLocationCoordinate2D],
    color: UIColor,
    width: CGFloat
  ) {
    self.coordinates = coordinates
    self.color = color
    self.width = width
    var coords = coordinates
    let polyline = MKPolyline(coordinates: &coords, count: coords.count)
    self.polyline = polyline
  }

  let coordinates: [CLLocationCoordinate2D]
  let color: UIColor
  let width: CGFloat
  let polyline: MKPolyline
  public var coordinate: CLLocationCoordinate2D { polyline.coordinate }
  public var boundingMapRect: MKMapRect { polyline.boundingMapRect }

  public override func isEqual(_ object: Any?) -> Bool {
    guard let other = object as? Self else { return false }
    return coordinates.count == other.coordinates.count
    && coordinates.map(\.latitude) == other.coordinates.map(\.latitude)
    && coordinates.map(\.longitude) == other.coordinates.map(\.longitude)
    && color == other.color
    && width == other.width
  }
}

extension LineOverlay {
  /// Overlay renderer factory that uses `MKPolylineRenderer` to render `LineOverlay`.
  public static let rendererFactory: OverlayRendererFactory = .factory(for: LineOverlay.self) { line in
    let renderer = MKPolylineRenderer(polyline: line.polyline)
    renderer.strokeColor = line.color
    renderer.lineWidth = line.width
    return renderer
  }
}

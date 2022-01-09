import MapKit

/// Map annotation representing dot at provided coordinate.
public final class DotAnnotation: NSObject, MKAnnotation {
  /// - Parameters:
  ///   - coordinate: Dot coordinate.
  ///   - size: Dot size.
  ///   - border: Side of the border.
  ///   - color: Color of the dot.
  public init(
    coordinate: CLLocationCoordinate2D,
    size: CGFloat,
    border: CGFloat,
    color: UIColor
  ) {
    self.coordinate = coordinate
    self.size = size
    self.border = border
    self.color = color
  }

  public let coordinate: CLLocationCoordinate2D
  let size: CGFloat
  let border: CGFloat
  let color: UIColor

  public override func isEqual(_ object: Any?) -> Bool {
    guard let other = object as? Self else { return false }
    return coordinate.longitude == other.coordinate.longitude
    && coordinate.latitude == other.coordinate.latitude
    && size == other.size
    && color == other.color
  }
}

final class DotAnnotationView: MKAnnotationView {
  static let reuseIdentifier: String = String(describing: DotAnnotationView.self)

  override func prepareForDisplay() {
    super.prepareForDisplay()
    if image == nil {
      image = renderImage()
    }
  }

  override func prepareForReuse() {
    super.prepareForReuse()
    image = nil
  }

  func renderImage() -> UIImage? {
    guard let annotation = annotation as? DotAnnotation else { return nil }
    let format = UIGraphicsImageRendererFormat()
    let bounds = CGRect(
      origin: .zero,
      size: .init(width: annotation.size, height: annotation.size)
    )
    let renderer = UIGraphicsImageRenderer(bounds: bounds, format: format)
    let image = renderer.image { context in
      UIColor.white.setFill()
      context.cgContext.fillEllipse(in: bounds)
      annotation.color.setFill()
      context.cgContext.fillEllipse(in: bounds.insetBy(
        dx: annotation.border,
        dy: annotation.border
      ))
    }
    return image
  }
}

extension DotAnnotation {
  /// Annotation view factory for `DotAnnotation` that uses `DotAnnotationView`.
  public static let viewFactory: AnnotationViewFactory = .factory(for: DotAnnotation.self, DotAnnotationView.self)
}

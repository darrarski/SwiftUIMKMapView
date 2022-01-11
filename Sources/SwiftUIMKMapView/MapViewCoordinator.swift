import MapKit

/// Coordinator for the MpaView UIViewRepresentable.
public final class MapViewCoordinator: NSObject, MKMapViewDelegate {
  init(view: MapView) {
    self.view = view
    super.init()
  }

  let view: MapView

  public func mapView(_ mapView: MKMapView, regionDidChangeAnimated animated: Bool) {
    view.visibleRect = mapView.visibleMapRect
  }

  public func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
    view.annotationViewFactory.mapView(mapView, viewFor: annotation)
  }

  public func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
    view.overlayRendererFactory.rendererFor(overlay) ?? .init()
  }
}

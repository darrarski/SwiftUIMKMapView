// swift-tools-version:5.5

import PackageDescription

let package = Package(
  name: "SwiftUIMKMapView",
  platforms: [
    .iOS(.v15),
  ],
  products: [
    .library(name: "SwiftUIMKMapView", targets: ["SwiftUIMKMapView"])
  ],
  targets: [
    .target(name: "SwiftUIMKMapView"),
  ]
)

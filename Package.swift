// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "BigUIPaging",
    platforms: [.macOS(.v13), .iOS(.v16)],
    products: [
        .library(
            name: "BigUIPaging",
            targets: ["BigUIPaging"]),
    ],
    dependencies: [
        .package(url: "https://github.com/pointfreeco/swift-identified-collections", from: "1.0.0")
    ],
    targets: [
        .target(
            name: "BigUIPaging",
            dependencies: [
                .product(name: "IdentifiedCollections", package: "swift-identified-collections"),
            ]),
        .testTarget(
            name: "BigUIPagingTests",
            dependencies: ["BigUIPaging"]),
    ]
)

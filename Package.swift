// swift-tools-version:4.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CraftOS",
    products: [
        // Products define the executables and libraries produced by a package, and make them visible to other packages.
        .executable(name: "craft", targets: ["Craft"]),
        .library(
            name: "CraftOS",
            targets: ["CraftOS"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
        .package(url: "https://github.com/apple/swift-package-manager.git", from: "0.3.0"),
        .package(url: "https://github.com/vapor/vapor.git", from: "3.1.0"),
        .package(url: "https://github.com/vapor/console.git", from: "3.0.2")
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages which this package depends on.
        .target(
            name: "Craft",
            dependencies: [ "CraftOS", "Utility", "Vapor", "Logging" ]
        ),
        .target(
            name: "CraftOS",
            dependencies: []),
        .testTarget(
            name: "CraftOSTests",
            dependencies: ["CraftOS"]),
        .testTarget(
            name: "CraftTests",
            dependencies: ["Craft"]),
    ]
)

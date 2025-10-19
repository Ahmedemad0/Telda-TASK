// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "TeldaDomainLayer",
    platforms: [
        .iOS(.v14)
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "TeldaDomainLayer",
            targets: ["TeldaDomainLayer"]),
    ],
    dependencies: [
        .package(path: "../TeldaCommon"),
    ],
    targets: [
        .target(
            name: "TeldaDomainLayer",
            dependencies: ["TeldaCommon"]
        )

    ]
)

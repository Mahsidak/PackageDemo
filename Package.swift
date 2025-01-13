// swift-tools-version: 6.0
import PackageDescription

let package = Package(
    name: "PackageDemo",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(
            name: "PackageDemo",
            targets: ["PackageDemo"]
        ),
    ],
    targets: [
        .target(
            name: "PackageDemo",
            resources: [
                .process("Asset"),
            ]
        ),
    ]
)


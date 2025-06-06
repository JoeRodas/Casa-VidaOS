// swift-tools-version:5.9
import PackageDescription

let package = Package(
    name: "CasaVidaOS",
    platforms: [
        .iOS(.v17)
    ],
    products: [
        .library(name: "LifeCore", targets: ["LifeCore"])
    ],
    targets: [
        .target(
            name: "LifeCore",
            path: "LifeOSApp/Models",
            exclude: ["PersistenceModels.swift"]
        ),
        .testTarget(
            name: "LifeCoreTests",
            dependencies: ["LifeCore"],
            path: "Tests/LifeCoreTests"
        )
    ]
)

import ProjectDescription

let project = Project(
    name: "AstroDating",
    organizationName: "net.fenki",
    targets: [
        .target(
            name: "AstroDating",
            destinations: [.iOS],
            product: .app,
            bundleId: "astrodating.ru",
            // infoPlist: .default,
        // infoPlist: .file(path: "Info2.plist"), // Ensure you point to the correct file here
    infoPlist:.extendingDefault(with:
    ["UILaunchScreen": [
                        "UIColorName": "",
                        "UIImageName": "",
                    ],
     "CFBundleShortVersionString": "0.0.3", // Marketing Version
     "CFBundleVersion": "5",                // Build Number
    ]),
                sources: "astrodating/**",
            resources: "astrodating/**",
            dependencies: []
        ),
        .target(
            name: "AstroDatingTests",
            destinations: .iOS,
            product: .unitTests,
            bundleId: "net.fenki.AstroDatingTests",
            infoPlist: .default,
            sources: "astrodatingTests/**",
            dependencies: [
                .target(name: "AstroDating")
            ]
        ),
        .target(
            name: "AstroDatingUITests",
            destinations: .iOS,
            product: .uiTests,
            bundleId: "net.fenki.AstroDatingUITests",
            infoPlist: .default,
            sources: "astrodatingUITests/**",
            dependencies: [
                .target(name: "AstroDating")
            ]
        )
    ]
)

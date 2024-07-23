//
//  astrodatingApp.swift
//  astrodating
//
//  Created by Vladislav Muravyev on 28-06-2024.
//

import SwiftUI

@main
struct myApp: App {
    var body: some Scene {
        WindowGroup {
            EntryAssembly.assemble()
                .environmentObject(AppViewModel())
                .ignoresSafeArea()
        }
    }
}

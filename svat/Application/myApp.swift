//
//  astrodatingApp.swift
//  astrodating
//
//  Created by Vladislav Muravyev on 28-06-2024.
//

import SwiftUI

@main
struct myApp: App {
    @StateObject private var presenter = EntryPresenter(interactor: EntryInteractor(), router: EntryRouter())

    var body: some Scene {
        WindowGroup {
            EntryAssembly.assemble()
                .environmentObject(presenter)
                .edgesIgnoringSafeArea(.all)
        }
    }
}


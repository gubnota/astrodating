//
//  EntryVM.swift
//  astrodating
//
//  Created by Vladislav Muravyev on 21.07.2024.
//

import SwiftUI
import Combine

class EntryViewModel: ObservableObject {
    @Published var currentRoute: String = "login"
}

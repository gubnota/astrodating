//
//  Entry2View.swift
//  astrodating
//
//  Created by Vladislav Muravyev on 21.07.2024.
//
import SwiftUI

struct Entry2View: View {
    @ObservedObject var viewModel: EntryViewModel

    var body: some View {
        VStack {
            switch viewModel.currentRoute {
            case "list":
                User2ListView(viewModel: viewModel)
            case "chat":
                Chat2View(viewModel: viewModel)
            case "register":
                Register2View(viewModel: viewModel)
            case "profile":
                Profile2View(viewModel: viewModel)
            case "detail":
                Person2DetailView(viewModel: viewModel)
            default:
                Login2View(viewModel: viewModel)
            }
        }
        .onAppear {
            // Deserialize from JSON or set up the initial state if needed
        }
    }
}

struct Entry2View_Previews: PreviewProvider {
    static var previews: some View {
        Entry2View(viewModel: EntryViewModel())
    }
}

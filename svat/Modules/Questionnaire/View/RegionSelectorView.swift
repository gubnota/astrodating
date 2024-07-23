import SwiftUI

struct RegionSelectorView: View {
    @ObservedObject var viewModel: QuizViewModel
    @State private var searchText = ""
    @State private var filteredRegions: [EnumItem] = []

    var body: some View {
        VStack {
            TextField("Поиск региона", text: $searchText)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .onChange(of: searchText) { value in
                    filterRegions()
                }

            List(filteredRegions) { region in
                Button(action: {
                    viewModel.region = region.id
                    searchText = region.name
                    hideKeyboard()
                }) {
                    Text(region.name)
                }
            }
            .listStyle(PlainListStyle())
        }
        .onAppear {
            filteredRegions = viewModel.regions
        }
    }

    private func filterRegions() {
        if searchText.isEmpty {
            filteredRegions = viewModel.regions
        } else {
            filteredRegions = viewModel.regions.filter { $0.name.contains(searchText) }
        }
    }
}


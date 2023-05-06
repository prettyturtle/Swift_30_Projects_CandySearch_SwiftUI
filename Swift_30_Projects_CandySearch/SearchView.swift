//
//  SearchView.swift
//  Swift_30_Projects_CandySearch
//
//  Created by yc on 2023/05/06.
//

import SwiftUI

struct SearchView: View {
    private var originCandies = Candy.mocks
    
    @State var searchText = ""
    @State var candies = Candy.mocks
    @State var searchScope: Candy.Category = .all
    
    var body: some View {
        NavigationView {
            
            List($candies, id: \.self) { candy in
                SearchListCell(candy: candy)
            }
            .listStyle(.plain)
            
            
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Image("Inline-Logo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 44)
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbarBackground(
                Color(red: 68 / 250, green: 203 / 250, blue: 132 / 250),
                for: .navigationBar
            )
            .toolbarBackground(.visible, for: .navigationBar)
            .searchable(
                text: $searchText,
                placement: .navigationBarDrawer,
                prompt: Text("Search Candy...")
            )
            .searchScopes($searchScope) {
                ForEach(Candy.Category.allCases, id: \.self) { scope in
                    Text(scope.rawValue).tag(scope)
                }
            }
            .onChange(of: searchText) { text in
                filterSearch(text: text, category: searchScope)
            }
            .onChange(of: searchScope) { scope in
                filterSearch(text: searchText, category: scope)
            }
        }
        .tint(.white)
    }
    
    private func filterSearch(text: String, category: Candy.Category) {
        if text.isEmpty {
            switch category {
            case .all:
                candies = originCandies
            default:
                candies = originCandies.filter { $0.category == category }
            }
        } else {
            switch category {
            case .all:
                candies = originCandies.filter { $0.name.contains(text) }
            default:
                candies = originCandies.filter { $0.name.contains(text) }.filter { $0.category == category }
            }
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}

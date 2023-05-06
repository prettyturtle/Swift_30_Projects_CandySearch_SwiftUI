//
//  CandyDetailView.swift
//  Swift_30_Projects_CandySearch
//
//  Created by yc on 2023/05/07.
//

import SwiftUI

struct CandyDetailView: View {
    
    @Binding var candy: Candy
    
    var body: some View {
        Image(candy.name)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text(candy.category.rawValue)
                        .font(.headline)
                        .bold()
                        .foregroundColor(.white)
                }
            }
            .toolbarBackground(
                Color(red: 68 / 250, green: 203 / 250, blue: 132 / 250),
                for: .navigationBar
            )
            .toolbarBackground(.visible, for: .navigationBar)
    }
}

struct CandyDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CandyDetailView(candy: .constant(Candy.mocks.first!))
    }
}

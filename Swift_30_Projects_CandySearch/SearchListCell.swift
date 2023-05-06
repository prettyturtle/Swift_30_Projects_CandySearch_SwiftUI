//
//  SearchListCell.swift
//  Swift_30_Projects_CandySearch
//
//  Created by yc on 2023/05/07.
//

import SwiftUI

struct SearchListCell: View {
    
    @Binding var candy: Candy
    
    var body: some View {
        ZStack(alignment: .leading) {
            NavigationLink {
                CandyDetailView(candy: $candy)
            } label: {
                EmptyView()
            }
            .opacity(0)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(candy.name)
                    .font(.title3)
                
                Text(candy.category.rawValue)
                    .font(.caption)
            }
        }
    }
}

struct SearchListCell_Previews: PreviewProvider {
    static var previews: some View {
        SearchListCell(candy: .constant(Candy.mocks.first!))
    }
}

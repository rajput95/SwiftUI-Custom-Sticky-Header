//
//  SearchBar.swift
//  ScrollViewStickyHeader
//
//  Created by Moin Rajput on 15/05/2021.
//

import SwiftUI

struct SearchBar: View {
    // MARK: - View Life Cycle
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(.gray)
                .padding(.leading, 10)
            Text("Search")
                .foregroundColor(Color.black.opacity(0.5))
            Spacer()
                
        }
        .background(Color.gray.opacity(0.2).cornerRadius(8.0).frame(height: 30))
        .padding()
    }
}

// MARK: - Preview
struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar()
    }
}

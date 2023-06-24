//
//  SearchBar.swift
//  TVMazeApp
//
//  Created by HITSS on 24/06/23.
//

import Foundation
import SwiftUI

struct SearchBar: View {
    @Binding var text: String
    var onSearch: () -> Void
    
    var body: some View {
        HStack {
            TextField("Search", text: $text, onCommit: {
                onSearch()
            })
            .textFieldStyle(RoundedBorderTextFieldStyle())
            
            Button(action: {
                onSearch()
            }) {
                Text("Search")
            }
        }
        .padding()
    }
}

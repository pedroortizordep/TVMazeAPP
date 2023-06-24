//
//  URLImage.swift
//  TVMazeApp
//
//  Created by HITSS on 24/06/23.
//

import Foundation
import SwiftUI

struct URLImage: View {
    let urlString: String
    let height: CGFloat
    let width: CGFloat
    
    var body: some View {
        if let url = URL(string: urlString) {
            AsyncImage(url: url) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: width, height: height)
                    .cornerRadius(8)
            } placeholder: {
                Rectangle()
                    .foregroundColor(.gray)
                    .frame(width: width, height: height)
                    .cornerRadius(8)
            }
        }
    }
}

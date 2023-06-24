//
//  SerieCell.swift
//  TVMazeApp
//
//  Created by HITSS on 24/06/23.
//

import Foundation
import SwiftUI

struct SerieCell: View {
    let serie: Serie

    var body: some View {
        HStack {
            URLImage(urlString: serie.imageUrlMedium, height: 150, width: 130)
            Text(serie.name)
            Spacer()
        }
    }
}

//
//  EpisodeCell.swift
//  TVMazeApp
//

import Foundation
import SwiftUI

struct EpisodeCell: View {
    let episode: EpisodeModel

    var body: some View {
        HStack {
            Text("Episode \(episode.number): \(episode.name)")
            Spacer()
        }
    }
}

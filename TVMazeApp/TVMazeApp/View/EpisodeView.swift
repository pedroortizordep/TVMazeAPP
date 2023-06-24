//
//  SerieDetailView.swift
//  TVMazeApp
//

import SwiftUI
import Foundation

struct EpisodeView: View {
    let episode: EpisodeModel
    
    var body: some View {
        ScrollView {
            VStack {
                URLImage(urlString: episode.image?.original ?? "", height: 200, width: 420)
                
                Text(episode.name)
                    .font(.title)

                Text("S\(episode.season) E\(episode.number)")
                    .font(.title3)

                Text(episode.summary)
                    .font(.title3)
                    .padding()
                
                Spacer()
            }
            .navigationBarTitle(episode.name)
        }
    }
}


//
//  SerieDetailView.swift
//  TVMazeApp
//

import SwiftUI
import Foundation

struct SeriesDetailView: View {
    let serie: Serie
    @StateObject private var viewModel = SerieDetailViewModel()
    
    var body: some View {
        ScrollView {
            VStack {
                URLImage(urlString: serie.imageUrlOriginal, height: 500, width: 420)
                
                Text(serie.name)
                    .font(.title3)
                    .padding()
                
                Text(serie.schedule)
                    .font(.title3)
                    .padding()
                
                Text(serie.genres)
                    .font(.title3)
                    .padding()
                
                Text(serie.summary)
                    .font(.title3)
                    .padding()
                
                ForEach(Array(viewModel.episodes.grouped(by: \.season).keys).sorted(), id: \.self) { season in
                    VStack(alignment: .leading) {
                        Text("SEASON \(season)")
                            .font(.headline)
                            .padding()
                        
                        ForEach(viewModel.episodes.filter { $0.season == season }) { episode in
                            NavigationLink(destination: EpisodeView(episode: episode)) {
                                HStack {
                                    EpisodeCell(episode: episode).padding()
                                }
                            }
                        }
                    }
                }
                
                Spacer()
            }
            .navigationBarTitle(serie.name)
            .onAppear() {
                Task {
                    do {
                        try await viewModel.fetchEpisodes(serieId: serie.serieID)
                    } catch {
                        print("Error")
                    }
                }
            }
        }
    }
}

extension Sequence {
    func grouped<Key: Hashable>(by key: KeyPath<Element, Key>) -> [Key: [Element]] {
        var groups: [Key: [Element]] = [:]
        for element in self {
            let key = element[keyPath: key]
            if case nil = groups[key]?.append(element) {
                groups[key] = [element]
            }
        }
        return groups
    }
}


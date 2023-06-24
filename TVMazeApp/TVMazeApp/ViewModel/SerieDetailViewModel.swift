//
//  SerieDetailViewModel.swift
//  TVMazeApp
//

import Foundation

@MainActor
class SerieDetailViewModel: ObservableObject {
    @Published var episodes: [EpisodeModel] = []
    
    func fetchEpisodes(serieId: Int) async throws {
        guard let url = URL(string: "https://api.tvmaze.com/shows/\(serieId)/episodes") else {
            throw NSError(domain: "Error with URL", code: 0, userInfo: nil)
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        
        let epis = try JSONDecoder().decode([Episode].self, from: data)
        
        episodes = epis.compactMap { episode in
            
            let name = episode.name ?? ""
            let episodeNumber = episode.number ?? 0
            let season = episode.season ?? 0
            let summary = episode.summary ?? ""
            let image = episode.image
            
            return EpisodeModel(name: name, summary: summary, number: episodeNumber, season: season, image: image)
        }
    }
}

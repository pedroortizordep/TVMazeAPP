//
//  SerieViewModel.swift
//  TVMazeApp
//

import Foundation

@MainActor
class SerieViewModel: ObservableObject {
    @Published var series: [Serie] = []
    @Published var searchSerieText = ""
    
    func fetchShows() async throws {
        guard let url = URL(string: "https://api.tvmaze.com/search/shows?q=\(searchSerieText)") else {
            throw NSError(domain: "Error with URL", code: 0, userInfo: nil)
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        
        let shows = try JSONDecoder().decode([Show].self, from: data)
        parseShows(shows: shows)
    }
    
    private func parseShows(shows: [Show]) {
        series = shows.compactMap { show in
            guard let show = show.show else {
                return Serie(serieID: 0, name: "", imageUrlMedium: "", imageUrlOriginal: "", schedule: "", genres: "", summary: "")
            }
            
            let serieID = show.id
            let name = show.name
            let imageUrlMedium = show.image?.medium
            let imageUrlOriginal = show.image?.original
            let time = show.schedule.time ?? ""
            let days = show.schedule.days.joined(separator: ", ")
            let genres = show.genres
            let summary = show.summary ?? ""
            
            var schedule = "\(time) On "
            schedule.append(days)
            
            let genresInfo = genres.joined(separator: ", ")
            
            return Serie(serieID: serieID, name: name, imageUrlMedium: imageUrlMedium ?? "", imageUrlOriginal: imageUrlOriginal ?? "", schedule: schedule, genres: genresInfo, summary: summary)
        }
    }
}

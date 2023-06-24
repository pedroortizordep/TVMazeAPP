//
//  Series.swift
//  TVMazeApp
//

import Foundation
import SwiftUI

struct Serie: Identifiable {
    let id = UUID()
    let serieID: Int
    let name: String
    let imageUrlMedium: String
    let imageUrlOriginal: String
    let schedule: String
    let genres: String
    let summary: String
}

struct Show: Codable {
    let show: ShowDetail?
}

struct ShowDetail: Codable {
    let id: Int
    let name: String
    let image: Poster?
    let schedule: Schedule
    let genres: [String]
    let summary: String?
}

struct Poster: Codable {
    let medium: String
    let original: String
}

struct Schedule: Codable {
    let time: String?
    let days: [String]
}

struct EpisodeModel: Identifiable {
    var id = UUID()
    
    let name, summary: String
    let number, season: Int
    let image: Poster?
}


struct Episode: Codable {
    let name, summary: String?
    let number, season: Int?
    let image: Poster?
}

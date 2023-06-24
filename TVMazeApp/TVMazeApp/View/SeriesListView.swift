//
//  SeriesListView.swift
//  TVMazeApp
//

import Foundation
import SwiftUI

struct SeriesListView: View {
    @StateObject private var viewModel = SerieViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                SearchBar(text: $viewModel.searchSerieText, onSearch: {
                                    Task {
                                        do {
                                            try await viewModel.fetchShows()
                                        } catch {
                                            // Handle error
                                            print("Error fetching movies: \(error)")
                                        }
                                    }
                                })
                
                List(viewModel.series) { serie in
                    NavigationLink(destination: SeriesDetailView(serie: serie)) {
                        HStack {
                            SerieCell(serie: serie)
                        }
                    }
                }.onAppear() {
                    Task {
                        do {
                            try await viewModel.fetchShows()
                        } catch {
                            print("Error")
                        }
                    }
                }
                
                Spacer()
            }
        }
    }
}


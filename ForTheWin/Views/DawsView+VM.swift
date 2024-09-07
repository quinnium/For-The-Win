//
//  DawsView+VM.swift
//  ForTheWin
//
//  Created by Quinn on 06/09/2024.
//

import Foundation

extension DrawsView {
    class ViewModel: ObservableObject {
        
        @Published var allDraws: [String: [Draw]] = [:]
        private var modelDataSource: ModelDataSource
        
        init(modelDataSource: ModelDataSource) {
            self.modelDataSource = modelDataSource
        }
        
        func fetchDraws() async {
            do {
                let fetchedDraws = try await modelDataSource.fetchDraws()
                DispatchQueue.main.async {
                    for draw in fetchedDraws {
                        self.allDraws[draw.gameName, default: []].append(draw)
                    }
                    // Sort each dictionary value (array of draws) by draw date
                    for (key, array) in self.allDraws {
                        self.allDraws[key] = array.sorted { $0.drawDate < $1.drawDate }
                    }
                }
            } catch {
                print("Failed to fetch draws")
            }
        }
    }
}

//
//  DawsView+VM.swift
//  ForTheWin
//
//  Created by Quinn on 06/09/2024.
//

import Foundation

extension DrawsView {
    class ViewModel: ObservableObject {
        
        private var modelDataSource: ModelDataSource
        
        @Published var allDraws: [Draw] = []
        @Published var selectedDrawID: String? = nil
        
        init(modelDataSource: ModelDataSource) {
            self.modelDataSource = modelDataSource
        }
        
        func fetchDraws() async {
            do {
                let fetchedDraws = try await modelDataSource.fetchDraws()
                DispatchQueue.main.async {
                    // Sort by gameName first, then by drawDate
                    self.allDraws = fetchedDraws.sorted {
                        if $0.gameName == $1.gameName {
                            return $0.drawDate < $1.drawDate
                        } else {
                            return $0.gameName < $1.gameName
                        }
                    }
                }
            } catch {
                print("Failed to fetch draws")
            }
        }
    }
}

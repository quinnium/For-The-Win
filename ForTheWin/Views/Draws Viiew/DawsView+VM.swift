//
//  DawsView+VM.swift
//  ForTheWin
//
//  Created by Quinn on 06/09/2024.
//

import Foundation

extension DrawsView {
    final class ViewModel: ObservableObject {
        
        private var modelDataSource: ModelDataSourceProtocol
        @Published var allDraws: [Draw] = []
        @Published var selectedDraw: Draw? = nil
        
        init(modelDataSource: ModelDataSourceProtocol) {
            self.modelDataSource = modelDataSource
        }
        
        func fetchDraws() async {
            do {
                let fetchedDraws = try await modelDataSource.fetchDraws()
                DispatchQueue.main.async {
                    // Sort by gameName first, then by drawDate (most recent first)
                    self.allDraws = fetchedDraws.sorted {
                        if $0.gameName == $1.gameName {
                            return $0.drawDate > $1.drawDate
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

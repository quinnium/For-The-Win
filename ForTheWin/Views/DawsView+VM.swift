//
//  DawsView+VM.swift
//  ForTheWin
//
//  Created by Quinn on 06/09/2024.
//

import Foundation

extension DrawsView {
    class ViewModel: ObservableObject {
        
        @Published var draws: [Draw] = []
        
        var modelDataSource: ModelDataSource
        
        
        init(modelDataSource: ModelDataSource) {
            self.modelDataSource = modelDataSource
        }
        
        func fetchDraws() async {
            do {
                let fectehdDraws = try await modelDataSource.fetchDraws()
                DispatchQueue.main.async {
                    self.draws = fectehdDraws
                }
            } catch {
                print("Failed to fetch draws")
            }
        }
        
    }
}

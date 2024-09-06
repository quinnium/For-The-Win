//
//  ModelDataSource.swift
//  ForTheWin
//
//  Created by Quinn on 05/09/2024.
//

import Foundation

class ModelDataSource {
    
    private let networkManager: NetworkManager
    private let databaseManager: DatabaseManager
    
    init(networkManager: NetworkManager, databaseManager: DatabaseManager) {
        self.networkManager = networkManager
        self.databaseManager = databaseManager
    }
    
    func fetchDraws() async throws -> [Draw] {
        // Try to load Draws from database
        if let savedDraws = await databaseManager.fetchDraws() {
            return savedDraws
        } else {
            // No Draw objects stored in database; download instead
            let downloadedDraws = try await downloadDraws()
            return downloadedDraws
        }
    }
    
    private func downloadDraws() async throws -> [Draw] {
        // Download DrawDTO objects
        let downloadedDTODraws = try await networkManager.getDraws()
        // Convert them to Draw objects
        var draws: [Draw] = []
        for dto in downloadedDTODraws {
            if let draw = Draw(dto: dto) {
                draws.append(draw)
            }
        }
        // Save to database
        await databaseManager.saveDraws(draws)
        return draws
    }
}

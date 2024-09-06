//
//  NetworkManager.swift
//  ForTheWin
//
//  Created by Quinn on 04/09/2024.
//

import Foundation

class NetworkManager {
    
    enum JSONSource {
        case remoteApi
        case localFile
    }
    
    private var jsonSource: JSONSource
    
    init(jsonSource: JSONSource) {
        self.jsonSource = jsonSource
    }
    
    func getDraws() async throws -> [DrawDTO] {
        var data = Data()
        // Get 'data' from respective source depending on 'jsonSource' parameter type chosen
        switch jsonSource {
        case .remoteApi:
            let remoteApiUrl = URLStrings.mockDataApi
            guard let url = URL(string: remoteApiUrl) else { throw FTWError.invalidURL }
            let session = URLSession.shared
            (data, _) = try await session.data(from: url)
        case .localFile:
            guard let url = Bundle.main.url(forResource: "MockDrawsResponse", withExtension: "json") else { throw FTWError.invalidURL }
            data = try Data(contentsOf: url)
        }

        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .formatted(dateFormatter)
        let drawsResponse = try decoder.decode(DrawsResponseDTO.self, from: data)
        return drawsResponse.draws
    }
    
}

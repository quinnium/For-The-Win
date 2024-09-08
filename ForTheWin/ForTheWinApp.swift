//
//  ForTheWinApp.swift
//  ForTheWin
//
//  Created by Quinn on 04/09/2024.
//

import SwiftUI

@main
struct ForTheWinApp: App {
    
    @StateObject var viewModel: DrawsView.ViewModel
    
    init() {
        let networkManager = NetworkManager(jsonSource: .localFile)
        let databaseManager = DatabaseManager()
        let modelDataSource = ModelDataSource(networkManager: networkManager, databaseManager: databaseManager)
        let viewModel = DrawsView.ViewModel(modelDataSource: modelDataSource)
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some Scene {
        WindowGroup {
            DrawsView(viewModel: viewModel)
        }
    }
}

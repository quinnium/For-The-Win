//
//  DrawsView.swift
//  ForTheWin
//
//  Created by Quinn on 06/09/2024.
//

import SwiftUI

struct DrawsView: View {
    
    @ObservedObject var viewModel: ViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Draws")
                .font(.system(size: 34, weight: .bold))
                .padding()
            ScrollView {
                ForEach(viewModel.allDraws, id: \.id) { draw in
                    DrawSummaryView(draw: draw)
                        .padding(.horizontal)
                        .padding(.vertical, 5)
                        .onTapGesture {
                            withAnimation {
                                viewModel.selectedDraw = draw
                            }
                        }

                }
            }
        }
        .blur(radius: viewModel.selectedDraw == nil ? 0 : 3)
        // Blurred overlay (when draw selected)
        .overlay {
            if viewModel.selectedDraw != nil {
                DrawAndTicketContainerView(viewModel: .init(draws: viewModel.allDraws, selectedDraw: viewModel.selectedDraw!, dismissTapped: { viewModel.selectedDraw = nil }))
                    .transition(.opacity)
            }
        }
        .onAppear {
            Task {
                await viewModel.fetchDraws()
            }
        }
    }
}

#Preview {
    let networkManager = NetworkManager(jsonSource: .localFile)
    let databaseManager = DatabaseManager()
    let modelDataSource = ModelDataSource(networkManager: networkManager, databaseManager: databaseManager)
    let viewModel = DrawsView.ViewModel(modelDataSource: modelDataSource)
    return DrawsView(viewModel: viewModel)
}

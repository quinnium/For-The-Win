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
        List {
            ForEach(viewModel.allDraws, id: \.id) { draw in
                VStack {
                    HStack {
                        Text(draw.drawDate.formatted(date: .long, time: .omitted))
                        Spacer()
                        Text(draw.gameName)
                            .font(.caption)
                            .foregroundStyle(.gray)
                    }
                    HStack {
                        Text("Jackpot: £\(draw.topPrize)")
                            .font(.caption)
                            .foregroundStyle(.gray)
                        Spacer()
                    }
                }
                .onTapGesture {
                    withAnimation {
                        viewModel.selectedDrawID = draw.id
                    }
                }
            }
        }
        .blur(radius: viewModel.selectedDrawID == nil ? 0 : 3)
        
        .overlay {
            if let selectedDrawID = viewModel.selectedDrawID {
                DrawDetailContainerView(viewModel: .init(draws: viewModel.allDraws, 
                                                         selectedDrawID: selectedDrawID,
                                                         dismissTapped: { viewModel.selectedDrawID = nil }))
    
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

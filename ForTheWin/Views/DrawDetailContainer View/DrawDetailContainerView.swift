//
//  DrawDetailContainerView.swift
//  ForTheWin
//
//  Created by Quinn on 07/09/2024.
//

import SwiftUI

struct DrawDetailContainerView: View {
    
    @StateObject var viewModel: ViewModel
    
    var body: some View {
        ZStack {
            // Background shading
            Rectangle()
                .ignoresSafeArea()
                .foregroundStyle(.black).opacity(0.4)
                .onTapGesture {
                    viewModel.dismissTapped()
                }
            // Tabview showing Draws
            TabView(selection: $viewModel.selectedDrawID) {
                ForEach(viewModel.draws, id: \.id) { draw in
                    DrawDetailView(draw: draw)
                }
            }
            .tabViewStyle(.page(indexDisplayMode: .always))
            .indexViewStyle(.page(backgroundDisplayMode: .always))
            .frame(height: 300)
            .background {
                ZStack {
                    Color(uiColor: .systemBackground)
                    Color.green.opacity(0.5)
                }
            }
            .clipShape(RoundedRectangle(cornerRadius: 20))
            // Close button
            .overlay(alignment: .topTrailing) {
                Image(systemName: "x.circle.fill")
                    .resizable()
                    .frame(width: 30, height: 30)
                    .foregroundStyle(.gray)
                    .onTapGesture {
                        viewModel.dismissTapped()
                    }
                    .offset(x: -10, y: 10)
            }
            .padding(.horizontal)
        }
    }
}

#Preview {
    @State var draw: Draw = MockObjects.draw

    return DrawDetailContainerView(viewModel: .init(draws: [draw], selectedDrawID: draw.id, dismissTapped: {}))
}

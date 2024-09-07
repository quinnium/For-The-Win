//
//  DrawDetailContainerView.swift
//  ForTheWin
//
//  Created by Quinn on 07/09/2024.
//

import SwiftUI

struct DrawDetailContainerView: View {
    
    @StateObject var viewModel: ViewModel
    @State var ticketVisible = false
    
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
            ZStack {
                Color(uiColor: .systemBackground)
                Color.green.opacity(0.5)
                TabView(selection: $viewModel.selectedDraw) {
                    ForEach(viewModel.draws, id: \.self) { draw in
                        DrawDetailView(draw: draw)
                    }
                }
            }
            .tabViewStyle(.page(indexDisplayMode: .always))
            .indexViewStyle(.page(backgroundDisplayMode: .always))
            .frame(height: 300)
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
        .overlay(alignment: .bottom) {
            DrawTicketView(viewModel: .init(draw: viewModel.selectedDraw))
                .offset(y: ticketVisible ? 0 : 400)
                .animation(.easeInOut(duration: 0.5), value: ticketVisible)
        }
        .ignoresSafeArea()
        .onAppear {
            ticketVisible = true
        }
    }
}

#Preview {
    @State var draw: Draw = MockObjects.draw

    return DrawDetailContainerView(viewModel: .init(draws: [draw], selectedDraw: draw, dismissTapped: {}))
}

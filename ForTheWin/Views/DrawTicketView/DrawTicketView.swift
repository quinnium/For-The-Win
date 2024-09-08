//
//  DrawTicketView.swift
//  ForTheWin
//
//  Created by Quinn on 07/09/2024.
//

import SwiftUI

struct DrawTicketView: View {
    
    @ObservedObject var viewModel: ViewModel
    @State var offset: CGFloat = 400
    
    var body: some View {
        ZStack {
            Color(uiColor: .systemBackground)
            Color.pink.opacity(0.3)
            VStack(spacing: 20) {
                // 'My Ticket' heading
                HStack {
                    Text("My Ticket")
                        .font(.title)
                        .bold()
                        .offset(y: -20)
                    Spacer()
                }
                // Ticket numbers
                HStack(spacing: 25) {
                    ForEach(viewModel.ticketNumbers, id: \.self) { number in
                        let winningNumber = viewModel.isWinningNumber(number)
                        Text(String(number))
                            .foregroundStyle(winningNumber ? Color.green : Color.primary)
                            .brightness(winningNumber ? -0.2 : -0.1)
                            .bold(winningNumber ? true : false)
                            .font(.title2)
                            // Circle overlay to show if winning number
                            .overlay {
                                if winningNumber {
                                    Circle()
                                        .stroke(Color.green, lineWidth: 5)
                                        .foregroundStyle(Color.clear)
                                        .frame(width: 45, height: 45)
                                }
                            }
                    }
                    .frame(width: 40)
                }
                // Text describing win status
                Text(viewModel.winningStatusString)
                    .multilineTextAlignment(.center)
                    .font(.body)
                    .frame(height: 50)
            }
            .padding(.horizontal)
        }
        .clipShape(UnevenRoundedRectangle(cornerRadii: .init(topLeading: 20, bottomLeading: 0, bottomTrailing: 0, topTrailing: 20)))
        .frame(maxHeight: 250)
        .padding(.horizontal)
        .offset(y: offset)
        .animation(.easeOut(duration: 1), value: offset)
        .onAppear {
            offset = 0
        }
    }
}

#Preview {
    DrawTicketView(viewModel: .init(draw: MockObjects.draw, ticket: DrawTicket()))
}

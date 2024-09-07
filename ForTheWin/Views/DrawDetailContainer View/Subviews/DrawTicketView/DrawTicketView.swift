//
//  DrawTicketView.swift
//  ForTheWin
//
//  Created by Quinn on 07/09/2024.
//

import SwiftUI

struct DrawTicketView: View {
    
    @ObservedObject var viewModel: ViewModel

    var body: some View {
        ZStack(alignment: .top) {
            Color(uiColor: .systemBackground)
            Color.pink.opacity(0.3)
            VStack(spacing: 40) {
                HStack {
                    Text("My Ticket")
                        .font(.title)
                        .bold()
                        .offset(x: 15, y: 10)
                    Spacer()
                }
                HStack(spacing: 25) {
                    ForEach(viewModel.ticket.numbers.sorted(), id: \.self) { number in
                        let winningNumber = viewModel.draw.numbers.contains(number)
                        Text(String(number))
                            .foregroundStyle(winningNumber ? Color.green : Color.gray)
                            .brightness(winningNumber ? -0.2 : -0.1)
                            .bold(winningNumber ? true : false)
                            .font(.title)
                            .overlay {
                                if winningNumber {
                                    Circle()
                                        .stroke(Color.green, lineWidth: 5)
                                        .foregroundStyle(Color.clear)
                                        .frame(width: 50, height: 50)
                                }
                            }
                    }
                    .frame(width: 40)
                }
                Text(viewModel.winningStatusString)
                    .multilineTextAlignment(.center)
                    .font(.title2)
                    .padding(.horizontal)
            }

        }
        .clipShape(UnevenRoundedRectangle(cornerRadii: .init(topLeading: 30, bottomLeading: 0, bottomTrailing: 0, topTrailing: 30)))
        .frame(maxHeight: 250)
        .padding(.horizontal)
    }
}

#Preview {
    DrawTicketView(viewModel: .init(draw: MockObjects.draw))
}

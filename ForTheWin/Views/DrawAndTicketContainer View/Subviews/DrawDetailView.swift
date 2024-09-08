//
//  DrawDetailView.swift
//  ForTheWin
//
//  Created by Quinn on 07/09/2024.
//

import SwiftUI

struct DrawDetailView: View {
    
    let draw: Draw
    
    var body: some View {
        VStack(spacing: 10) {
            // Game Name
            Text(draw.gameName)
                .font(.largeTitle)
                .bold()
                .foregroundStyle(.red)
            // Game Date
            Text("Draw date: \(draw.drawDate.formatted(date: .long, time: .omitted))")
                .bold()
            // Numbers / balls
            HStack {
                // Normal balls
                ForEach(Array(draw.numbers).sorted(), id: \.self) { number in
                    DrawBallView(number: number, bonusBall: false)
                }
                // Bonus balls
                ForEach(Array(draw.bonusBalls).sorted(), id: \.self) { bonusNumber in
                    DrawBallView(number: bonusNumber, bonusBall: true)
                }
            }
            .padding(.vertical)
            // Top Prize
            Text("Top Prize: £\(draw.topPrize)")
        }
        .padding()
    }
}

#Preview {
    DrawDetailView(draw: MockObjects.draw)
}

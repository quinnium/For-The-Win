//
//  DrawDetailView.swift
//  ForTheWin
//
//  Created by Quinn on 07/09/2024.
//

import SwiftUI

struct DrawDetailView: View {
    
    @State var draw: Draw
    
    var body: some View {
        
        VStack(spacing: 10) {
            Text(draw.gameName)
                .font(.largeTitle)
                .bold()
                .foregroundStyle(.red)
            Text("Draw date: \(draw.drawDate.formatted(date: .long, time: .omitted))")
                .bold()
            
            
            HStack {
                ForEach(Array(draw.numbers).sorted(), id: \.self) { number in
                    DrawBallView(number: number, bonusBall: false)
                }
                ForEach(Array(draw.bonusBalls).sorted(), id: \.self) { bonusNumber in
                    DrawBallView(number: bonusNumber, bonusBall: true)
                }
            }
            .padding(.vertical)
            Text("Top Prize: £\(draw.topPrize)")
            
        }
        .padding()
    }
}

#Preview {
    DrawDetailView(draw: MockObjects.draw)
}

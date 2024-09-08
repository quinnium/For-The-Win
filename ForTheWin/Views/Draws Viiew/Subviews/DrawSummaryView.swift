//
//  DrawSummaryView.swift
//  ForTheWin
//
//  Created by Quinn on 08/09/2024.
//

import SwiftUI

struct DrawSummaryView: View {
    
    let draw: Draw
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(draw.drawDate.formatted(date:.long, time: .omitted))
                    .bold()
                Spacer()
                Text(draw.gameName)
                    .font(.title3)
                    .bold()
                    .foregroundStyle(.red)
            }
            Text("Top Prize: £\(draw.topPrize)")
                .font(.callout)
                .opacity(0.7)
        }
        .padding(20)
        .background {
            Color.green.opacity(0.5)
            .clipShape(RoundedRectangle(cornerRadius: 10))
        }
        .accessibilityElement()
        .accessibilityLabel(draw.drawDate.formatted(date: .complete, time: .omitted) + draw.gameName)
        .accessibilityAddTraits(.isButton)
        
    }
}

#Preview {
    DrawSummaryView(draw: MockObjects.draw)
}

//
//  DrawBallView.swift
//  ForTheWin
//
//  Created by Quinn on 07/09/2024.
//

import SwiftUI

struct DrawBallView: View {
    
    @State private var showNumber = false
    let number: Int
    let bonusBall: Bool

       var body: some View {
           ZStack {
               // Ball
               Circle()
                   .fill(
                       RadialGradient(
                        gradient: Gradient(colors: [.white, bonusBall ? .red : .yellow]),
                           center: .topLeading,
                           startRadius: 5,
                           endRadius: 40
                       )
                   )
                   .frame(width: 40, height: 40)
                   .shadow(color: .gray.opacity(0.5), radius: 10, x: 0, y: 0)

               // Number
               Text(String(number))
                   .foregroundColor(.black)
                   .offset(y: showNumber ? 0 : -15)
                   .opacity(showNumber ? 1 : 0)
                   .animation(.easeInOut(duration: 1.0).delay(Double.random(in: 0.0...0.3)), value: showNumber)
           }
           .onAppear {
               showNumber = true
           }
       }
}

#Preview {
    DrawBallView(number: 18, bonusBall: true)
}

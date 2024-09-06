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
        VStack {
            Text("View loaded")
            List(viewModel.draws, id: \.id) { draw in
                Text(draw.numbers.description)
            }
        }
        .onAppear {
            Task {
                await viewModel.fetchDraws()
            }
        }
    }
}

//#Preview {
//    DrawsView()
//}

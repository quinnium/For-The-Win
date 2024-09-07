//
//  DrawDetailContainerView+VM.swift
//  ForTheWin
//
//  Created by Quinn on 07/09/2024.
//

import Foundation

extension DrawDetailContainerView {
    class ViewModel: ObservableObject {
        
        let draws: [Draw]
        @Published var selectedDraw: Draw
        let dismissTapped: () -> Void
        
        init(draws: [Draw], selectedDraw: Draw, dismissTapped: @escaping () -> Void) {
            self.draws = draws
            self.selectedDraw = selectedDraw
            self.dismissTapped = dismissTapped
        }
    }
}

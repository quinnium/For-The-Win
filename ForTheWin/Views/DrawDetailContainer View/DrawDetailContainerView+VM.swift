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
        @Published var selectedDrawID: String
        let dismissTapped: () -> Void
        
        init(draws: [Draw], selectedDrawID: String, dismissTapped: @escaping () -> Void) {
            self.draws = draws
            self.selectedDrawID = selectedDrawID
            self.dismissTapped = dismissTapped
        }
    }
}

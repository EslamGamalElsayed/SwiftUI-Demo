//
//  DetailsViewModel.swift
//  SwiftUIDemo
//
//  Created by Eslam Gamal on 16/05/2025.
//

import Foundation

final class DetailsViewModel: ObservableObject {
    private let navigate: (() -> Void)?
    let id: Int
    
    init(navigate: (() -> Void)? = nil, id: Int) {
        self.navigate = navigate
        self.id = id
    }

    func goToHome() {
        guard let navigate = navigate else { return }
        navigate()
    }
}

//
//  HomeViewModel.swift
//  SwiftUIDemo
//
//  Created by Eslam Gamal on 16/05/2025.
//

import Foundation

final class HomeViewModel: ObservableObject {
    private let navigate: ((AppRoute) -> Void)?

    init(navigate: ((AppRoute) -> Void)? = nil) {
        self.navigate = navigate
    }

    func goToDetails() {
        guard let navigate = navigate else { return }
        navigate(.DETAILS(id: 123))
    }
}

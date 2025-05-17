//
//  BaseViewModelProtocol.swift
//  SwiftUIDemo
//
//  Created by Eslam Gamal on 17/05/2025.
//

import Foundation

protocol BaseViewModelProtocol: ObservableObject {
    @MainActor func onAppear()
    func onDisappear()
}

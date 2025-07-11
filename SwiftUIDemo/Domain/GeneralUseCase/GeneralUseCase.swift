//
//  GeneralUseCase.swift
//  SwiftUIDemo
//
//  Created by Eslam Gamal on 16/05/2025.
//

import Foundation

protocol GeneralUseCase {
    func execute<T: Codable>(with data: Any?) async throws -> T
}

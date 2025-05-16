//
//  NetworkManagerProtocol.swift
//  Shipper
//
//  Created by Eslam Gamal on 28/10/2024.
//

import Foundation

typealias CompletionHandler<T: Codable> = (Result<BaseResponse<T>, BaseError>) -> Void

protocol NetworkManagerProtocol {
    func request<T: Codable>(request: APIRequest, completion: @escaping CompletionHandler<T>)
}

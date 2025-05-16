//
//  NetworkManager.swift
//  Shipper
//
//  Created by Eslam Gamal on 28/10/2024.
//

import Foundation


class NetworkManager: NetworkManagerProtocol {
    
    // MARK: - Request
    func request<T: Codable>(request: APIRequest, completion: @escaping CompletionHandler<T>) {
        guard let url = request.url else {return}
        var urlRequest = URLRequest(url: url)
        setupMethodType(for: &urlRequest, with: request)
        setupHeaders(for: &urlRequest, with: request)
        setupParameters(for: &urlRequest, with: request, url, completion: completion)
        
        URLSession.shared.dataTask(with: urlRequest) { [weak self] data, response, error in
            self?.printForDebug(request, data: data, response: response, error: error)
            if let error = error as NSError? {
                self?.handleUrlSessionError(request, response, with: error, completion: completion)
                return
            }
            
            guard let data = data, !data.isEmpty else {
                completion(.failure(BaseError(errorCode: ErrorCode.UNKNOWN_ERROR.rawValue)))
                return
            }
            
            let decoder = JSONDecoder()
            do {
                let decodedData = try decoder.decode(BaseResponse<T>.self, from: data)
                self?.handleDecodeDataSuccessa(for: decodedData, request: request, response: response, completion: completion)
            } catch let decodeError {
                print("Decoding error: \(decodeError)")
                completion(.failure(BaseError(errorCode: ErrorCode.UNKNOWN_ERROR.rawValue)))
            }
        }.resume()
    }
    
    // MARK: - Setup
    internal func setupMethodType(for urlRequest: inout URLRequest, with request: APIRequest) {
        urlRequest.httpMethod = request.method.rawValue
    }
    
    internal func setupHeaders(for urlRequest: inout URLRequest, with request: APIRequest) {
        if let headers = request.headers {
            for (key, value) in headers {
                urlRequest.setValue(value, forHTTPHeaderField: key)
            }
        }
    }
    
    private func setupParameters<T: Codable>(for urlRequest: inout URLRequest, with request: APIRequest, _  url: URL, completion: @escaping CompletionHandler<T>)  {
        if let parameters = request.parameters {
            switch request.parameterEncoding {
            case .url:
                var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: false)
                urlComponents?.queryItems = parameters.map { URLQueryItem(name: $0.key, value: "\($0.value)") }
                urlRequest.url = urlComponents?.url
                
            case .json:
                do {
                    urlRequest.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: [])
                    urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
                } catch {
                    completion(.failure(BaseError(errorCode: ErrorCode.UNKNOWN_ERROR.rawValue)))
                    return
                }
            }
        }
    }
    
    // MARK: - Handle Error
    private func handleUrlSessionError<T: Codable>(_ request: APIRequest, _ response: URLResponse?, with error: NSError, completion: @escaping CompletionHandler<T>) {
        switch error.code {
        case NSURLErrorTimedOut:
            completion(.failure(BaseError(errorCode: ErrorCode.TIME_OUT.rawValue)))
        case NSURLErrorNotConnectedToInternet, NSURLErrorNetworkConnectionLost:
            completion(.failure(BaseError(errorCode: ErrorCode.INTERNET_CONNECTION_ERROR.rawValue)))
        default:
            completion(.failure(BaseError(errorCode: ErrorCode.UNKNOWN_ERROR.rawValue)))
        }
        return
    }
    
    // MARK: - Decode Data
    private func handleDecodeDataSuccessa<T: Codable>(for decodedData: BaseResponse<T>, request: APIRequest, response: URLResponse?, completion: @escaping CompletionHandler<T>) {
        if decodedData.isSuccess {
            completion(.success(decodedData))
        }
        else {
            completion(.failure(BaseError(errors: decodedData.errors, validation: decodedData.validation)))
        }
    }
    
    // MARK: - Debug Print
    internal func printForDebug(_ request: APIRequest, data: Data? = nil, response: URLResponse?, error: Error?) {
        print("REQUEST --> .............................................................")
        print("REQUEST --> url --> ",request.url?.absoluteString ?? "")
        print("REQUEST --> method --> ",request.method.rawValue)
        print("REQUEST --> headers --> ",request.headers ?? [:])
        print("REQUEST --> parameterEncoding --> ", request.parameterEncoding)
        print("REQUEST --> parameterEncoding --> ", request.parameters ?? [:])
        print("REQUEST --> statusCode --> ", (response as? HTTPURLResponse)?.statusCode ?? 0)
        print("REQUEST --> urlSessionError --> ", error?.localizedDescription ?? "")
        print("REQUEST --> data --> ", String(data: data ?? Data(), encoding: .utf8) ?? "")
    }
}
    

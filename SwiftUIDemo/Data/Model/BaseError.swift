//
//  BaseError.swift
//  Shipper
//
//  Created by Eslam Gamal on 03/11/2024.
//

import Foundation
struct BaseError: Error {
    
    var errors: [CustomError]?
    var validation: JSONValue?
    
    init(errors: [CustomError]?, validation: JSONValue?) {
        self.errors = errors
        self.validation = validation
    }
    
    init(errorCode: Int){
        self.errors = [CustomError(codeStatus: errorCode)]
    }
    
    init(codeStatus: Int, message: String , uuid: String ){
        self.errors = [CustomError(codeStatus: codeStatus, message: message, uuid: uuid)]
    }
    
    func getErrorMessage() -> String {
        let errorCode = ErrorCode(rawValue: errors?.first?.code ?? ErrorCode.UNKNOWN_ERROR.rawValue)
        switch errorCode?.getErrorCategory() {
        case .AUTHENTICATION_ERROR :
            return "Invalid credentials. Please try again."
        case .INTERNET_CONNECTION :
            return "We couldn't complete your request due to an internet connection loss. Please try again."
        case .SHIPMENT_DESTINATION :
            return "The shipping address provided has failed our address validation."
        case .ACTION_NOT_PERMITTED :
            return "Action not permitted"
        case .SHIPMENT_METHODS :
            return "No shipment methods found"
        case .CORRUPTED_SHIPMENT_LABEL :
            return "Faild to generate the shipping label, please try again later"
        case .UNKNWON :
            return "Something went wrong, please try again later."
        default :
            return  errors?.first?.message ?? "Something went wrong, please try again later."
        }
    }
    
}

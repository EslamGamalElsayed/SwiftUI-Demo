//
//  ErrorCode.swift
//  Shipper
//
//  Created by Eslam Gamal on 03/11/2024.
//

import Foundation
enum ErrorCode: Int {
    case INTERNET_CONNECTION_ERROR  = -1
    case UNKNOWN_ERROR              = 10
    case TIME_OUT                   = -3
    case USER_NOT_FOUND             = 5
    case ACCOUNT_NOT_FOUND          = 43
    case ACCOUNT_INACTIVE           = 1
    case ACCOUNT_CLOSED             = 2
    case ACCOUNT_LOCKED             = 3
    case USER_DELETED               = 6
    case USER_DEACTIVATED           = 7
    case USER_INACTIVE              = 9
    case STORE_NOT_FOUND            = 20
    case STORE_INACTIVE             = 22
    case STORE_NOT_VERIFIED         = 27
    case TOKEN_EXPIRED              = 11
    case TOKEN_INVALID              = 12
    case USER_NOT_AUTHENTICATED     = 32
    case USER_UNDER_INDEPENDANT_STORE = 395
    case SHIPMENT_DESTINATION_NOT_FOUND = 23
    case SMARTY_STREETS_INVALID_INPUTS = 252
    case OPERATOR_NOT_FOUND = 34
    case OPERATOR_BLOCKED = 50
    case DATABASE_ERROR = 18
    case UNAUTHORIZED_ACCESS = 15
    case ACTION_NOT_PERMITTED = 48
    case SHIPMENT_API_KEY_NOT_FOUND = 110
    case NO_SHIPMENT_METHODS_FOUND = 187
    case SHIPMET_TOKEN_AUTHENTICATION_FAILED = 340
    case NO_SHIPMENT_CARRIER_ACCOUNT_WAS_FOUND = 348
    case ADMIN_NOT_FOUND = 97
    case SHIPMENT_TOKEN_AUTHENTICATION_FAILED = 40
    case CORRUPTED_SHIPMENT_LABEL = 277
    case PAYMENT_GATEWAY_ERROR = 65
    case SHIPMENT_GATEWAY_ERROR = 67
    case REFUND_ERROR = 342
    case TRANSACTION_ERROR = 385
    case HTTP_SUCCESS_STATUS_CODE = 200
    case SIGNATURE_IS_REQUIRED = 269
    
    func getErrorCategory() -> ErrorCategory {
        switch self {
        case .INTERNET_CONNECTION_ERROR
            ,.TIME_OUT :
            return .INTERNET_CONNECTION
        case .USER_NOT_FOUND,
                .ACCOUNT_NOT_FOUND,
                .ACCOUNT_INACTIVE,
                .ACCOUNT_CLOSED,
                .ACCOUNT_LOCKED,
                .USER_DELETED,
                .USER_DEACTIVATED,
                .USER_INACTIVE,
                .STORE_INACTIVE,
                .STORE_NOT_FOUND,
                .STORE_NOT_VERIFIED,
                .OPERATOR_NOT_FOUND,
                .OPERATOR_BLOCKED,
                .USER_UNDER_INDEPENDANT_STORE:
            return .AUTHENTICATION_ERROR
        case .SHIPMENT_DESTINATION_NOT_FOUND,
                .SMARTY_STREETS_INVALID_INPUTS :
            return .SHIPMENT_DESTINATION
        case .ACTION_NOT_PERMITTED :
            return .ACTION_NOT_PERMITTED
        case .NO_SHIPMENT_METHODS_FOUND :
            return .SHIPMENT_METHODS
        case .CORRUPTED_SHIPMENT_LABEL :
            return .CORRUPTED_SHIPMENT_LABEL
        case .UNKNOWN_ERROR,
                .SHIPMENT_API_KEY_NOT_FOUND,
                .SHIPMET_TOKEN_AUTHENTICATION_FAILED,
                .NO_SHIPMENT_CARRIER_ACCOUNT_WAS_FOUND,
                .SHIPMENT_TOKEN_AUTHENTICATION_FAILED
            :
            return .UNKNWON
        default :
            return .API_ERROR
        }
        
    }
    
}

enum ErrorCategory {
    case AUTHENTICATION_ERROR
    case INTERNET_CONNECTION
    case UNKNWON
    case API_ERROR
    case SHIPMENT_DESTINATION
    case SHIPMENT_METHODS
    case ACTION_NOT_PERMITTED
    case CORRUPTED_SHIPMENT_LABEL
}

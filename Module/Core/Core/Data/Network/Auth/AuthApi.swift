//
//  AuthApi.swift
//  Core
//
//  Created by MacBook on 24/05/21.
//

import Foundation
import Moya

public enum AuthApi {
    case login(email: String, password: String)
    case refreshToken(email: String, refreshToken: String)
    case signup(username: String, email: String, password: String)
    case activate(email: String, otp: String)
    case setPin(pin: String)
}

extension AuthApi: TargetType {
    
    public var baseURL: URL {
        return URL(string: AppConstant.baseUrl)!
    }
    
    public var path: String {
        switch self {
        case .login:
            return "/auth/login"
        case .signup:
            return "/auth/signup"
        case .setPin:
            return "/auth/PIN"
        case .activate(let email, let otp):
            return "/auth/activate/\(email)/\(otp)"
        case .refreshToken:
            return "/auth/refresh-token"
        }
    }
    
    public var method: Moya.Method {
        switch self {
        case .login:
            return .post
        case .signup:
            return .post
        case .setPin:
            return .patch
        case .activate:
            return .get
        case .refreshToken:
            return .post
        }
    }
    
    public var task: Task {
        switch self {
        case .login(let email, let password):
            return .requestParameters(parameters: ["email": email, "password": password], encoding: JSONEncoding.default)
        case .signup(let username, let email, let password):
            return .requestParameters(parameters: ["username": username, "email": email, "password": password], encoding: JSONEncoding.default)
        case .setPin(let pin):
            return .requestParameters(parameters: ["PIN": pin], encoding: JSONEncoding.default)
        case .activate:
            return .requestPlain
        case .refreshToken(email: let email, refreshToken: let refreshToken):
            return .requestParameters(parameters: ["email": email, "refreshToken": refreshToken], encoding: JSONEncoding.default)
        }
    }
    
    public var headers: [String : String]? {
        let token: String = UserDefaultHelper.shared.get(key: .userToken) ?? ""
        switch self {
        case .setPin:
            return [
                "Content-Type" : "application/json",
                "Authorization" : "Bearer \(token)"
            ]
        case .refreshToken:
            return [
                "Content-Type" : "application/json",
                "Authorization" : "Bearer \(token)"
            ]
        default:
            return [
                "Content-Type" : "application/json"
            ]
        }
    }
    
    public var sampleData: Data {
        return Data()
    }
}

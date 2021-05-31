//
//  AuthNetworkManagerImpl.swift
//  Core
//
//  Created by MacBook on 24/05/21.
//

import Foundation
import Moya

public class AuthNetworkManagerImpl: AuthNetworkManager {
    
    public init() {
        
    }
    
    public func login(email: String, password: String, completion: @escaping (LoginResponse?, Error?) -> ()) {
        let provider = MoyaProvider<AuthApi>()
        provider.request(.login(email: email, password: password)) { response in
            switch response {
            case .success(let result):
                let decoder = JSONDecoder()
                do {
                    let loginResponse = try decoder.decode(LoginResponse.self, from: result.data)
                    completion(loginResponse, nil)
                } catch let error {
                    completion (nil, error)
                }
            case .failure(let error):
                completion(nil, error)
            }
        }
    }
    
    public func signup(username: String, email: String, pasword: String, completion: @escaping (SignUpResponse?, Error?) -> ()) {
        let provider = MoyaProvider<AuthApi>(isRefreshToken: true)
        provider.request(.signup(username: username, email: email, password: pasword)) { response in
            switch response {
            case .success(let result):
                let decoder = JSONDecoder()
                do {
                    let signUpResponse = try decoder.decode(SignUpResponse.self, from: result.data)
                    completion(signUpResponse, nil)
                } catch let error {
                    completion (nil, error)
                }
            case .failure(let error):
                completion(nil, error)
            }
        }
    }
    
    public func setPin(pin: String, completion: @escaping (CommonResponse?, Error?) -> ()) {
        let provider = MoyaProvider<AuthApi>()
        provider.request(.setPin(pin: pin)) { (response) in
            switch response {
            case .success(let result):
                let decoder = JSONDecoder()
                do {
                    let setPinResponse = try decoder.decode(CommonResponse.self, from: result.data)
                    completion(setPinResponse, nil)
                } catch let error {
                    completion(nil, error)
                }
            case .failure(let error):
                completion(nil, error)
            }
        }
    }
    
    public func activateToken(email: String, otp: String, completion: @escaping (CommonResponse?, Error?) -> ()) {
        let provider = MoyaProvider<AuthApi>()
        provider.request(.activate(email: email, otp: otp)) { (response) in
            switch response {
            case .success(let result):
                let decoder = JSONDecoder()
                do {
                    let activateResponse = try decoder.decode(CommonResponse.self, from: result.data)
                    completion(activateResponse, nil)
                } catch let error {
                    completion(nil, error)
                }
            case .failure(let error):
                completion(nil, error)
            }
        }
    }
    
    public func refreshToken(email: String, refreshToken: String, completion: @escaping (RefreshTokenResponse?, Error?) -> ()) {
        let provider = MoyaProvider<AuthApi>()
        provider.request(.refreshToken(email: email, refreshToken: refreshToken)) { (response) in
            switch response {
            case .success(let result):
                let decoder = JSONDecoder()
                do {
                    let refreshTokenResponse = try decoder.decode(RefreshTokenResponse.self, from: result.data)
                    completion(refreshTokenResponse, nil)
                } catch let error {
                    completion(nil, error)
                }
            case .failure(let error):
                completion(nil, error)
            }
        }
    }
}

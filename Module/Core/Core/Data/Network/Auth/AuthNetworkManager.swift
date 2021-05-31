//
//  AuthNetworkProtocol.swift
//  Core
//
//  Created by MacBook on 24/05/21.
//

import Foundation

public protocol AuthNetworkManager {
    func login(email: String, password: String, completion: @escaping (LoginResponse?, Error?) -> ())
    func refreshToken(email: String, refreshToken: String, completion: @escaping (RefreshTokenResponse?, Error?) -> ())
    func signup(username: String, email: String, pasword: String, completion: @escaping (SignUpResponse?, Error?) -> ())
    func setPin(pin: String, completion: @escaping (CommonResponse?, Error?) -> ())
    func activateToken(email: String, otp: String, completion: @escaping (CommonResponse?, Error?) -> ())
}

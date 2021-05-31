//
//  ContactApi.swift
//  Core
//
//  Created by MacBook on 27/05/21.
//

import Foundation
import Moya

public enum TransferApi {
    case getAllContact
    case transfer(pin: String, receiver: Int, amount: Int, notes: String)
}

extension TransferApi: TargetType {
    
    public var baseURL: URL {
        return URL(string: AppConstant.baseUrl)!
    }
    
    public var path: String {
        switch self {
        case .getAllContact:
            return "/tranfer/contactUser"
        case .transfer:
            return "/tranfer/newTranfer"
        }
    }
    
    public var method: Moya.Method {
        switch self {
        case .getAllContact:
            return .get
        case .transfer:
            return .post
        }
    }
    
    public var task: Task {
        switch self {
        case .getAllContact:
            return .requestPlain
        case .transfer(_,let receiver, let amount, let notes):
            return .requestParameters(parameters: ["receiver": receiver, "amount": amount, "notes": notes], encoding: JSONEncoding.default)
        }
    }
    
    public var headers: [String : String]? {
        let token: String = UserDefaultHelper.shared.get(key: .userToken) ?? ""
        switch self {
        case .getAllContact:
            return [
                "Content-Type" : "application/json",
                "Authorization" : "Bearer \(token)"
            ]
        case .transfer(let pin, _, _ , _):
            return [
                "Content-Type" : "application/json",
                "Authorization" : "Bearer \(token)",
                "x-access-PIN" : "\(pin)"
            ]
        }
    }
    
    public var sampleData: Data {
        return Data()
    }
}

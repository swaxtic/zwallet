//
//  InvoiceApi.swift
//  Core
//
//  Created by MacBook on 24/05/21.
//

import Foundation
import Moya

public enum InvoiceApi {
    case getThisWeekInvoice
    case getAllInvoice
}

extension InvoiceApi: TargetType {
    public var baseURL: URL {
        return URL(string: AppConstant.baseUrl)!
    }
    
    public var path: String {
        switch self {
        case .getAllInvoice, .getThisWeekInvoice:
            return "/home/getAllInvoice"
        }
    }
    
    public var method: Moya.Method {
        return .get
    }
    
    public var sampleData: Data {
        return Data()
    }
    
    public var task: Task {
        switch self {
        case .getThisWeekInvoice:
            return .requestParameters(parameters: ["thisweek":true], encoding: URLEncoding.queryString) // untuk url param menggunakan menggunakan URLEncoding (?thisweek=true)
        case .getAllInvoice:
            return .requestPlain
        }
    }
    
    public var headers: [String : String]? {
        let token: String = UserDefaultHelper.shared.get(key: .userToken) ?? ""
        return [
            "Content-Type" : "application/json",
            "Authorization" : "Bearer \(token)"
        ]
    }
}



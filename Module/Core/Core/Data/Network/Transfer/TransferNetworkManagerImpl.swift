//
//  TransferNetworkManagerImpl.swift
//  Core
//
//  Created by MacBook on 27/05/21.
//

import Foundation
import Moya

public class TransferNetworkManagerImpl: TransferNetworkManager {
    
    public init () {
    }
    
    public func getAllContact(completion: @escaping (ContactResponse?, Error?) -> ()) {
        let provider = MoyaProvider<TransferApi>(isRefreshToken: true)
        provider.request(.getAllContact) { (response) in
            switch response {
            case .success(let result):
                let decoder = JSONDecoder()
                do {
                    let contactResponse = try decoder.decode(ContactResponse.self, from: result.data)
                    completion(contactResponse, nil)
                } catch let error {
                    completion (nil, error)
                }
            case .failure(let error):
                completion(nil, error)
            }
        }
    }
    
    public func transfer(pin: String, receiver: Int, amount: Int, notes: String, completion: @escaping (TransferResponse?, Error?) -> ()) {
        let provider = MoyaProvider<TransferApi>(isRefreshToken: true)
        provider.request(.transfer(pin: pin, receiver: receiver, amount: amount, notes: notes)) { (response) in
            switch response {
            case .success(let result):
                let decoder = JSONDecoder()
                do {
                    let transferResponse = try decoder.decode(TransferResponse.self, from: result.data)
                    completion(transferResponse, nil)
                } catch let error {
                    completion (nil, error)
                }
            case .failure(let error):
                completion(nil, error)
            }
        }
    }
}

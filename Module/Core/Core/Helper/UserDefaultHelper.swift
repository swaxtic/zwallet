//
//  UserDefaultHelper.swift
//  Core
//
//  Created by MacBook on 24/05/21.
//

import Foundation

public class UserDefaultHelper {
    public static var shared: UserDefaultHelper = UserDefaultHelper()
    
    var defaults = UserDefaults.standard
    
    public func set<T>(key: UserDefaultHelper.Key, value: T) {
        self.defaults.setValue(value, forKey: key.rawValue)
    }

    public func get<T>(key: UserDefaultHelper.Key) -> T? {
        self.defaults.object(forKey: key.rawValue) as? T
    }
    
    public func setDataContact(value: ContactEntity!) {
        self.defaults.set(try? PropertyListEncoder().encode(value), forKey: Key.dataReceiver.rawValue)
    }
    
    public func getDataContact() -> ContactEntity! {
        var contactData: ContactEntity!
        if let data = self.defaults.value(forKey: Key.dataReceiver.rawValue) as? Data {
            contactData = try? PropertyListDecoder().decode(ContactEntity.self, from: data)
            return contactData!
        } else {
            return contactData
        }
    }
    
    public func setDataTransfer(value: TransferEntity!) {
        self.defaults.set(try? PropertyListEncoder().encode(value), forKey: Key.dataTransfer.rawValue)
    }
    
    public func getDataTransfer() -> TransferEntity! {
        var transferData: TransferEntity!
        if let data = self.defaults.value(forKey: Key.dataTransfer.rawValue) as? Data {
            transferData = try? PropertyListDecoder().decode(TransferEntity.self, from: data)
            return transferData!
        } else {
            return transferData
        }
    }
    
    public func remove(key: UserDefaultHelper.Key) {
        self.defaults.removeObject(forKey: key.rawValue)
    }
}

public extension UserDefaultHelper {
    enum Key: String {
        case email
        case userToken
        case userTokenExpired
        case refreshToken
        case userBalance
        case dataReceiver
        case dataTransfer
    }
}

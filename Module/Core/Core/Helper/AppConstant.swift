//
//  AppConstant.swift
//  Core
//
//  Created by MacBook on 24/05/21.
//

import Foundation

public class AppConstant {
    public static var baseUrl: String {
        // otomatis saat kita memilih scheme akan memilih BASE URL yang sesuai
        return Bundle.main.infoDictionary?["BASE_URL"] as? String ?? ""
    }
}

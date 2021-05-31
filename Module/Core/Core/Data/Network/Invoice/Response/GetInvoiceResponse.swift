//
//  GetInvoiceResponse.swift
//  Core
//
//  Created by MacBook on 24/05/21.
//

import Foundation

public struct GetInvoiceResponse: Codable {
    var status: Int
    var message: String
    var data: [GetInvoiceDataResponse]
}

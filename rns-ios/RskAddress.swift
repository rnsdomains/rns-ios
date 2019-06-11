//
//  RskAddress.swift
//  rns-ios
//
//  Created by Federico Ruiz on 06/06/2019.
//  Copyright © 2019 Sirius. All rights reserved.
//

import Foundation
import Web3

public class RskAddress {
    
    private let rawAddress: Bytes
    private let address: EthereumAddress
    
    public init?() {
        do {
            self.address = try EthereumAddress(hex: NO_RESPONSE, eip55: false)
            self.rawAddress = self.address.rawAddress
        }
        catch _ {
            return nil
        }
    }
    
    public init(ethereumAddress: EthereumAddress) {
        self.address = ethereumAddress
        self.rawAddress = self.address.rawAddress
    }
    
    public init(hex: String, eip55: Bool) throws {
        self.address = try! EthereumAddress(hex: hex, eip55: eip55)
        self.rawAddress = self.address.rawAddress
    }
    
    public func hex(eip55: Bool) -> String {
        return self.address.hex(eip55: eip55)
    }
}

//
//  ens_namehash.swift
//  rns-ios
//
//  Created by Fede Ruiz on 16/05/2019.
//  Copyright © 2019 Sirius. All rights reserved.
//

import Foundation
import CryptoSwift

//https://github.com/ethereum/EIPs/blob/master/EIPS/eip-137.md
extension String {
    public var namehash: String {
        var node = Array<UInt8>.init(repeating: 0x0, count: 32)
        if self.count > 0 {
            node = self.split(separator: ".")
                .map { Array($0.utf8).sha3(.keccak256) }
                .reversed()
                .reduce(node) { return ($0 + $1).sha3(.keccak256) }
        }
        return "0x" + node.toHexString()
    }
}

extension StringProtocol {
    var hexaToBytes: [UInt8] {
        let hexa = Array(self)
        return stride(from: 0, to: count, by: 2).compactMap { UInt8(String(hexa[$0...$0.advanced(by: 1)]), radix: 16) }
    }
}


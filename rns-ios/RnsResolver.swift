//
//  PublicResolver.swift
//  rns-ios
//
//  Created by Federico Ruiz on 15/05/2019.
//  Copyright © 2019 Sirius. All rights reserved.
//

import Foundation
import Web3
import BigInt

public class RnsResolver {
    
    var rnsContract: DynamicContract
    var web3: Web3
    var publicResolverAddress: String
    
    /**
     * Initializes this instance of `RnsResolver`.
     *
     * - parameter nodeDir: The node address of the custom provider
     * - parameter publicResolverAddress: The Resolver address
     * - parameter publicResolverAddress: The RNS address
     *
     * - throws: EthereumAddress.Error.addressMalformed if the given hex string doesn't fulfill the conditions.
     */
    public init(nodeDir: String = NODE, publicResolverAddress: String = RESOLVER_ADDRESS, rnsAddress: String = RNS_ADDRESS) throws {
        let jsonABI = importJson(name: "RegistryABI")
        self.web3 = Web3(rpcURL: nodeDir)
        self.rnsContract = try web3.eth.Contract(json: jsonABI, abiKey: nil, address: EthereumAddress(hex: rnsAddress, eip55: false))
        self.publicResolverAddress = publicResolverAddress
    }
    
    /**
     It gets the address of a given RIF domain.
     
     */
    public func getAddress(name: String) -> Promise<RskAddress> {
        let nodeAsBytes = BigInt(hexString: String(name.namehash.suffix(64)))
        
        return loadResolver(node: name).then { resolver in
            firstly {
                resolver["addr"]!(nodeAsBytes!).call()
                }.map { resolverOutput in
                    guard resolverOutput[""] != nil else {
                        return RskAddress()!
                    }
                    let address = resolverOutput[""] as! EthereumAddress
                    print(address.hex(eip55: false))
                    return RskAddress(ethereumAddress: address)
                }
        }
    }
    
    /**
     It loads the resolver contract for a given node name.
     
     */
    private func loadResolver(node: String) -> Promise<DynamicContract> {
        let nodeAsBytes = BigInt(hexString: String(node.namehash.suffix(64)))
        return firstly {
            self.rnsContract["resolver"]!(nodeAsBytes!).call()
            }.map { response in
                do {
                    let resolverAdress = response[""]! as! EthereumAddress
                    let resolverABI = importJson(name: "PublicResolverABI")
                    let resolver = try self.web3.eth.Contract(json: resolverABI, abiKey: nil, address: resolverAdress)
                    return resolver
                }
        }
    }
}

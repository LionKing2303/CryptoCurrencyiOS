//
//  CryptoCurrencyModel.swift
//  CryptoCurrency
//
//  Created by Arie Peretz on 22/12/2020.
//  Copyright © 2020 Arie Peretz. All rights reserved.
//

import Foundation

struct CryptoCurrencyModel: Hashable {
    let title: String
    let subtitle: String
    let value: String
    let percentDiff: String
}

struct CurrencyResponseModel: Codable {
    let status: Status
    let data: [CurrencyResponseModel.Data]
}

// MARK: - Data
extension CurrencyResponseModel {
    struct Data: Codable {
        let id: Int
        let name, symbol, slug: String
        let numMarketPairs: Int
        let dateAdded: String
        let tags: [String]
        let maxSupply: Int?
        let circulatingSupply, totalSupply: Double
        let platform: Platform?
        let cmcRank: Int
        let lastUpdated: String
        let quote: Quote
        
        enum CodingKeys: String, CodingKey {
            case id, name, symbol, slug
            case numMarketPairs = "num_market_pairs"
            case dateAdded = "date_added"
            case tags
            case maxSupply = "max_supply"
            case circulatingSupply = "circulating_supply"
            case totalSupply = "total_supply"
            case platform
            case cmcRank = "cmc_rank"
            case lastUpdated = "last_updated"
            case quote
        }
    }
}

// MARK: - Platform
extension CurrencyResponseModel {
    struct Platform: Codable {
        let id: Int
        let name: Name
        let symbol: Symbol
        let slug: Slug
        let tokenAddress: String
        
        enum CodingKeys: String, CodingKey {
            case id, name, symbol, slug
            case tokenAddress = "token_address"
        }
    }
}

extension CurrencyResponseModel {
    enum Name: String, Codable {
        case binanceChain = "Binance Chain"
        case ethereum = "Ethereum"
        case tron = "Tron"
    }
}

extension CurrencyResponseModel {
    enum Slug: String, Codable {
        case binanceCoin = "binance-coin"
        case ethereum = "ethereum"
        case tron = "tron"
    }
}

extension CurrencyResponseModel {
    enum Symbol: String, Codable {
        case bnb = "BNB"
        case eth = "ETH"
        case trx = "TRX"
    }
}
// MARK: - Quote
extension CurrencyResponseModel {
    struct Quote: Codable {
        let usd: Usd
        
        enum CodingKeys: String, CodingKey {
            case usd = "USD"
        }
    }
}
// MARK: - Usd
extension CurrencyResponseModel {
    struct Usd: Codable {
        let price, volume24H, percentChange1H, percentChange24H: Double
        let percentChange7D, marketCap: Double
        let lastUpdated: String
        
        enum CodingKeys: String, CodingKey {
            case price
            case volume24H = "volume_24h"
            case percentChange1H = "percent_change_1h"
            case percentChange24H = "percent_change_24h"
            case percentChange7D = "percent_change_7d"
            case marketCap = "market_cap"
            case lastUpdated = "last_updated"
        }
    }
}

// MARK: - Status
extension CurrencyResponseModel {
    struct Status: Codable {
        let timestamp: String
        let errorCode: Int
        let errorMessage: String?
        let elapsed, creditCount: Int
        let notice: String?
        let totalCount: Int
        
        enum CodingKeys: String, CodingKey {
            case timestamp
            case errorCode = "error_code"
            case errorMessage = "error_message"
            case elapsed
            case creditCount = "credit_count"
            case notice
            case totalCount = "total_count"
        }
    }
}

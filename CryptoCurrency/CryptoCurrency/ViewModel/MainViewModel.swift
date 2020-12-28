//
//  MainViewModel.swift
//  CryptoCurrency
//
//  Created by Arie Peretz on 22/12/2020.
//  Copyright © 2020 Arie Peretz. All rights reserved.
//

import Foundation
import Combine

class MainViewModel: ObservableObject {
    @Published var currencies: [CryptoCurrencyModel] = []
    
    var repository: Repository
    
    init(repository: Repository) {
        self.repository = repository
        self.fetchLatestCurrencies()
    }
    
    func fetchLatestCurrencies() {
        repository.fetchLatestCurrencies(completionHandler: { response in
            if let currencies = response {
                self.currencies = currencies.data.map { currency in
                    CryptoCurrencyModel(
                        title: currency.symbol,
                        subtitle: currency.name,
                        value: self.format(value: currency.quote.usd.price),
                        percentDiff: self.format(value:currency.quote.usd.percentChange24H) + "%"
                    )
                }
            }
        })
    }
    
    private func format(value: Double) -> String {
        let numberFormatter: NumberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.minimumFractionDigits = 2
        numberFormatter.maximumFractionDigits = 2
        return numberFormatter.string(for: value) ?? ""
    }
}

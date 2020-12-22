//
//  MainViewModel.swift
//  CryptoCurrency
//
//  Created by Arie Peretz on 22/12/2020.
//  Copyright © 2020 Arie Peretz. All rights reserved.
//

import Combine

class MainViewModel: ObservableObject {
    @Published var currencies: [CryptoCurrencyModel] = [
        CryptoCurrencyModel(title: "AAPL", subtitle: "Apple Inc", value: "128.23", percentDiff: "+1.24%"),
        CryptoCurrencyModel(title: "DIS", subtitle: "The Walt Disney Company", value: "170.69", percentDiff: "-1.27%"),
        CryptoCurrencyModel(title: "MRNA", subtitle: "Moderna, Inc.", value: "138.30", percentDiff: "-1.38%")]
}

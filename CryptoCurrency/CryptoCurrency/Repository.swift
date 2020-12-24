//
//  Repository.swift
//  CryptoCurrency
//
//  Created by Arie Peretz on 24/12/2020.
//  Copyright © 2020 Arie Peretz. All rights reserved.
//

import Foundation
import Combine

struct Agent {
    struct Response<T> {
        let value: T
        let response: URLResponse
    }
    
    func run<T: Decodable>(_ request: URLRequest, _ decoder: JSONDecoder = JSONDecoder()) -> AnyPublisher<Response<T>, Error> {
        return URLSession.shared
            .dataTaskPublisher(for: request)
            .tryMap { result -> Response<T> in
                let value = try decoder.decode(T.self, from: result.data)
                return Response(value: value, response: result.response)
            }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}

enum CryproCurrencyAPI {
    static let agent = Agent()
    static let base = URL(string: "https://pro-api.coinmarketcap.com")!
}

extension CryproCurrencyAPI {
    static func latestCurrencies() -> AnyPublisher<CurrencyResponseModel, Error> {
        var request = URLRequest(url: base.appendingPathComponent("v1/cryptocurrency/listings/latest"))
        request.setValue("b149686b-97fb-4c22-9789-9739e37eea02", forHTTPHeaderField: "X-CMC_PRO_API_KEY")
        request.httpMethod = "GET"
        return agent.run(request)
            .map(\.value)
            .eraseToAnyPublisher()
    }
}

protocol Repository {
    func fetchLatestCurrencies(completionHandler: @escaping ((CurrencyResponseModel) -> Void))
}

class MainRepository: Repository {
    var cancellable: AnyCancellable?
    func fetchLatestCurrencies(completionHandler: @escaping ((CurrencyResponseModel) -> Void)) {
        cancellable = CryproCurrencyAPI.latestCurrencies()
        .print()
        .sink(receiveCompletion: { _ in },
              receiveValue: { value in
                print(value)
                completionHandler(value)
        })
        
    }
}

//
//  ContentView.swift
//  CryptoCurrency
//
//  Created by Arie Peretz on 22/12/2020.
//  Copyright © 2020 Arie Peretz. All rights reserved.
//

import SwiftUI
import Combine

struct CurrencyView: View {
    let model: CryptoCurrencyModel
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(model.title)
                    .foregroundColor(Color.primary)
                    .bold()
                Text(model.subtitle)
                    .foregroundColor(Color.secondary)
            }
            Spacer()
            VStack(alignment: .trailing) {
                Text(model.value)
                    .foregroundColor(Color.primary)
                Text(model.percentDiff)
                    .padding(5.0)
                    .foregroundColor(Color.primary)
                    .background(model.positivePercent ? Color.green : Color.red)
            }
        }
        .background(Color.clear)
    }
}

struct MainView: View {
    @ObservedObject var viewModel: MainViewModel

    var body: some View {
        ZStack {
            Color(UIColor.systemBackground)
                .edgesIgnoringSafeArea(.all)
            VStack {
                HStack {
                    Text("CryptoCurrency")
                        .font(.largeTitle)
                        .bold()
                        .foregroundColor(Color.primary)
                    Spacer()
                }
                .padding([.leading,.trailing])
                List {
                    ForEach(self.viewModel.currencies, id: \.self) { currency in
                        CurrencyView(model: currency)
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            MainView(viewModel: .init())
            MainView(viewModel: .init())
                .environment(\.colorScheme, .dark)
        }
    }
}

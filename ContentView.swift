//
//  ContentView.swift
//  Currencyproject
//
//  Created by Macbook air  on 25/08/2023.
//

import SwiftUI

struct ContentView: View {
    @State private var itemSeleted = 0
    @State private var itemSeleted2 = 1
    @State private var amount : String = ""
    private var currencies = ["USD", "EUR", "GBP", "INR"]
    
    func convert(_ convert: String) -> String {
        var conversion: Double = 1.0
        let amount = Double(convert.doubleValue)
        let selectedCurrency = currencies[itemSeleted]
        let to = currencies[itemSeleted2]
        
        let euroRates = ["USD": 1.08, "EUR": 1.0, "GBP": 0.86, "INR": 89.15]
        let usdRates = ["USD": 1.0, "EUR": 0.93, "GBP": 0.86, "INR": 82.68]
        let gbpRates = ["USD": 1.26, "EUR": 1.17, "GBP": 1.0, "INR": 103.88]
        let inrRates = ["USD": 0.012, "EUR": 0.011, "GBP": 0.0096, "INR": 1.0]
        
        switch (selectedCurrency) {
        case "USD" :
            conversion = amount * (usdRates[to] ?? 0.0)
        case "EUR" :
            conversion = amount * (euroRates[to] ?? 0.0)
        case "GBP" :
            conversion = amount * (gbpRates[to] ?? 0.0)
        case "INR" :
            conversion = amount * (inrRates[to] ?? 0.0)
        default:
            print("Something went wrong")
        }
        
        return String(format: "%.2f", conversion)
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Convert a currency")) {
                    TextField("Enter an amount", text: $amount)
                        .keyboardType(.decimalPad)
                    
                    Picker(selection: $itemSeleted, label: Text("From")) {
                        ForEach(0 ..< currencies.count) { index in
                            Text(self.currencies[index]).tag(index)
                        }
                    }
                    
                    Picker(selection: $itemSeleted2, label: Text("To")) {
                        ForEach(0 ..< currencies.count) { index in
                            Text(self.currencies[index]).tag(index)
                        }
                    }
                }
                
            Section(header: Text("Conversion")) {
                    Text("\(convert(amount)) \(currencies[itemSeleted2])")
                }
            }
            
        }
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}

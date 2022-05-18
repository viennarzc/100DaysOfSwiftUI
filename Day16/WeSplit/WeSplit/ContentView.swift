//
//  ContentView.swift
//  WeSplit
//
//  Created by Viennarz Curtiz on 10/30/20.
//

import SwiftUI

struct ContentView: View {

  @State private var checkAmount = ""
  @State private var numberOfPeople = 2
  @State private var tipPercentage = 2
  @State private var someAmouint = 0
  
  let tipPercentages = [10, 15, 20, 25, 0]
  
  var totalPerPerson: Double {
    let peopleCount = Double(numberOfPeople + 2)
    let tipSelection = Double(tipPercentages[tipPercentage])
    let orderAmount = Double(checkAmount) ?? 0
    let tipValue = orderAmount / 100 * tipSelection
    let grandTotal = orderAmount + tipValue
    let amountPerPerson = grandTotal / peopleCount
    
    return amountPerPerson

  }
  
  var totalAmount: Double {
    let tipSelection = Double(tipPercentages[tipPercentage])
    let orderAmount = Double(checkAmount) ?? 0
    let tipValue = orderAmount / 100 * tipSelection
    
    let grandTotal = orderAmount + tipValue
    
    return grandTotal
  }
  
  var body: some View {
      
    NavigationView {
      Form {
        Section {
          TextField("Amount", text: $checkAmount)
            .keyboardType(.decimalPad )
          TextField("Number of People", value: $numberOfPeople, formatter: NumberFormatter())
            .keyboardType(.numberPad)
            
            if #available(iOS 15.0, *) {
                TextField("Some amount",value: $someAmouint, format: .currency(code: "PHP"), prompt: Text("wa"))
                    .keyboardType(.numberPad)
                    
            } else {
                // Fallback on earlier versions
            }
            
            Text("\(someAmouint)")
        }
        
        Section(header: Text("How much tip do you want to leave?")) {
          
          Picker("Tip Percentage", selection: $tipPercentage) {
            ForEach(0 ..< tipPercentages.count) {
              Text("\(self.tipPercentages[$0])%")
            }
          }
          .pickerStyle(SegmentedPickerStyle())
          
        }
        
        Section(header: Text("Amount per Person")) {
          Text("$\(totalPerPerson, specifier: "%.2f")")
        }
        
        Section(header: Text("Total Amount")) {
          Text("$\(totalAmount, specifier: "%.2f")")
        }
        
      }
      .navigationBarTitle("WeSplit")
      
    }
  }
  
  
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    Group {
      ContentView()
        .previewDevice("iPhone 11")
    }
  }
}

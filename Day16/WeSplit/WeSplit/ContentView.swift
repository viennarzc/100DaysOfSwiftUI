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
  
  let tipPercentages = [10, 15, 20, 25, 0]
  
  var totalPerPerson: Double {
    let peopleCount = Double(numberOfPeople + 2)
    let tipSelection = Double(tipPercentages[tipPercentage])
    
    let orderAmount = Double(checkAmount) ?? 0
    
    let stringValue = "0.5"
    let doubleValue = Double(stringValue)
    
    let tipValue = orderAmount / 100 * tipSelection
    let grandTotal = orderAmount + tipValue
    let amountPerPerson = grandTotal / peopleCount
    
    return amountPerPerson

  }
  
  var body: some View {
    NavigationView {
      Form {
        Section {
          TextField("Amount", text: $checkAmount)
            .keyboardType(.decimalPad )
          
          Picker("Number of People", selection: $numberOfPeople) {
            ForEach(2 ..< 100) {
              Text("\($0) people")
            }
          }
        }
        
        Section(header: Text("How much tip do you want to leave?")) {
          
          Picker("Tip Percentage", selection: $tipPercentage) {
            ForEach(0 ..< tipPercentages.count) {
              Text("\(self.tipPercentages[$0])%")
            }
          }
          .pickerStyle(SegmentedPickerStyle())
          
        }
        
        Section {
          Text("$\(totalPerPerson)")
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
    }
  }
}

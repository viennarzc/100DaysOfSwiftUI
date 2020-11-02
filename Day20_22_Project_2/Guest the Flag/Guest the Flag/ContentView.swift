//
//  ContentView.swift
//  Guest the Flag
//
//  Created by Viennarz Curtiz on 11/2/20.
//

import SwiftUI

struct ContentView: View {
  @State private var showingAlert = false
  
    var body: some View {
      Button("Show Alert") {
        self.showingAlert = true
      }
      .alert(isPresented: $showingAlert, content: {
        Alert(title: Text("Hey"), message: Text("Some message"), dismissButton: .default(Text("dimiss")))
      })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

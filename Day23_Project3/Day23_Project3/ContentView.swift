//
//  ContentView.swift
//  Day23_Project3
//
//  Created by Viennarz Curtiz on 11/25/20.
//

import SwiftUI

struct CustomView: ViewModifier {
  let name: String
 
  
  func body(content: Content) -> some View {
    Text("Pogi si \(name)")
  }
  
}


struct GridStack<Content: View>: View {
  let rows: Int
  let columns: Int
  let content: (Int, Int) -> Content
  
  var body: some View {
    VStack {
      ForEach(0 ..< rows) { row in
        HStack {
          ForEach(0 ..< self.columns) { column in
            self.content(row, column)
          }
        }
        
      }
    }
    .foregroundColor(.blue)
  }
  
  init(rows: Int, columns: Int, @ViewBuilder content: @escaping (Int, Int) -> Content) {
    self.rows = rows
    self.columns = columns
    self.content = content
  }
}

struct ContentView: View {
    var body: some View {
      GridStack(rows: 4, columns: 4) { row, col in
        
          Image(systemName: "\(row * 4 + col).circle")
          Text("R\(row) C\(col)")
            .modifier(CustomView(name: "View"))
        
        
      }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

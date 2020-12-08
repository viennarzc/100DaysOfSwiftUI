//
//  ContentView.swift
//  PaperRockScissors
//
//  Created by Viennarz Curtiz on 12/8/20.
//

import SwiftUI

struct ContentView: View {
  @State private var questionsCount = 1
  
  let moves: [String] = [
    "Rock",
    "Paper",
    "Scissors"
  ]
  
  @State private var userScore: Int = 0
  @State private var playerShouldWin: Bool = Bool.random()
  
  @State private var appSelectedMove: String = [
    "Rock",
    "Paper",
    "Scissors"
  ].randomElement()!

    var body: some View {
      
      VStack(alignment: .center, spacing: 10) {
        if questionsCount >= 10 {
          Text("Finish Game")
            .fontWeight(.black)
        }
        
        
        Text("Player Score: \(userScore)")
          .fontWeight(.semibold)
        Text("App Selected Move: \(appSelectedMove)")
          .fontWeight(.semibold)
        TextWin(shouldWin: playerShouldWin)
        
        Spacer(minLength: 10)
        HStack(alignment: .center, spacing: 10) {
          ForEach(moves, id: \.self) { v in

            Button(action: {
                process(userMove: v)
              questionsCount += 1
            }) {
                Text("\(v)")
                  .fontWeight(.bold)
            }
            .frame(minWidth: 100, idealWidth: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, maxWidth: .none, minHeight: 60, idealHeight: 60, maxHeight: .none, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            .background(Color.gray)
            .foregroundColor(.black)
            .clipShape(Capsule())

          }
        }
      }
      
      
      
    }
  
  func appSelectMove() {
    appSelectedMove = moves.randomElement()!
    playerShouldWin = Bool.random()
  }
  
  func process(userMove: String) {
    
    print(userMove, appSelectedMove)
    
    
    switch (userMove, appSelectedMove) {
    
    case (let a, let b)
          where a == b:
      break
      
    case (let a, let b)
          where a == "Rock" && b == "Scissors" && playerShouldWin:
      userScore += 1
      
    case (let a, let b)
          where a == "Rock" && b == "Scissors" && !playerShouldWin:
      userScore -= 1
      
    case (let a, let b)
          where a == "Rock" && b == "Paper" && playerShouldWin:
      userScore -= 1
      
    case (let a, let b)
          where a == "Rock" && b == "Paper" && !playerShouldWin:
      userScore += 1
      
      
    case (let a, let b)
          where a == "Scissors" && b == "Paper" && playerShouldWin:
      userScore += 1
      
    case (let a, let b)
          where a == "Scissors" && b == "Paper" && !playerShouldWin:
      userScore -= 1
      
      
    case (let a, let b)
          where a == "Scissors" && b == "Rock" && playerShouldWin:
      userScore -= 1
      
    case (let a, let b)
          where a == "Scissors" && b == "Rock" && !playerShouldWin:
      userScore += 1
      
    case (let a, let b)
          where a == "Paper" && b == "Rock" && playerShouldWin:
      userScore += 1
      
    case (let a, let b)
          where a == "Paper" && b == "Rock" && !playerShouldWin:
      userScore -= 1
      
    case (let a, let b)
          where a == "Paper" && b == "Scissors" && playerShouldWin:
      userScore -= 1
      
    case (let a, let b)
          where a == "Paper" && b == "Scissors" && !playerShouldWin:
      userScore += 1

    case (_, _):
      break
    }
    
    
    appSelectMove()

  }
  
  
}

struct TextWin: View {
  let shouldWin: Bool
  
  var body: some View {
    if shouldWin {
      return Text("Player must must WIN to score points")
        .fontWeight(.bold)
    } else {
      return Text("Player must must LOSE to score points")
        .fontWeight(.bold)
    }
  }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//
//  ContentView.swift
//  Guest the Flag 2
//
//  Created by Viennarz Curtiz on 11/2/20.
//

import SwiftUI

struct ContentView: View {
  @State private var countries = ["Estonia",
    "France",
    "Germany", "Ireland", "Italy",
    "Nigeria", "Poland", "Russia",
    "Spain", "UK", "US"].shuffled()

  @State private var correctAnswer = Int.random(in: 0...2)

  @State private var showingScore = false
  @State private var scoreTitle = ""

  @State private var userScore: Int = 0


  var body: some View {
    ZStack {
      LinearGradient(gradient: Gradient(colors: [Color.blue, Color.black]), startPoint: .top, endPoint: .bottom)
        .edgesIgnoringSafeArea(.all)

      VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 30) {
        VStack {
          Text("Tap the flag of")
            .foregroundColor(.white)
          Text(countries[correctAnswer])
            .foregroundColor(.white)
            .font(.largeTitle)
            .fontWeight(.black)
        }

        ForEach(0 ..< 3) { number in
          Button(action: {
            self.flagTapped(number)
          }) {
            FlagImage(name: self.countries[number])
          }
            .clipShape(Capsule())
            .overlay(Capsule().stroke(Color.black, lineWidth: 1))
            .shadow(color: .black, radius: 2, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/)

        }
        Text("Your Score is \(userScore)")
          .foregroundColor(.white)
          .font(.headline)
          .fontWeight(.semibold)
          
        Spacer()
        

      }
        .alert(isPresented: $showingScore) {
          Alert(title: Text(scoreTitle), message: Text("Your score is \(userScore)"), dismissButton: .default(Text("Continue")) {
              self.askQuestion()
            })

      }
    }


  }

  func flagTapped(_ number: Int) {
    if number == correctAnswer {
      scoreTitle = "Correct"
      userScore += 1
    } else {
      scoreTitle = "Hey that is wrong! That is the flag of \(countries[number])"
    }

    showingScore = true
  }

  func askQuestion() {
    countries.shuffle()
    correctAnswer = Int.random(in: 0...2)
  }
}

struct FlagImage: View {
  var name: String
  
  var body: some View {
    Image(name)
      .renderingMode(.original)
  }
  
}




struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}


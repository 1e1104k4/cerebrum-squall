//
//  ContentView.swift
//  cerebrumSquall
//
//  Created by Leila on 11/24/23.
//

import SwiftUI

struct ContentView: View {
    
    let movesChoice = ["rock", "paper", "scissors"]
    @State private var computerMoveChoice = Int.random(in: 0..<3)
    @State private var shouldWin = Bool.random()
    @State private var score = 0
    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State private var round = 0

    var body: some View {
        VStack {
            HStack {
                
                VStack {
                    Text("game chose:")
                    Text("you should:")
                }
                VStack {
                    Text(movesChoice[computerMoveChoice])
                    Text(shouldWin ? "win" : "lose")
                }
            }.padding()
            
            HStack {
                VStack {
                    Text("your chose:")
                }
                VStack {
                    ForEach(0..<3) { moveChoice in
                        Button(movesChoice[moveChoice]) {
                            userMove(is: moveChoice)
                            
                        }
                        
                    }
                }
            }.padding()
            
            HStack {
                VStack {
                    Text("score:")
                    Text("round:")
                }
                VStack {
                    Text("\(score)")
                    Text("\(round)")
                }
            }.padding()
        } // main VStack
        .alert(scoreTitle, isPresented: $showingScore) {
            Button("continue", action: nextRound)
        } message: {
            Text("""
                round \(round)
                your score is \(score)
                """)
        }
    
        // alert + new var
        
        
    } // closing brase for body
    
    func userMove(is moveChoice: Int) {
        let winningMovesChoice = [1, 2, 0]
        let didWin: Bool
        
        if shouldWin {
            didWin = moveChoice == winningMovesChoice[computerMoveChoice]
        } else {
            didWin = winningMovesChoice[moveChoice] == computerMoveChoice
        }
        
        if didWin {
            score += 1
            scoreTitle = "correct: +1"
        } else {
            score -= 1
            scoreTitle = "wrong: -1"
        }
        
        round += 1
        showingScore = true
        
    }
    
    func nextRound() {
        computerMoveChoice = Int.random(in: 0..<3)
        shouldWin.toggle()
    }
    
} // closing brase for struct

#Preview {
    ContentView()
}





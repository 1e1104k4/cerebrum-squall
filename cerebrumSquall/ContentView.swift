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
    @State private var gameOver = false
    @State private var gameOverTitle = ""

    var body: some View {
        ZStack {
            LinearGradient(colors: [.init(red: 0.1, green: 0.2, blue: 0.3), .gray, .init(red: 0.1, green: 0.2, blue: 0.3) ], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
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
                        Text("\(round) / 10")
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
            .alert(gameOverTitle, isPresented: $gameOver) {
                Button("new game", action: newGame)
            } message: {
                Text("""
                your total score is \(score)
                """)
            }
        } // ZStack
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
        
        if round == 10 {
            gameOver = true
            gameOverTitle = "game over"
        }
        
    }
    
    func nextRound() {
        computerMoveChoice = Int.random(in: 0..<3)
        shouldWin.toggle()
    }
    
    func newGame() {
        nextRound()
        score = 0
        round = 0
    }
    
} // closing brase for struct

#Preview {
    ContentView()
}





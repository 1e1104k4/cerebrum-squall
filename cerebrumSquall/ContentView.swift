//
//  ContentView.swift
//  cerebrumSquall
//
//  Created by Leila on 11/24/23.
//

import SwiftUI

struct ContentView: View {
    
    let movesChoice = ["rock", "paper", "scissors"]
    @State var computerMoveChoice = Int.random(in: 0..<3)
    @State var shouldWin = Bool.random()

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
            }
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
            }
            
        }
        .padding()
        
        
    } // closing brase for body
    
    func userMove(is moveChoice: Int) {
        let winningMovesChoice = [1, 2, 0]
        let didWin: Bool
        
        if shouldWin {
            didWin = moveChoice == winningMovesChoice[computerMoveChoice]
        } else {
            didWin = winningMovesChoice[moveChoice] == computerMoveChoice
        }
        
    }
    
} // closing brase for struct

#Preview {
    ContentView()
}





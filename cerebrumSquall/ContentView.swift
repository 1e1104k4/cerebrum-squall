//
//  ContentView.swift
//  cerebrumSquall
//
//  Created by Leila on 11/24/23.
//

import SwiftUI

struct ContentView: View {
    
    var movesChoice = ["rock", "paper", "scissors"]
    @State var currentMoveChoice = Int.random(in: 0...2)
    @State var shouldWin = Bool.random()
    
    var body: some View {
        VStack {
            HStack {
                VStack {
                    Text("game chose:")
                    Text("you should:")
                }
                VStack {
                    Text(movesChoice[currentMoveChoice])
                    Text(shouldWin ? "win" : "lose")
                }
            }
            
        }
        .padding()
    }
}

#Preview {
    ContentView()
}





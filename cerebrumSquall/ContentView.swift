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
    
    var body: some View {
        VStack {
            
            VStack {
                Text(movesChoice[currentMoveChoice])
                
            }
            
        }
        .padding()
    }
}

#Preview {
    ContentView()
}





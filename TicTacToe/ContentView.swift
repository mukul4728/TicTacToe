//
//  ContentView.swift
//  TicTacToe
//
//  Created by Mukul Kumar on 09/11/21.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var tictactoe : TicTacToeModel = TicTacToeModel()
    @State var gameOver : Bool = false
    
    var body: some View {
        VStack{
            Text("Tic Tac Toe")
                .font(.title)
                .fontWeight(.heavy)
                .multilineTextAlignment(.center)
            ForEach(0 ..< tictactoe.squares.count/3){
                row in
                HStack{
                    ForEach(0 ..< 3){
                        column in
                            let index = row*3 + column
                        SquareView(square: tictactoe.squares[index],
                                   action: {tictactoe.makeMove(idx: index)
                            gameOver = tictactoe.isGameOver
                        })
                        
                    }
                }
            }
        }.alert(isPresented: self.$gameOver, content: {
            Alert(title: Text(self.tictactoe.winner == .cross ? "You win !!" : "AI wins!!" ),
                  dismissButton: Alert.Button.destructive(Text("Play Again!!"), action: {
                self.tictactoe.resetGame()
            }))
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

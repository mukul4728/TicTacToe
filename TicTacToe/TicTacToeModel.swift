//
//  TicTacToeModel.swift
//  TicTacToe
//
//  Created by Mukul Kumar on 09/11/21.
//

import Foundation
import Combine

enum SquareStatus{
    case empty
    case cross
    case circle
}

class Square: ObservableObject{
    @Published var status: SquareStatus
    init(sq: SquareStatus){
        self.status = sq
    }
}

class TicTacToeModel: ObservableObject{
    @Published var squares: [Square] = [Square]()
    var winner: SquareStatus{
        return isThereAWinner()
    }
    
    init(){
        for _ in 0...8 {
            squares.append(Square(sq: .empty))
        }
    }
    
    func resetGame(){
        for idx in  0 ..< squares.count {
            squares[idx].status = .empty
        }
    }
    
    var isGameOver: Bool{
        return winner != .empty
    }
    
    func makeMove(idx: Int) -> Void{
        if(squares[idx].status == .empty && winner == .empty){
            squares[idx].status = .cross
            if(winner == .cross){
                return
            }
            var ai_move = Int.random(in: 0...8)
            while squares[ai_move].status != .empty{
                ai_move = Int.random(in: 0...8)
            }
            squares[ai_move].status = .circle
        }
    }
    
    
    func isThereAWinner() -> SquareStatus{
        let possibilities = [[1,2,3], [4,5,6], [7,8,9], [1,4,7], [2,5,8], [3,6,9], [1,5,9], [3,5,7]]
        for x in possibilities{
            if self.squares[x[0]-1].status == .cross && self.squares[x[1]-1].status == .cross && self.squares[x[2]-1].status == .cross {
                return .cross
            }
            else if self.squares[x[0]-1].status == .circle && self.squares[x[1]-1].status == .circle && self.squares[x[2]-1].status == .circle{
                return .circle
            }
        }
        return .empty
    }
    
    
}

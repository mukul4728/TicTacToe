//
//  SquareView.swift
//  TicTacToe
//
//  Created by Mukul Kumar on 09/11/21.
//

import SwiftUI

struct SquareView: View {
    @ObservedObject var square: Square
    var action : () -> Void 
    var body: some View{
        Button(action: action, label: {
            Text(self.square.status == .cross ? "X" : self.square.status == .circle ? "0" : " ")
                .font(.largeTitle)
                .bold()
                .foregroundColor(.blue)
                .frame(width: 70, height: 70, alignment: .center)
                .background(Color.gray)
                .padding(4)
        })
    }
}

struct SquareView_Previews: PreviewProvider {
    static var previews: some View {
        SquareView(square: Square(sq:.empty), action: { })
    }
}

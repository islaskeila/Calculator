//
//  ContentView.swift
//  Calculator
//
//  Created by Keila Islas on 12/7/23.
//

import SwiftUI

struct ContentView: View {
    let grid = [
        ["AC", "⌫", "%","/"],
        ["7", "8", "9","x"],
        ["4", "5", "6","-"],
        ["1", "2", "3","+"],
        [".", "0", "","="]
    ]
    var body: some View {
        VStack {
            HStack {
                Spacer ()
                Text ("Hello World")
                    .padding()
                    .foregroundColor(Color.white)
                    .font(.system(size: 30, weight: .heavy))
            } .frame(maxWidth: .infinity, maxHeight: .infinity)
            HStack {
                Spacer ()
                Text ("Hello World")
                    .padding()
                    .foregroundColor(Color.white)
                    .font(.system(size: 50, weight: .heavy))
            } .frame(maxWidth: .infinity, maxHeight: .infinity)
            
            ForEach(grid, id: \.self) {
                row in
                ForEach(row, id: \.self) {
                    cell in
                    
                    Button (action: {}, label: {
                        Text("Button")
                    })
                }
            }
            
            
        }
        .background(Color.black.ignoresSafeArea())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

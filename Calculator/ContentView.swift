//
//  ContentView.swift
//  Calculator
//
//  Created by Keila Islas on 12/7/23.
//

import SwiftUI

struct ContentView: View {
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
        }
        .background(Color.black.ignoresSafeArea())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

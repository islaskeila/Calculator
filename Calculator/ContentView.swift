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
        [".", "0", "☼","="]
    ]
    let operators = ["/", "+", "x","%"]
    @State var buttonWork = ""
    @State var buttonResults = ""
    
    var body: some View {
        VStack {
            HStack {
                Spacer ()
                Text (buttonWork)
                    .padding()
                    .foregroundColor(Color.white)
                    .font(.system(size: 30, weight: .heavy))
            } .frame(maxWidth: .infinity, maxHeight: .infinity)
            HStack {
                Spacer ()
                Text (buttonResults)
                    .padding()
                    .foregroundColor(Color.white)
                    .font(.system(size: 50, weight: .heavy))
            } .frame(maxWidth: .infinity, maxHeight: .infinity)
            
            ForEach(grid, id: \.self) {
                row in
                HStack {
                    ForEach(row, id: \.self) {
                        cell in
                        
                        Button (action: {buttonPressed(cell: cell)}, label: {
                            Text(cell)
                                .foregroundColor(buttonColor(cell))
                                .font(.system(size: 40, weight: .heavy))
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                        })
                    }
                }
            }
            
            
        }
        .background(Color.black.ignoresSafeArea())
    }
    func buttonColor(_ cell: String) -> Color {
        if(cell == "AC" || cell == "⌫") {
            return .red
        }
        if(cell == "-" || cell == "=" || operators.contains(cell)) {
            return .orange
        }
        if(cell == "☼") {
            return .yellow
        }
        
        return .white
    }
    
    func buttonPressed(cell: String) {
        switch cell {
        case "AC" :
            buttonWork = ""
            buttonResults = ""
        case "⌫":
            buttonWork = String(buttonWork.dropLast())
        case "=":
            buttonResults = calculateResults()
        default:
            buttonWork += cell
        }
    }
    func calculateResults() -> String {
        if(validInput()) {
            var work = buttonWork.replacingOccurrences(of: "%", with: "*0.1")
            work = buttonWork.replacingOccurrences(of: "x", with: "*")
            let expression = NSExpression(format: work)
            let result = expression.expressionValue(with: nil, context: nil) as! Double
            return formatResult(val: result)
        }
        return ""
    }
    func validInput() -> Bool {
        if(buttonResults.isEmpty) {
            return false
        }
        let last = String (buttonWork.last!)
        if(operators.contains(last) || last == "-") {
            if(last != "%" || buttonWork.count == 1) {
                return false
            }
        }
        return true
    }
    func formatResult(val : Double) -> String {
        if (val.truncatingRemainder(dividingBy: 1) == 0) {
            return String(format: "%.0f", val)
        }
        return String(format: "%.2f", val)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

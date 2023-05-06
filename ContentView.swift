//
//  ContentView.swift
//  TablaMultiplicar
//
//  Created by Javier Oskar Murillo Cota on 03/05/23.
//
import SwiftUI

struct ContentView: View {
    @State private var firstNumber = ""
    @State private var secondNumber = ""
    @State private var result = 0

    
    func isHighlighted(_ num: Int, _ input: String) -> Bool {
          return num == Int(input)
      }
    func isIntersection(_ row: Int, _ col: Int, _ rowInput: String, _ colInput: String) -> Bool {
        if let rowInt = Int(rowInput), let colInt = Int(colInput) {
            return (row <= rowInt && col <= colInt)
        }
        return false
    }

    var body: some View {
        VStack {
            HStack {
                Text("X")
                    .frame(width: 20, height: 20)
                    .background(Color.red)
                ForEach(1...12, id: \.self) { num in
                    Text("\(num)")
                        .frame(width: 20, height: 20)
                        .background(isHighlighted(num, firstNumber) ? Color.purple : Color.red)


                    
                }//MARK: FOREACH
            }//MARK: HSTACK
            
            ForEach(1...12, id: \.self) { row in
                HStack {
                    Text("\(row)")
                        .frame(width: 20, height: 20)
                        .background(isHighlighted(Int(row), secondNumber) ? Color.purple : Color.red)


                    ForEach(1...12, id: \.self) { col in
                        Text(" ")
                            .frame(width: 20, height: 20)
                            .background(isIntersection(row, col, secondNumber, firstNumber) ? Color.purple : Color.blue)

//                        Text("\(row * col)")
//                            .frame(width: 20, height: 20)
//                            .border(Color.black, width: 1)
                    }//MARK: FOREACH
                }//MARK: HSTACK
            }//MARK: FOREACH
            
            HStack {
                 TextField(" ", text: $firstNumber)
                     .keyboardType(.numberPad)
                     .textFieldStyle(RoundedBorderTextFieldStyle())
                     .frame(width: 60)

                 Text("X")

                 TextField("", text: $secondNumber)
                     .keyboardType(.numberPad)
                     .textFieldStyle(RoundedBorderTextFieldStyle())
                     .frame(width: 60)

                 Text("=")

                 Text("\(result)")
                     .frame(width: 60,height: 35)
                     .border(Color.black, width: 1)
             }.padding()

             Button(action: {
                 if let firstInt = Int(firstNumber), let secondInt = Int(secondNumber) {
                     result = firstInt * secondInt
                 }
             }) {
                 Text("Calcular")
             }.padding()
            
        }//MARK: VSTACK
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

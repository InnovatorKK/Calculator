//
//  ContentView.swift
//  FirstSwift
//
//  Created by Juhyun Kang on 2023/06/29.
//

import SwiftUI

enum ButtonType :String{
    case first, second, third, fourth, fifth, sixth, seventh, eighth, ninth, zero
    case dot, equal, plus, minus, multiply, divide
    case percent, oppisite, clear
    
    
    var backgroudColor :Color {
        switch self {
        case .first, .second, .third, .fourth, .fifth, .sixth, .seventh, .eighth, .ninth, .zero, .dot:
            return Color("NumberButton")
        case .plus, .minus, .divide, .multiply, .equal:
            return Color.orange
        case .clear, .oppisite, .percent:
            return Color.gray
        }
    }
    
    var buttonDisplayName :String {
        switch self {
        case .first:
            return "1"
        case .second:
            return "2"
        case .third:
            return "3"
        case .fourth:
            return "4"
        case .fifth:
            return "5"
        case .sixth:
            return "6"
        case .seventh:
            return "7"
        case .eighth:
            return "8"
        case .ninth:
            return "9"
        case .zero:
            return "0"
        case .dot:
            return "."
        case .equal:
            return "="
        case .plus:
            return "+"
        case .minus:
            return "-"
        case .multiply:
            return "X"
        case .divide:
            return "/"
        case .percent:
            return "%"
        case .oppisite:
            return "?"
        case .clear:
            return "C"
        }
    }

}

struct ContentView: View {
    
    @State private var totalNumber :String = "0"
    @State private var currOperator :String = "+"
    @State private var Stack :[String] = []
    private let buttonData :[[ButtonType]] = [
        [.clear, .oppisite, .percent, .divide],
        [.seventh, .eighth, .ninth, .multiply],
        [.fourth, .fifth, .sixth, .minus],
        [.first, .second, .third, .plus],
        [.zero, .dot , .equal]
    ]
    
    var body: some View {
        
        ZStack {
            
            Color.black.ignoresSafeArea()
            VStack {
                Spacer()
                HStack {
                    Spacer()
                
                    Text(totalNumber)
                        .padding()
                        .font(.system(size: 73))
                        .foregroundColor(.white)
                }
                
                ForEach(buttonData, id: \.self) { line in
                    HStack {
                        ForEach(line, id: \.self) { item in
                            HStack {
                                Button {
                                    if item == .plus || item == .minus || item == .divide || item == .multiply {
                                        currOperator = item.buttonDisplayName
                                        Stack.append(totalNumber)
                                    }
                                    
                                    if totalNumber == "0"{
                                        if item == .zero {
                                            totalNumber = "0"
                                        } else {
                                            totalNumber = ""
                                            totalNumber += item.buttonDisplayName
                                        }
                                    } else {
                                        if item == .clear {
                                            totalNumber = "0"
                                        } else {
                                            totalNumber += item.buttonDisplayName
                                        }
                                    }
                                } label: {
                                    Text(item.buttonDisplayName)
                                        .frame(width: item == .some(.zero) ? 160: 80, height: 80)
                                        .background(item.backgroudColor)
                                        .cornerRadius(40)
                                        .foregroundColor(.white)
                                        .font(.system(size:33))
                                }
                            }
                        }
                    }
                }
                
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

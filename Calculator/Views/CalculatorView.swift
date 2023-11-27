//
//  CalculatorView.swift
//  Calculator
//
//

import SwiftUI

struct CalculatorView: View {
    
    @State private var lightMode: Bool = false
    
    var buttonTypes: [[ButtonType]] {
        [
            [.allClear, .negative, .percent, .operations(.division)],
            [.digits(.seven), .digits(.eight), .digits(.nine), .operations(.multiplication)],
            [.digits(.four), .digits(.five), .digits(.six), .operations(.subtraction)],
            [.digits(.one), .digits(.two), .digits(.three), .operations(.addition)],
            [.digits(.zero), .decimalPoint, .equals]
        ]
    }
    
    var body: some View {
        VStack {
            toggleArea
            Spacer()
            displayArea
            keypadArea
        }
        .padding(Constants.padding)
        .background(lightMode ? Color(red: 0.961, green: 0.961, blue: 0.961) : Color.black)
        
    }
}

extension CalculatorView {
    private var toggleArea: some View {
        Toggle(isOn: $lightMode) {
        }
        .padding()
        .toggleStyle(CustomToggleStyle())
    }
    
    private var displayArea: some View {
        Text("0")
            .padding()
            .foregroundColor(lightMode ? Color.black : Color.white)
            .frame(maxWidth: .infinity, alignment: .trailing)
            .font(.system(size: 85, weight: .light))
            .lineLimit(1)
            .minimumScaleFactor(0.7)
    }
    
    private var keypadArea: some View {
        VStack {
            ForEach(buttonTypes, id: \.self) { row in
                HStack(spacing: Constants.padding) {
                    ForEach(row, id: \.self) { buttonType in ButtonHelper(buttonType: buttonType, lightMode: lightMode)
                    }
                }
            }
        }
    }
}


struct CalculatorView_Previews: PreviewProvider {
    static var previews: some View {
        CalculatorView()
    }
}


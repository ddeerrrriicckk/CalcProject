//
//  ButtonHelper.swift
//  Calculator
//
//

import Foundation
import SwiftUI

extension CalculatorView {
    struct ButtonHelper: View {
        
        let buttonType: ButtonType
        let lightMode: Bool
        var body: some View {
            Button(buttonType.description) {}
                .buttonStyle(CustomButtonStyle(
                    size: getButtonSize(),
                    backgroundColor: lightMode ? buttonType.backgroundColorLight : buttonType.backgroundColor,
                    foregroundColor: lightMode ? buttonType.foregroundColorLight : buttonType.foregroundColor,
                    buttonWide: buttonType == .digits(.zero),
                    lightMode: lightMode)
                )
        }
        
        private func getButtonSize() -> CGFloat {
            let screenWidth = UIScreen.main.bounds.width
            let buttonCount: CGFloat = 4.0
            let spacingCount = buttonCount + 1.0
            return (screenWidth - (spacingCount * Constants.padding)) / buttonCount
        }
    }
}

struct CalculatorView_ButtonHelper_Previews: PreviewProvider {
    static var previews: some View {
        CalculatorView()
    }
}

//
//  CustomTextLabel.swift
//  FitnessLogger
//
//  Created by Marcus August Christiansen on 29/09/2020.
//  Copyright © 2020 FitnessLogger. All rights reserved.
//

import SwiftUI

struct CustomTextLabel: View {
    
    let text : String
    let textSize : CGFloat
    let isTextBold : Bool
    let alignment : TextAlignment
    
    init(text: String, fontType : FontType = .normal, isBold : Bool = false, alignment : TextAlignment = .leading) {
        self.text = text
        
        switch fontType {
        case .normal:
            self.textSize = FontSize.normal
        case .heading:
            self.textSize = FontSize.heading
        }
        
        self.isTextBold = isBold
        self.alignment = alignment
    }
    
    var body: some View {
        Text(self.text)
            .foregroundColor(Color.blackWhite)
            .font(.custom(self.isTextBold ? Font.oswaldHeavy : Font.oswaldMedium, size: self.textSize))
            .multilineTextAlignment(self.alignment)
    }
}

//
//  CustomTextButton.swift
//  FitnessLogger
//
//  Created by Marcus August Christiansen on 29/09/2020.
//  Copyright © 2020 FitnessLogger. All rights reserved.
//

import SwiftUI

struct CustomTextButton: View {
    
    let action: () -> Void
    let label: String
    
    init(action: @escaping () -> Void, label: String ) {
        self.action = action
        self.label = label
    }
    
    var body: some View {
        CustomButton(action: self.action, label:
            Text(label)
                .foregroundColor(Color.whiteBlack)
                .font(.custom(Font.oswaldMedium, size: FontSize.button)
        ))
    }
}

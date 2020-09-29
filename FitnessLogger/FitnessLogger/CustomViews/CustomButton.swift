//
//  CustomButton.swift
//  FitnessLogger
//
//  Created by Marcus August Christiansen on 29/09/2020.
//  Copyright © 2020 FitnessLogger. All rights reserved.
//

import SwiftUI

struct CustomButton<Label>: View where Label : View {
    
    let action: () -> Void
    let label: Label
    
    var body: some View {
        
        Button(action: self.action) {
            self.label
                .frame(minWidth: 0, maxWidth: .infinity)
                .padding()
                .background(Color.blackWhite)
                .cornerRadius(5)
        }
        .buttonStyle(PlainButtonStyle())
    }
}

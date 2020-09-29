//
//  ContentView.swift
//  FitnessLogger
//
//  Created by Marcus August Christiansen on 29/09/2020.
//  Copyright © 2020 FitnessLogger. All rights reserved.
//

import SwiftUI

struct TempView: View {
    var body: some View {
        VStack {
            CustomTextLabel(text: "Tap the button")
            
            CustomTextButton(action: {
                print("Hello World!") 
                }, label: "Hello World!").padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        TempView()
    }
}

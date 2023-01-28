//
//  Buttons.swift
//  Life Simulator
//
//  Created by Trevor Bollinger on 12/31/22.
//

import SwiftUI

struct BlueButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(maxWidth: .infinity, maxHeight: 50)
            .foregroundColor(.blue)
            .background(.blue)
            .cornerRadius(15)
            .padding(.all)
    }
}




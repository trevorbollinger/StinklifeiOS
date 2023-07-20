//
//  Friend.swift
//  Stinklife
//
//  Created by Trevor Bollinger on 1/30/23.
//

import SwiftUI

class Friend: ObservableObject {
    
    
    init(name: String, gender: String){
        self.name = name
        self.gender = gender
    }

    @Published var name: String
    @Published var gender: String
    @Published var alive = true
    @Published var age = Int.random(in: 0..<1)

   
}

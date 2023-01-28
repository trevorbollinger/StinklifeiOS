//
//  Prtdon.swift
//  Life Simulator
//
//  Created by Trevor Bollinger on 12/24/22.
//

import SwiftUI

class Person: ObservableObject {
    
    @State var names = ["Trevor"]
    
    @Published var name = randomName()
    @Published var age = Int.random(in: 0..<1)
    @Published var needsCreation = false
    @Published var dead = false
    
    @Published var health = 100
    @Published var money = 500
    @Published var sexCount = 0
    
    
    func increaseAge() {
        self.age += 1
    }
    
    func ressurect() {
        @Binding var lines: [(text: String, type: String)]
        self.age = 0
        self.dead = false
        self.name = randomName()
        self.health = 100
        self.money = 500
        //self.needsCreation = true
        
    }
    
    
    
    
    
    
    
    
   
}

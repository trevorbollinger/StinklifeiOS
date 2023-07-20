//
//  Prtdon.swift
//  Life Simulator
//
//  Created by Trevor Bollinger on 12/24/22.
//

import SwiftUI

class Person: ObservableObject {
    
    
    @Published var items: [String] = [""]
    @Published var name = randomName()
    @Published var age = 0
    @Published var needsCreation = true
    @Published var dead = false
    @Published var alive = true
    @Published var health = 100
    @Published var money = 20
    @Published var sexCount = 0
    @Published var jailed = false
    @Published var deathChance = 1.001
    @Published var occupation = ""
    @Published var jailTime = 0
    @Published var spouse = ""
    
    @State var garbagePay = 50
    @State var plumberPay = 150
    @State var mayorPay = 500
    
    func increaseAge() {
        self.age += 1
        
        if (self.age >= 0 && self.age < 30){
            deathChance *= 1.08
        } else if (self.age >= 30 && self.age < 66) {
            deathChance *= 1.1
        } else if (self.age >= 66 && self.age < 90) {
            deathChance *= 1.112
        } else {
            deathChance *= 1.118
        }
        
        if self.occupation == "Stinktown Garbageman" {
            self.money += garbagePay
        }
        if self.occupation == "Shit Plumber" {
            self.money += plumberPay
        }
        if self.occupation == "Mayor of Stinktown"{
            self.money += mayorPay
        }
        
        if jailed {
            jailTime -= 1
        }

        
    }
    
    func ressurect() {
        @Binding var lines: [(text: String, type: String)]
        items = [""]
        name = randomName()
        age = 0
        needsCreation = true
        dead = false
        alive = true
        health = 100
        money = 20
        sexCount = 0
        jailed = false
        deathChance = 1.001
        occupation = ""
        jailTime = 0
        spouse = ""
    }
    


}
